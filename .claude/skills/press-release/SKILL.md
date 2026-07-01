---
name: press-release
description: >
  自社・自プロダクトの発表ネタから、指定発行主体の体裁（company.md / pr/state/voice.md /
  templates.md）でプレスリリースの下書きを起こし、コンプラ自己チェック（compliance.md）と
  数字・固有名詞の独立レビューを通して review_queue に「下書き」を出す。配信はしない
  （人間承認ゲートの手前まで）。gather→draft→verify を1コマンドでインライン実行する最小ハーネス。
when_to_use: >
  新機能/ローンチ/提携/資金調達/受賞などの自社ニュースをプレスリリース化したいとき。
  feeed 等の発行主体でリリース下書きを作るとき。
argument-hint: "[account=feeed] [media=pr] <発表ネタ: 箇条書きの事実 or 貼り付け資料>"
arguments:
  - name: account
    description: accounts/ 配下の発行主体名（既定 feeed）
  - name: media
    description: 媒体（既定 pr）
  - name: source
    description: 発表の事実ソース（社内メモ/仕様/数字。URL でもテキストでも可）
user-invocable: true
---

# press-release — プレスリリース下書き生成スキル

`accounts/<account>/<media>/` の状態を読み、loop の **gather → draft → verify** をインラインで実行して
**01_review_queue にリリース下書きを1本**出す。**配信・公開は絶対にしない**（外向き・不可逆なので人間承認が必須）。
ir-summary との違いは「外部資料の要約」ではなく **自社発表を一次文書として起草**する点。根拠は `llm` スキル references（loop/harness engineering）。

## 入力
- `account`（既定 `feeed`）/ `media`（既定 `pr`）/ `source`（発表の事実。**任意**）。
- source が**未指定なら intake（下記 1）でユーザーに事実を確認**してから進む。**事実を捏造しない**。

## 手順

### 0. 文脈ロード（gather の前提）
次を Read する（記憶ゼロ始動を外部メモリで補う）:
- `${CLAUDE_PROJECT_DIR}/accounts/<account>/company.md` — 会社概要・boilerplate・広報連絡先の核
- `${CLAUDE_PROJECT_DIR}/accounts/<account>/compliance.md` — 禁止事項（景表法/薬機法/誇大表現など）
- `${CLAUDE_PROJECT_DIR}/accounts/<account>/<media>/state/voice.md` — リリースのトーン規約
- `${CLAUDE_PROJECT_DIR}/accounts/<account>/<media>/state/templates.md` — 標準PR構成の型
- `.../state/posted.md`（既出/重複回避）/ `.../state/progress.txt`（申し送り）

### 1. intake（発表の事実を確定）
- 発表要旨を **5W1H** で固める: **誰が（発行主体）・いつ（提供/開始日）・何を・どこで・なぜ・どうやって**。
- 必須の事実チェック: 製品/機能名、提供開始日、価格・料金、対象/提供地域、主要スペック・数字、引用コメント（誰の発言か）、画像素材の有無。
- **不明・未確定の事実は勝手に埋めない**。ユーザーに確認するか、下書きに `【要確認】` として明示して残す。
- `posted.md` と照合し、同一発表の重複がないか確認。

### 2. gather（事実の裏取り）
- source が URL なら WebFetch で取得。数字・固有名詞・日付は**一次情報（社内仕様/公式）優先**で確定。
- 他社比較・最上級表現（「世界初」「業界最速」等）を使う場合は**根拠データを必ず確保**（無ければ使わない）。
- 大きい調査が要るなら research sub-agent 相当を回してよいが、**要点だけ**を持ち帰る（context を汚さない）。

