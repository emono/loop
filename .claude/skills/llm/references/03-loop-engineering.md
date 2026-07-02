# 03. Loop エンジニアリング（反復ループそのものの設計）

出典: [S1][S2][S3][S5][S6][S7][S8][S9][S12]（→ [sources.md](./sources.md)）

## ループの形

`gather context → take action → verify work → repeat`（詳細は [02-harness-engineering.md](./02-harness-engineering.md)）。[S6][S7]

## ループの4類型（trigger / stop / primitive で選ぶ）[S12]

Claude Code チームの定義: **loop = stop 条件を満たすまで作業サイクルを繰り返す agent**。「**一番シンプルな解から始め、selectively に使う**（全タスクに複雑な loop は不要）」。

| 類型 | trigger | stop 条件 | 適する仕事 | 手放すもの / primitive |
| --- | --- | --- | --- | --- |
| **Turn-based** | ユーザーの1プロンプト | Claude が完了 or 追加 context 要と判断 | 短く・定常でない単発 | "check"（検証を skill 化して自己検証を厚く）|
| **Goal-based** | 手動プロンプト（実時間）| **目標達成 or 最大ターン到達** | 検証可能な exit 基準がある | "stop 条件"（`/goal`。**evaluator モデルが条件を判定**し未達なら継続）|
| **Time-based** | 指定インターバル | キャンセル or 完了（PR merge・queue 空）| 定常反復・外部システム連携 | "trigger"（`/loop`=自機・`/schedule`=cloud routine）|
| **Proactive** | イベント/スケジュール（実時間の人間なし）| 各タスクは goal 達成で exit、routine は停止まで継続 | 定義の明確な反復流（issue triage・migration 等）| "prompt"（`/schedule`+`/goal`+skills+dynamic workflows+auto mode を合成）|

- **Goal-based の勘所**: 「done の定義」を渡すと Claude が早期終了を自己判断しなくて済む。**deterministic な基準**（テスト通過数・スコア閾値）が最も効く。例 `/goal get the homepage Lighthouse score to 90 or above, stop after 5 tries`。
- **Time-based**: 「タスクは同じで input だけ変わる」定常作業（毎朝 Slack 要約）や、外部状態を interval で見て反応する用途（PR の review/CI）。`/loop` は自機依存（切ると止まる）→ cloud 化は `/schedule`。
- **Proactive**: 「小さく速いモデルに routine を流し、判断所だけ最も有能なモデル」。auto mode で権限確認に止まらず走らせる。**pilot（小さいスライスで試す）してから大規模化**。

### 品質と token を保つ（loop を回す前提）[S12]
- **品質**: codebase を綺麗に保つ（Claude は既存 pattern に倣う）/ 「good の姿」を skill で符号化し**自己検証**させる / docs を届く所に置く / **fresh context の second agent でレビュー**（`/code-review` 等、主 agent の推論に引きずられず bias が減る）/ **個別 fix で止めず system に還元**（次回以降の全反復を改善）。
- **token**: 仕事に対し **正しい primitive と model** を選ぶ（小タスクに多 agent/loop 不要）/ 明確な success・stop 基準 / **大規模 run 前に pilot** / 決定的作業は **script 化**（都度推論より安い）/ routine を必要以上に回さない（対象の変化頻度に interval を合わせる）/ **`/usage`・引数なし `/goal`・`/workflows` で使用量を確認**。

## Context 管理（ループの生命線）

- Claude Code の全 best practice は1つの制約に集約:「**context window はすぐ埋まり、埋まるほど性能が落ちる**」。[S3]
- **Compaction**:「context 上限に近づいた会話を **要約して新しい context window で再開**」。「architectural decisions・未解決 bug・実装詳細を残し、冗長な tool 出力を捨てる」。[S1]
  - Claude Code は自動 compact。「まず古い tool 出力を消し、必要なら会話を要約。**序盤の詳細な指示は失われうる** → 永続ルールは CLAUDE.md へ」。[S7]
  - `/compact <instructions>`（例: `Focus on the API changes`）で制御。[S3]
  - **thrashing 停止条件**: 1ファイル/出力が巨大で要約直後に埋まり直す場合、「**数回で auto-compact を止めてエラー表示**（ループ回避）」。[S7]
- **手動の context 衛生**: タスク間は `/clear` を頻繁に。「同じ問題で2回以上訂正したら `/clear` して作り直す。**訂正が積もった長いセッションより、良いプロンプトのクリーンなセッションがほぼ常に勝つ**」。[S3]
- Developer Platform の別機構（Claude Code の要約 compaction とは別物）: **Context editing**（上限接近時に **stale な tool 呼び出し/結果を削除**）+ **Memory tool**（context 外の **file ベース**永続メモリ）。自社 eval で memory+context editing が **+39%**、context editing 単体 **+29%**、100ターンで **token −84%**（※単一ソースの自社ベンチ）。[S9]

## Self-correction / evaluation-driven 反復

