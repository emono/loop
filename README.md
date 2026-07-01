# loop — SNS/コンテンツ運用を agentic loop で回すプロジェクト

「調べる→書く→検証する→人が承認→配信する」を、アカウントの声を保ったまま**ループで回す**仕組み。
各実行は記憶ゼロで始まるので、状態は全部ファイル（外部メモリ）に持たせて再現性を担保する。

## 全体像

```
loop/
├── README.md                     ← これ（全体地図）
├── accounts/                     ← 運用アカウント（外部メモリ＝状態の source of truth）
│   ├── _family/voice-base.md     ← 全アカウント共通の voice/品質規約（唯一の源）
│   ├── maru-ir/                  ← マルくん@IR要約（個別株IRの要約・X）
│   ├── maru-ai/                  ← まるくん@AI速報（生成AIニュース速報・X, @marukun_ai）
│   └── feeed/                    ← プレスリリース発行主体（pr/）
├── .claude/skills/               ← ループを動かすスキル群
└── .hisho/                       ← 秘書(hisho)のワークスペース（notes に設計書）
```

## アカウントの構造（account > 媒体 > state）

```
accounts/<account>/
├── account.md                    ← 声・方針・免責の核（媒体共通）
├── compliance.md                 ← 禁止事項（例: 個別株は売買推奨しない）
└── <媒体: x | pr | youtube>/
    ├── state/                    ← 外部メモリ
    │   ├── voice.md              ← 媒体別の型・語り口（_family/voice-base.md を継承）
    │   ├── sources.md            ← 信頼ソース＋鮮度ルール（3日以内）※ループで蓄積
    │   ├── posted.md             ← 配信ログ（重複回避）
    │   ├── calendar.md           ← 投稿予定・コンテンツ柱（backlog）
    │   └── progress.txt          ← セッション間の申し送り
    ├── 01_review_queue/          ← 下書き（未承認）
    ├── 02_approved/              ← 承認済み・配信待ち
    └── 03_posted/ (or 03_published/)  ← 配信済み（投稿URL記録）
```

- **1投稿 = 1ディレクトリ**（`<slug>/post.md` ＋ 一次ソース画像）。承認・配信で**ディレクトリごと** state 間を move。

## スキル（`.claude/skills/`）

| スキル | 役割 |
| --- | --- |
| **hisho** | 秘書・司令塔。依頼を捌き、ドメイン別スキルに委譲。**資産化（loop で asset を育てる）の設計・管理を担う** |
| **llm** | Claude Code / エージェント設計の知識源（loop/harness/context engineering、`references/`） |
| **ir-summary** | IR/決算を account の声で要約 → 下書き（マルくん@IR 等） |
| **ai-news** | 生成AIニュースを速報要約 → 下書き（まるくん@AI速報） |
| **press-release** | 自社ニュースをプレスリリース化 → 下書き（feeed 等） |

## ループの流れ（共通ハーネス）

```
discover(3日鮮度) → gather(一次ソース) → draft(voice準拠) → verify(コンプラ自己チェック)
   → 数字の独立レビュー(別AIが一次ソースと突合)
   → 【人間承認ゲート】01_review_queue → 02_approved
   → 配信(claude-in-chrome で投稿) → 03_posted（URL記録）
   → record & 資産化(sources/voice/progress に還元)  → repeat
```

- **投稿は必ず人間承認ゲートを通す**（外向き・不可逆）。個別株は投資勧誘・売買推奨をしない。
- **配信手段**：当面は claude-in-chrome（ブラウザ自動化）で半自動投稿。将来 X API。

## 使い方（ざっくり）
- 要約したい → `ir-summary` / `ai-news` / `press-release` を呼ぶ（自前で書き起こさない）。
- スタイルを変えたい → 共通は `accounts/_family/voice-base.md`、媒体固有は各 `voice.md` を直す（会話でなくファイルに焼く＝次ループが自動反映）。
- 設計の詳細 → `.hisho/notes/2026-07-01-11-17-03-sns-youtube-loop-engineering-design.md`、思想/ハーネスは `llm` スキル references。
