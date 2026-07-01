---
name: ir-summary
description: >
  IR・決算資料を、指定アカウントの声（account.md / voice.md）で要約し、
  コンプラ自己チェック（compliance.md）を通してレビューキューに「下書き」を出す。
  投稿はしない（人間承認ゲートの手前まで）。SNS 運用 loop の gather→draft→verify を
  1コマンドでインライン実行する最小ハーネス。
when_to_use: >
  決算・IR資料を SNS 用に要約したいとき。マルくん@IR 等のアカウント運用で下書きを作るとき。
argument-hint: "[account=maru-ir] [media=x] <source: URL or 貼り付けテキスト>"
arguments:
  - name: account
    description: accounts/ 配下のアカウント名（既定 maru-ir）
  - name: media
    description: 媒体（既定 x）
  - name: source
    description: 要約対象の IR/決算ソース（URL または本文テキスト）
user-invocable: true
---

# ir-summary — IR要約の下書き生成スキル

設計した `accounts/<account>/<media>/` の状態を読み、loop の **gather → draft → verify** を
インラインで実行して **01_review_queue に下書きを1本**出す。**投稿は絶対にしない**（外向き・不可逆なので人間承認が必須）。
根拠は `llm` スキル references（loop/harness engineering）。

## 入力
- `account`（既定 `maru-ir`）/ `media`（既定 `x`）/ `source`（URL or テキスト、**任意**）。
- source が**未指定なら discovery（下記 1）で自分で探す**。指定ありなら discovery をスキップ。

## 手順

### 0. 文脈ロード（gather の前提）
次を Read する（記憶ゼロ始動を外部メモリで補う）:
- `${CLAUDE_PROJECT_DIR}/accounts/_family/voice-base.md` — family 共通規約（voice.md の継承元）
- `${CLAUDE_PROJECT_DIR}/accounts/<account>/account.md` — 声・方針・免責の核
- `${CLAUDE_PROJECT_DIR}/accounts/<account>/compliance.md` — 禁止事項
- `${CLAUDE_PROJECT_DIR}/accounts/<account>/<media>/state/voice.md` — 媒体別フォーマット
- `.../state/sources.md`（信頼ソース/ウォッチ対象）/ `.../state/posted.md`（重複回避）

### 1. discover（source 未指定時：IR を自分で探す）
- **鮮度ルール（必須）**: 対象は**開示日が today−3日以内**のものに限る（例 today=2026-07-01 なら 06-28〜07-01）。それより古い開示は原則スキップ。
- `sources.md` のウォッチ対象＋Web検索で、**直近3日の決算短信・適時開示・IR資料**の候補を数件挙げる。
- 各候補に **開示日**・**一次ソース URL**・要約妙味（何が動いたか）を1行で添える。
- `posted.md` と照合し**既出は除外**。**候補を提示してユーザーに選ばせる**（勝手に投稿はしない）。
  - ※ 事実として数字を出す前に、必ず一次ソースで裏取り。憶測で数字を作らない。

### 2. gather（事実抽出）
- source（指定 or discover で選んだもの）が URL なら WebFetch で取得。テキストならそのまま。**一次ソース優先**。
- 大きい調査が要るなら research sub-agent 相当を回してよいが、**要点だけ**を持ち帰る（context を汚さない）。

### 3. draft（voice で執筆）
- `voice.md` の**スレッド長文の型**で下書き:
  【話題/導入】→ 要点（箇条書き＝数字＋一言）→【小まとめ】→【つづき】→【総まとめ】→【結論】→ 免責。
  - ネタの多い決算は**フルスレッドで長め**（キオ君級の情報量）。単発イベント（自社株買い等）は短縮可。
- **トーンはマルくん**（`voice.md` トーン規約厳守）: やさしく・中立・まじめ。
  ミーム連打・**嘲笑・見下し・煽りはしない**。苦境企業でもバカにしない。
- **事実（数字）と解釈（本音翻訳）を明確に区別**。数字はソース値。1〜2 案。

### 4. verify（コンプラ自己チェック＝ゲートの手前）
下書きを `compliance.md` に照らし、**すべて満たすまで直す**:
- [ ] 特定銘柄の売買推奨・射幸/断定的将来予測が**ない**
- [ ] 数字・主張に**一次ソース**が紐づく
- [ ] 事実と解釈が区別されている
- [ ] AI要約である旨が担保されている（プロフィール前提。誤解を招く文脈なら投稿にも）
- [ ] `voice.md` の NG に触れていない
- チェック結果は下書きに**evidence として併記**（成功を主張せず根拠を示す）。

### 4b. 数字の独立レビュー（必須・verification subagent）
- **別の subagent** に、下書き内の**全数字を一次ソースと突合**させる（作業者≠採点者。fresh context で反証させる）[llm: S3/S6]。
- 各数字を VERIFIED / WRONG / UNVERIFIABLE で判定。**前回予想比 と 前期比 の取り違え**、**時点値の陳腐化**、**株式分割の調整漏れ**を特に見る。
- **WRONG があれば draft を直してから 5 へ**。UNVERIFIABLE は本文から落とすか「未確認」明記。突合結果はレビューファイルに残す。

### 5. 提出（投稿ディレクトリへ・投稿しない）
- **1投稿＝1ディレクトリ**で保存: `${CLAUDE_PROJECT_DIR}/accounts/<account>/<media>/01_review_queue/<YYYY-MM-DD>-<slug>/`
  - `post.md` — 下書き本文（案）＋ 使った一次ソース ＋ コンプラチェック結果 ＋ 未確認点。
  - `source-*.png` — **一次ソース開示PDFの該当ページ全体**を画像化して同梱（部分クロップしない・原本改変なし）。
    - 作り方の例: PDF を `curl` 取得 → `qlmanage -t -s 1600 -o <dir> x.pdf` でページ画像化 → 投稿ディレクトリに保存。
- **ここで停止**。ユーザーの承認を待つ。投稿・API 送信はしない。

### 6. record（state 遷移・人間指示で）
配信パイプラインは番号順の3 state（sortable）: **`01_review_queue` → `02_approved` → `03_posted`**。
- **承認された**（例「OK / 次の state へ」）→ **投稿ディレクトリごと** `01_review_queue/` から **`02_approved/`** へ move（post.md＋画像を一緒に）。`state/posted.md` に `state=approved` で追記（重複回避用）、`state/progress.txt` を更新。
- **実際に X 投稿した**と伝えられたら → 投稿ディレクトリごと `02_approved/` から **`03_posted/`** へ move。`post.md` 冒頭と `state/posted.md` に **投稿URL**を記録（`state=posted`）。
- **差し戻し** → 理由を `progress.txt` に残し、`01_review_queue/` に留めて再 draft（self-correction）。

### 7. 資産化（記録のみ。設計・管理は hisho）
- 本スキルは毎ループの**記録**に徹する: 使った信頼ソース→`sources.md`、体裁フィードバック→`voice.md`、申し送り→`progress.txt`。
- **「loop で asset をどう育てるか」の設計・定期見直し**（sources の精選、voice の統廃合、アカウント横断の学び）は **`hisho` が担う**。

## ルール
- **投稿しない**。01_review_queue まで。publish は人間の承認ゲート。
- **英語公式ソース準拠の設計**に従い、断定できない点は残して伝える。
- 状態は必ずファイル経由（会話の記憶に頼らない）。
