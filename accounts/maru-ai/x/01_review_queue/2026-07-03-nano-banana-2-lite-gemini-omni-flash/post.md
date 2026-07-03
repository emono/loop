# 下書き: Google「Nano Banana 2 Lite」一般提供+「Gemini Omni Flash」プレビュー — 承認待ち

- **アカウント/媒体**: maru-ai / x
- **ネタ**: Google, 画像生成モデル「Nano Banana 2 Lite」(Gemini 3.1 Flash-Lite Image) を一般提供(GA)開始、動画生成モデル「Gemini Omni Flash」をパブリックプレビュー公開
- **発表日**: 2026-06-30（鮮度: today(2026-07-03)−3日 → 3日ルール内ギリギリ）
- **state**: 01_review_queue（下書き・未承認）
- **担当**: discover→draft はメインエージェント、数字は fact-checker subagent で独立レビュー実施

## 下書き案（速報 / プレーンテキスト・maru-ai voice 準拠）

※空行区切りで1ツイート想定。長ければスレッド分割可。

【速報】Googleが画像生成モデル「Nano Banana 2 Lite」を一般提供開始、動画生成「Gemini Omni Flash」もプレビュー公開したぞ(6/30発表)

スピード特化の画像モデルと、会話で編集できる動画モデルが同日に来た感じだね。

【要点】
・Nano Banana 2 Lite(Gemini 3.1 Flash-Lite Image):最速4秒で画像生成、1024×1024画像1枚が$0.034(1120トークン、$30/100万トークン換算)
・Google AI Studio/Gemini API/Gemini Enterprise Agent Platformで提供開始、Gemini appなどコンシューマー面にも順次展開
・Gemini Omni Flash:動画生成が1秒あたり$0.10(パブリックプレビュー)、自然言語での会話型編集に対応

【ポイント】
速度とコストを振り切った画像モデルと、動画を"会話で編集"できるモデルを同時に出してきたのがポイント。画像生成からそのまま動画化まで、実務のワークフローを一気通貫でカバーしにきてる感じだね。

【ソース】
https://cloud.google.com/blog/products/ai-machine-learning/nano-banana-2-lite-and-gemini-omni-flash-available/
https://cloud.google.com/vertex-ai/generative-ai/pricing

## 使った一次ソース
- 公式（一次・発表内容/仕様/提供状況）: https://cloud.google.com/blog/products/ai-machine-learning/nano-banana-2-lite-and-gemini-omni-flash-available/
- 公式（一次・価格の裏取り）: https://cloud.google.com/vertex-ai/generative-ai/pricing
- 参考（二次・発表日クロスチェック）: https://techcrunch.com/2026/06/30/google-introduces-a-faster-cheaper-image-generator-with-nano-banana-2-lite/ （本文中の数字採用はなし、発表日確認のみ）

## コンプラ自己チェック（compliance.md 準拠）
- [x] 出典あり（公式Google Cloud blog + 公式pricing pageで数字を突合）
- [x] 誇張・ステマなし（「一気通貫でカバーしにきてる感じ」は解釈と明示、性能優位の断定なし）
- [x] 事実（発表内容・価格・提供状況）と解釈（【ポイント】）を分離
- [x] 噂・未確認情報は本文に含めない（未確認点は下記に記載し本文からは除外）
- [x] AI生成はプロフィール担保／プレーンテキスト・絵文字なし・見出しは【】・番号ラベルなし
- [x] 個別株の投資勧誘・売買推奨に該当なし

## 数字の独立レビュー（fact-checker subagent 実施）
- 発表日 2026-06-30: 公式Google Cloud blogに明記 → VERIFIED
- Nano Banana 2 Lite 生成速度「最速4秒」: 公式Google Cloud blogに明記 → VERIFIED
- Nano Banana 2 Lite 価格「1024×1024画像=$0.034（1120トークン、$30/100万トークン換算）」: 公式Vertex AI pricingページの Image Output $30/1Mトークン と 1024×1024=1120トークンの記載から算出、$0.034は同ページに明記の数値と一致 → VERIFIED
- Gemini Omni Flash 動画価格「$0.10/秒」: 公式Google Cloud blog本文＋公式Vertex AI pricingページ（$17.50/100万動画出力トークン換算）の両方に明記 → VERIFIED
- 提供状況（AI Studio/API/Enterprise Agent Platformで提供開始、コンシューマー面は順次展開、Omni Flashはパブリックプレビュー）: 公式Google Cloud blogに明記 → VERIFIED

## fact-checker subagent（独立検証・fresh context）結果
- 発表日2026-06-30／生成速度「最速4秒」／画像価格$0.034／Omni Flash動画$0.10秒／提供状況の全項目 → **VERIFIED**（一次ソースを再訪して独立突合、公式Google Cloud blog本文の"as little as four seconds"表記、pricingページの$30/1Mトークン×1120トークン=$0.0336を確認）
- 除外した未確認点（最大10秒／Nano Banana 2無印の2月先行公開説）の除外判断も妥当と判定
- 総合判定: 「このまま人間承認ゲートに載せて問題なし」

## 未確認点（本文から除外）
- 一部の二次メディアがGemini Omni Flashの動画生成を「最大10秒」と報じているが、公式Google Cloud blog・公式pricingページのいずれにも上限秒数の明記がなく未確認のため本文には含めていない。
- 「Nano Banana 2」(無印)は2026年2月に先行公開されていたとする記述が複数の二次情報にあり、Lite版とは別モデルの可能性がある。本ネタでは6/30発表の「Nano Banana 2 Lite」「Gemini Omni Flash」のみを対象とし、旧モデルの沿革には言及していない。
- 画像添付：未（公式ブログの図表を確認の上、必要なら source-*.png を追加検討）。
