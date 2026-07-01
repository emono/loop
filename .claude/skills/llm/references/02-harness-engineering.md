# 02. Harness エンジニアリング

出典: [S7][S6][S1][S10][S2][S3][S11]（→ [sources.md](./sources.md)）

## Agentic harness の定義 [S7]

> 「Claude Code は Claude を包む **agentic harness** であり、言語モデルを有能な coding agent に変える tools・context management・execution environment を提供する」。

## Agent loop（正確な表現）

- Agent SDK: **`gather context → take action → verify work → repeat`**。[S6]
- How Claude Code works: 3フェーズ `gather context / take action / verify results` が「混ざり合い」、Claude は前ステップの学びから次を決め「数十のアクションを連鎖させ、**途中で course-correct（軌道修正）する**」。[S7]
- 根拠: 各ステップで環境から **ground truth**（tool 結果・code 実行結果）を得ることが決定的。[S2]
- Client SDK の手動 tool loop（`while stop_reason == "tool_use"`）に対し、Agent SDK は**ループを harness に内蔵**（"Claude handles it"）。[S8]

## Context engineering（prompt engineering の後継規律）[S1]

- 定義:「**推論中に最適な token 集合を curate・維持する戦略群**」。system 指示・tools・MCP・外部データ・履歴すべてが対象。
- ヒューリスティック:「**望む結果の likelihood を最大化する、high-signal token の *最小* 集合を見つける**」。
- なぜ重要か: context は **finite resource with diminishing marginal returns**。「新しい token は毎回 attention budget を消費」→ **context rot**（token 増で正確な想起力が低下）。
- **Right altitude**: system prompt は「Goldilocks zone」— 具体的すぎる hardcode でも、抽象的すぎる vague でもない、強いヒューリスティックを与える高度。

## Tool 設計（ACI の具体）[S10]

- ツールは「**deterministic system と non-deterministic agent の contract**」という新種のソフトウェア。
- **「More tools don't always lead to better outcomes」** — 全 API を包むな。高インパクトな workflow に絞った少数の thoughtful なツールを。
- **Consolidation**（複数操作を1ツールに束ねる）/ **Namespacing**（`asana_search` のような接頭辞でグループ化）。
- **Token 効率**: Claude Code は tool 応答を **既定25,000 token に制限**。pagination・range・filter・truncation・`ResponseFormat`（concise/detailed）で調整。
- **High-signal のみ返す**。opaque な UUID より **自然言語の識別子**の方が精度が上がる。
- **error message は feedback**:「具体的で実行可能な改善」を伝えるプロンプト化されたエラーに。
- **エージェントに自分のツールを改善させる**: eval transcript を Claude Code に貼れば一括で refactor できる。

## System prompt / environment / affordance

- affordance の中核 = 「give your agents a computer」（files・bash・code 実行・MCP）。[S6]
- Claude Code では **CLAUDE.md** が毎会話冒頭でロードされる永続 context。[S3]
  - 「コードから推論できない bash コマンド・code style・workflow ルール」を入れる。**短く human-readable に**。剪定基準:「これを消したら Claude が間違える? 否なら削る」。
  - **「肥大した CLAUDE.md は実際の指示を無視させる」**。`IMPORTANT` / `YOU MUST` で adherence を強調可。
  - 時々しか要らない知識は **Skills**（`SKILL.md`）へ = just-in-time の製品化。

## Permission model（harness の安全境界）[S11]

- 3種のルール: **Allow**（承認不要）/ **Ask**（都度確認）/ **Deny**（禁止）。評価順は **deny → ask → allow**（先勝ち、specificity は順序に影響しない）。「**ルールはモデルではなく Claude Code が強制する**」= 境界はプロンプトでなく harness。
- SDK の6段パイプライン: Hooks → Deny → Ask → permission mode → Allow → `canUseTool` callback。
- Permission modes: `default` / `acceptEdits`（編集と `mkdir`/`mv`/`cp` 等を自動承認）/ `plan`（読み取り専用探索、編集は allow 一致でも自動承認しない）/ `bypassPermissions`（`rm -rf /` 等は circuit breaker で残る）/ `dontAsk`（事前承認以外は自動 deny、headless 向き）/ `auto`（research preview、**別の classifier model** が危険な行為だけブロック）。
- PreToolUse hook が最上流。**exit code 2 は permission 評価前に tool 呼び出しを止める**。

## Verification & feedback loop（最重要の実務原則）[S3][S6]

- 「Claude は *looks done* で止まる。**チェックが無ければあなたが検証ループになる**。pass/fail を返すものを与えれば、Claude が実行→チェック→結果を読む→**通るまで反復**し、ループは自律的に閉じる」。
- feedback の優先順位（S6）: **(1) rules-based**（明確なルール + どのルールがなぜ失敗したか）> **(2) visual**（screenshot / UI レンダリング）> **(3) LLM as judge**（別モデルに fuzzy 判定させる）。
- gate 強度のエスカレーション（S3）: プロンプト内で実行 → `/goal` 条件を毎ターン別 evaluator が再チェック → **Stop hook**（決定的ゲート。ただし **連続8ブロックでターン終了**）→ **verification subagent**（作業者と採点者を分離、fresh context で反証させる）。
- 「成功を主張させず **evidence を示させる**」（test 出力・実行コマンドと戻り値・screenshot）。
- 失敗パターン **trust-then-verify gap**:「検証できないなら ship するな」。
