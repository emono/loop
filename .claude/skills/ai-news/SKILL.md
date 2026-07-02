---
name: ai-news
description: >
  AI関連の最新ニュース（新モデル/研究/プロダクト/資金調達/規制）を、指定アカウントの声
  （account.md / voice.md）で速報要約し、出典・数字の独立レビューを通して投稿ディレクトリに
  「下書き」を出す。投稿はしない（人間承認ゲートの手前まで）。まるくん@AI速報 の運用ループ。
when_to_use: >
  AIニュースを SNS 用に速報要約したいとき。まるくん@AI速報（maru-ai）の運用で下書きを作るとき。
argument-hint: "[account=maru-ai] [media=x] <source: URL or 貼り付けテキスト（任意）>"
arguments:
  - name: account
    description: accounts/ 配下のアカウント名（既定 maru-ai）
  - name: media
    description: 媒体（既定 x）
  - name: source
    description: 要約対象の AIニュース（URL または本文。未指定なら discovery で探す）
user-invocable: true
---

# ai-news — AI速報の下書き生成スキル

`accounts/<account>/<media>/` の状態を読み、loop の **gather → draft → verify** を実行して
投稿ディレクトリに下書きを出す。**投稿は絶対にしない**（人間承認ゲートの手前）。
IR は別スキル（`ir-summary`）。本スキルは AIニュース速報専用。設計知識は `llm` スキル references。

## 手順

### 0. 文脈ロード
Read する: `accounts/_family/voice-base.md`（共通規約＝voice.md の継承元）・`accounts/<account>/account.md`・`compliance.md`・`<media>/state/voice.md`・`sources.md`・`posted.md`。

### 1. discover（source 未指定時）
- **鮮度ルール（必須）**: 発表が **today−3日以内**（できれば24〜48h）。それより古いネタはスキップ。
- 対象: 新モデル/機能リリース・注目論文・主要プロダクト・大型資金調達・AI規制/政策。
- `sources.md`（公式ブログ/論文/信頼メディア）＋Web検索で候補を数件。各候補に**発表日・一次ソースURL・妙味**。
- `posted.md` と照合し既出を除外。**候補を提示してユーザーに選ばせる**（憶測数字は作らない）。

### 2. gather
- source（URL/テキスト）から事実抽出。**一次ソース優先**（公式ブログ/リリース/論文）。
- 大きい調査は sub agent に隔離してよいが、要点だけ持ち帰る。

### 3. draft（voice で執筆）
- `voice.md` の型: **【速報】1行**（誰が何を＋日付）→ 補足1行 →【…】見出しの要点（スペック/数字）→【ポイント】(解釈)→ ソース(一次URL)。
- トーンは maru-ai（ポップ・勢い、**誇張/ステマなし**）。プレーンテキスト・絵文字なし・見出しは【…】・番号ラベルなし。
- **事実（何が出た）と解釈（すごさ/重要性）を分離**。噂・リークは「噂/未確認」と明記。

### 4. verify（コンプラ自己チェック）
`compliance.md` に照らし満たすまで直す: 出典あり／噂の明示／**誇張・ステマなし**／事実と解釈の区別／AI生成はプロフィール担保／NG非該当。

### 4b. 数字の独立レビュー（必須・verification subagent）
- **`fact-checker` agent**（`.claude/agents/`）に本文の全数字・主張を**一次ソースと突合**させる（作業者≠採点者・fresh context）[llm: S3/S6/S12]。
- ベンチは**名称と出典**を特に確認（公式が画像表なら二次由来と区別。「公式値」と断定しない）。
- WRONG/UNVERIFIABLE は直すか本文から落とす。結果は post.md に残す。

### 5. 提出（投稿ディレクトリへ・投稿しない）
- **1投稿=1ディレクトリ**: `accounts/<account>/<media>/01_review_queue/<YYYY-MM-DD>-<slug>/`
  - `post.md`（本文案＋一次ソース＋チェック結果＋未確認点）＋ 任意で `source-*.png`（公式図/ベンチ表の原本、改変なし）。
- **停止**してユーザーの承認を待つ。

### 6. record（state 遷移・人間指示で）
3 state: **`01_review_queue` → `02_approved` → `03_posted`**。
- 承認 → 投稿ディレクトリごと `02_approved/` へ。`posted.md`（state=approved）・`progress.txt` 更新。
- 投稿済み → `03_posted/` へ。`post.md` 冒頭と `posted.md` に投稿URL（state=posted）。
- 差し戻し → 理由を `progress.txt` に残し再 draft。

## ルール
- **投稿しない**（人間承認ゲート）。**憶測数字を出さない／必ず裏取り**。
- **資産化（sources/voice をループで育てる）の設計・管理は `hisho` が担う**（本スキルは記録のみ）。
