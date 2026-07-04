アカウント: まるくん@AI速報 (maru-ai) / 媒体: X
ネタ: Venice AI が初の外部資金調達（Series A 6500万ドル、評価額10億ドル）
発表日: 2026-07-01（実行日 2026-07-04、鮮度3日以内）
状態: 01_review_queue（未承認・未投稿）

【本文案（スレッド・空行区切り）】

【速報】プライバシー重視AIのVenice AIが7/1、初の外部資金調達となるSeries Aで6500万ドルを調達したと発表。評価額は10億ドルでユニコーン入り。

主導は暗号資産系VCのDragonfly、Coinbase VenturesやNorth Island Venturesなども参加。

【要点】
・調達額: 6500万ドル(Series A、同社にとって初の外部資金調達)
・評価額: 10億ドル
・主導: Dragonfly／参加: Coinbase Ventures、North Island Ventures 等
・既に黒字化しており、年換算収益(ARR)は7000万ドル超(2026年Q1に黒字化)
・アクティブユーザーは300万人超(4月到達)、1日平均170万件のAPI呼び出しを処理
・共同創業者はCEOのErik Voorhees氏とPresident/CTOのJesse Proudman氏(タコマのUniversity of Puget Soundで同級生)
・200以上のAIモデルにアクセス可能。OSSモデルは自社ホスト、OpenAI/Anthropic等のクローズドモデルはプロキシ経由で提供し、プロンプト・応答はサーバーに保存しないと同社は説明

【ポイント】
プライバシーを前面に出したAIサービスに、資金を入れずに黒字化まで漕ぎ着けてからの初調達というのが特徴的だね。OpenAIやAnthropicのようなクローズド系大手とは違う「検閲や記録を気にせず使いたい」層の受け皿として、暗号資産界隈のマネーが評価してる格好。

【ソース】
https://venice.ai/blog/venice-raises-65-million-series-a

---

## 一次ソース
- Venice AI 公式ブログ（一次）: https://venice.ai/blog/venice-raises-65-million-series-a
- 参考（独立系メディア、裏取り用）: TechCrunch https://techcrunch.com/2026/07/01/venice-ai-becomes-a-unicorn-with-65m-series-a-as-its-privacy-first-ai-platform-takes-off/ 、GeekWire https://www.geekwire.com/2026/private-ai-venice-ai-led-by-crypto-vet-erik-voorhees-and-seattles-jesse-proudman-raises-65m/ 、The Block https://www.theblock.co/post/406934/venice-ai-funding-equity-valuation-dragonfly 、SiliconANGLE、Yahoo Finance、Open Source For You 等、5社以上で数字一致を確認

注記: venice.ai公式ブログはWebFetchが403でブロックされ本文の直接取得はできなかった。数字・固有名詞は上記独立系メディア5社以上の一致で間接的に裏取り。

## チェック結果（数字の独立レビュー・fact-checker subagent／作業者と別context）
| # | 項目 | 判定 |
|---|---|---|
| 1 | 2026-07-01発表・Series A 6500万ドル(=$65M)・初の外部資金調達 | VERIFIED |
| 2 | 評価額10億ドル(=$1B)・ユニコーン到達 | VERIFIED |
| 3 | 主導=Dragonfly、参加=Coinbase Ventures/North Island Ventures等 | VERIFIED（一部報道でArchetype/Morgan Creekの参加も言及。「等」表記で吸収） |
| 4 | 既に黒字化・ARR7000万ドル超(=$70M)・2026年Q1黒字化 | VERIFIED |
| 5 | アクティブユーザー300万人超(4月到達)・1日平均170万件API呼び出し | VERIFIED |
| 6 | CEO Erik Voorhees氏、President/CTO Jesse Proudman氏、University of Puget Sound同級生 | VERIFIED |
| 7 | 200以上のモデル提供、OSSは自社ホスト・クローズドはプロキシ、プロンプト非保存を同社が説明 | VERIFIED（「無検閲」は同社の自称であり中立事実として断定しない扱いとした） |
| 8 | 創業2年(2024年設立) | VERIFIED |

全8項目が独立報道5社以上の一致でVERIFIED。WRONG/UNVERIFIABLEなし。

## 未確認点・注記
- 「無検閲(uncensored)」という表現はVenice社自身のポジショニング/マーケティング用語であり、本文では断定的な事実表明として使わず、企業の説明・立ち位置として中立的に記述した（「〜と同社は説明」「受け皿として評価」等）。
- venice.ai公式ブログへの直接アクセスは今回もWebFetchで403となり不能だった。独立系メディア5社以上の一致で間接的に裏取り。
- 噂・リーク要素なし。個別株の投資勧誘・売買推奨要素なし（Venice AIは非上場企業、事実報道のみ。compliance.md準拠）。
- 重複チェック: posted.md（Claude Sonnet 5のみ）および既存 01_review_queue（README.mdのみ、ローカルには他ドラフトなし）と照合し重複なし。GitHub上の既存PR一覧（maru-ai draft 34件）にも「Venice」を含むものはなく、初出ネタであることを確認済み。