### 3. draft（templates + voice で起草）
`templates.md` の標準構成で下書き:
- **タイトル**（見出し・約30字）＋ **サブタイトル**（補足1行）
- **リード文**（発表要旨：誰が・いつ・何を・意義を1〜2段落）
- **本文**（背景 → 詳細/特徴 → スペック・価格・提供開始日）
- **役員/担当コメント**（引用。発言者の役職名を明記）
- **画像/図版**の指定（あれば `image-*` として同梱、キャプション付き）
- **会社概要**（company.md の boilerplate をそのまま）
- **本件に関するお問い合わせ先**（報道関係者向け＋必要なら一般向け）
- **配信日／解禁日時（エンバーゴ）**の指定
- トーンは `voice.md` 規約厳守（公式・簡潔・誇張しない）。**事実と主観的評価を区別**。1〜2案。

### 4. verify（コンプラ自己チェック＝ゲートの手前）
下書きを `compliance.md` に照らし、**すべて満たすまで直す**:
- [ ] 優良誤認・有利誤認（景表法）に当たる断定/誇大表現が**ない**、No.1・最上級表現は**根拠が明記**されている
- [ ] 薬機法・医療/健康・金融などの規制表現に断定・効能効果の誇張が**ない**
- [ ] 数字・日付・固有名詞・価格・スペックに**一次ソース**が紐づく
- [ ] 事実と評価/展望が区別され、将来見通しは断定になっていない
- [ ] 引用コメントの発言者・役職が正確、他社名/商標/肖像の扱いが適切
- [ ] `【要確認】` の未確定事項が本文に残っていない（残す場合は提出メモに明示）
- チェック結果は下書きに **evidence として併記**（成功を主張せず根拠を示す）。

### 4b. 数字・固有名詞の独立レビュー（必須・verification subagent）
- **別の subagent** に、下書き内の**全数字・固有名詞・日付を一次ソースと突合**させる（作業者≠採点者。fresh context で反証させる）[llm: S3/S6]。
- 各項目を VERIFIED / WRONG / UNVERIFIABLE で判定。**製品名の表記ゆれ**、**価格の税込/税抜**、**提供開始日の取り違え**、**根拠なき最上級表現**を特に見る。
- **WRONG があれば draft を直してから 5 へ**。UNVERIFIABLE は本文から落とすか `【要確認】` 明記。突合結果はレビューファイルに残す。

### 5. 提出（review_queue へ・配信しない）
- **1リリース＝1ディレクトリ**で保存: `${CLAUDE_PROJECT_DIR}/accounts/<account>/<media>/01_review_queue/<YYYY-MM-DD>-<slug>/`
  - `release.md` — リリース本文（案）＋ 使った一次ソース ＋ コンプラチェック結果 ＋ `【要確認】` 一覧。
  - `image-*.png` 等 — 添付予定の画像素材（**原本のまま**・改変なし・キャプション別記）。
- **ここで停止**。ユーザーの承認を待つ。配信・PR TIMES 等への送信はしない。

### 6. record（state 遷移・人間指示で）
配信パイプラインは番号順の3 state（sortable）: **`01_review_queue` → `02_approved` → `03_published`**。
- **承認された**（例「OK / 次の state へ」）→ **リリースディレクトリごと** `01_review_queue/` から **`02_approved/`** へ move。`state/posted.md` に `state=approved` で追記、`state/progress.txt` を更新。
- **実際に配信/公開した**と伝えられたら → ディレクトリごと `02_approved/` から **`03_published/`** へ move。`release.md` 冒頭と `state/posted.md` に **公開URL/配信日**を記録（`state=published`）。
- **差し戻し** → 理由を `progress.txt` に残し、`01_review_queue/` に留めて再 draft（self-correction）。

### 7. 資産化（記録のみ。設計・管理は hisho）
- 本スキルは毎ループの**記録**に徹する: 使った一次ソース→`sources.md`、体裁フィードバック→`voice.md`/`templates.md`、申し送り→`progress.txt`。
- **「loop で asset をどう育てるか」の設計・定期見直し**（テンプレ精選、voice の統廃合、発行主体横断の学び）は **`hisho` が担う**。

## ルール
- **配信しない**。01_review_queue まで。publish は人間の承認ゲート。
- **事実を捏造しない**。未確定は `【要確認】` で残して伝える。
- 根拠なき最上級表現・誇大表現は使わない（景表法）。
- 状態は必ずファイル経由（会話の記憶に頼らない）。
