# CLAUDE.md — このリポジトリの索引

この repo は **SNS/YouTube 運用を agentic loop で回す**プロジェクト。ここは常時ロードされる
索引（overview）。手順は書かず、facts と「どこを見るか」だけを置く。詳細は各リンク先へ。

## 構造（account > 媒体 > state）

- **アカウント状態（外部メモリ）** → `accounts/<account>/`（例 `maru-ir` / `maru-ai`）
  - 声・方針・免責の核 → `accounts/<account>/account.md`
  - 禁止事項 → `accounts/<account>/compliance.md`
  - family 共通規約（voice の継承元） → `accounts/_family/voice-base.md`
  - 媒体別フォーマット → `accounts/<account>/<媒体>/state/voice.md`
  - 信頼ソース → `.../state/sources.md` / 重複回避 → `.../state/posted.md` / 申し送り → `.../state/progress.txt`
- **配信パイプライン（3 state・番号順）**: `01_review_queue` → `02_approved` → `03_posted`
  - 1投稿 = 1ディレクトリ（`post.md` ＋任意で `source-*.png`）

## スキルの使い分け

- **IR/決算の要約下書き** → `ir-summary` skill（例 `maru-ir`）
- **AIニュース速報の下書き** → `ai-news` skill（例 `maru-ai`）
- **秘書タスク・資産化の設計** → `hisho` skill（`/hisho`）
- **エージェント/ループ/harness の設計知識** → `llm` skill（`references/` に progressive disclosure）
- **loop の全体設計メモ** → `.hisho/notes/2026-07-01-11-17-03-sns-youtube-loop-engineering-design.md`

## 運用ルール（重要）

- **投稿しない = 人間承認ゲート**。要約ループは `01_review_queue` に下書きを出すところで**必ず停止**。
  publish（X 投稿・外部 API 送信）は人間が承認して初めて行う。外向き・不可逆なので例外なし。
- **個別株の投資勧誘・売買推奨をしない**（各 `compliance.md` 厳守）。憶測数字は出さず必ず一次ソースで裏取り。
- 要約・投稿ドラフト・アカウント運用は**自前で書き起こさずドメインスキル（ir-summary / ai-news）を使う**。
- スタイルの唯一の記憶は各 `voice.md`。トーン・体裁のフィードバックは会話でなく **voice.md に焼き込む**（次ループが自動反映）。
- **資産化（sources 精選 / voice 統廃合 / account 横断の学び）の設計・定期見直しは `hisho` の担当**。スキルは毎ループの記録に徹する。