- **Evaluator-optimizer**:「生成役と評価・feedback 役をループさせる」。明確な評価基準があり反復改善が測定可能な価値を持つとき有効。[S2]
- test-driven / eval-driven:「片方の Claude にテストを書かせ、別の Claude に通させる」「失敗するテストで再現→修正」。[S3]
- **fan-out での洗練**:「最初の **2〜3ファイル**で何が失敗するか見てプロンプトを直してから全件に流す」。[S3]
- **過剰反復への警告**:「gap を探せと言われた reviewer は健全な仕事でも何か報告する。**全指摘を追うと over-engineering**。correctness / 要件に関わる gap だけ flag させ、他は optional 扱いに」。[S3]

## Long-horizon（context window を跨ぐ実行）[S1][S5]

- 問題:「long-horizon タスクは **token 数が context window を超える**中で coherence・context・目標指向を保つ必要」。「各セッションは前の記憶ゼロで始まる」。
- **Strategy A — structured note-taking / 外部メモリ**:「context 外のメモリに定期的に notes を書き、後で pull back する」。例:「Claude Code の to-do リスト」「**NOTES.md** の維持」。長時間 harness の実物: **`claude-progress.txt`**（作業ログ）+ 構造化 JSON の feature list（pass/fail が source of truth）+ git commit log で状態復元。**initializer agent**（初期環境構築）+ **coding agent**（次セッション用に成果物を残しつつ漸進）の二段構成。セッション開始儀式:「progress ノートと git log を読み、dev server で basic test を走らせ未文書化 bug を検出」。
- **Strategy B — sub-agent 分離**:「専用 sub-agent が **clean context window** で集中タスクを処理し、**凝縮した要約だけを返す**」。「subagent は隔離された context を使い orchestrator に関連情報のみ返す」。**「context が根本制約である以上、subagent は最強のツールの一つ」**。[S3]
- **Strategy C — just-in-time / agentic search**:「全データを前処理せず、**lightweight identifiers**（file path・query・link）を持ち、実行時に tool で動的にロード」。「semantic search は速いが agentic search より不正確で維持が難しい」。
- 変遷フラグ: 新しめのモデル（Opus 4.5）は long-horizon が改善し「**context anxiety を自ら減らす**」。ただし外部メモリ + harness 設計は依然必要（※この語は検索要約由来で本文 verbatim 未再確認）。[S5]

## インターバル / 定期・headless ループ [S3][S8]

- **Headless**: `claude -p "..."` でセッション無しの非対話実行 = 「CI pipeline・pre-commit hook・任意の自動化への統合手段」。出力 `--output-format text|json|stream-json --verbose`。
- **イベント駆動**: GitHub issue 作成時などに起動。公式 Claude Code repo は新規 issue に Claude で label 付与。
- **プログラム的ループ / fan-out**:「タスクを回して各々 `claude -p` を呼ぶ。`--allowedTools` で権限を絞る」。
  ```bash
  for file in $(cat files.txt); do
    claude -p "Migrate $file ... Return OK or FAIL." --allowedTools "Edit,Bash(git commit *)"
  done
  ```
  大規模移行は「多数の並列 Claude 呼び出しに分散」。
- **無人自律**: `claude --permission-mode auto -p "fix all lint errors"`。「`-p` の auto は classifier が繰り返しブロックすると、fallback する人間がいないので abort」。
- 製品面: 定期実行の **`/loop`** skill と cron 的な **`/schedule`（routines）**。

## いつ・どう反復するか / drift 回避 / 停止条件

- ループを使うべき場面:「**必要ステップ数を予測できず固定パスを hardcode できない open-ended 問題**」かつ「その判断をある程度信頼できる」とき。代償は cost と compounding errors。[S2]
- 明示的停止条件:「**最大反復回数などの stopping condition**」「checkpoint や blocker で人間の判断を仰ぐ」。Stop hook は連続8ブロックで終了。長時間 harness は「careful testing 後のみ passing 印」「**テストの削除・改変は不可**」。[S2][S3][S5]
- drift させないための型（S3）:
  - **Explore → Plan → Implement → Commit** の4フェーズ（いきなり code させると「間違った問題を解く」）。
  - **早めの course-correct**:「tight feedback loop が最良。早く直す方が速く良い解に至る」。`Esc` / `Esc Esc`・`/rewind`・"Undo that"・`/clear`。
  - 名前付き失敗パターン: **kitchen sink session**（無関係タスクで context 汚染→`/clear`）/ **correcting over and over**（2回失敗訂正で `/clear`）/ **over-specified CLAUDE.md** / **trust-then-verify gap** / **infinite exploration**（数百ファイル読んで context を埋める→スコープを絞るか subagent へ）。
  - 判断が規則に勝つ:「1つの複雑な問題に深く入っているなら context を蓄積させるべき時もある。ガイドに書けない直感が育つ」。

## 名前付きパターン索引

`the agentic loop` / `agentic harness` / context engineering（**context rot** / finite resource）/ compaction vs context editing vs memory tool / **structured note-taking**（to-do・NOTES.md・claude-progress.txt）/ evaluator-optimizer・verification subagent・LLM as judge / just-in-time・agentic vs semantic search / checkpoints・`/rewind` / initializer+coding 二段 harness / `claude -p` fan-out・writer/reviewer。
