---
paths:
  - "accounts/**/01_review_queue/**"
  - "accounts/**/02_approved/**"
  - "accounts/**/03_posted/**"
---

# SNS/IR 下書きのコンプラ共通ベースライン

投稿ディレクトリ（`01_review_queue` / `02_approved` / `03_posted`）配下を読み書きする間、
以下を常に満たす。**個別規定の最終権威は各 `accounts/<account>/compliance.md` と `<media>/state/voice.md`**（本ルールは全アカウント共通の下限）。

- **投稿しない＝人間承認ゲート**。state の move（`01_review_queue → 02_approved → 03_posted`）は**人間の明示指示でのみ**行う。外部投稿・API 送信・publish はしない。
- **個別株の投資勧誘・売買推奨・断定的な将来予測をしない**。
- **数字・主張は必ず一次ソースで裏取り**。憶測で数字を作らない。断定できない点は「未確認」と明記して残す。
- **事実と解釈を分離**。噂・リークは「噂/未確認」と明示。
- **誇張・ステマをしない**。AI 要約・AI 生成である旨をプロフィール等で担保する。
- 数字・主張には**一次ソース（URL）を紐づけ**、チェック結果を evidence として下書きに併記する。
