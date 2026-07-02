# 下書き: Google「Nano Banana 2 Lite」+「Gemini Omni Flash」発表 — 承認待ち

- **アカウント/媒体**: maru-ai / x
- **ネタ**: Google の新しい画像生成モデル「Nano Banana 2 Lite」(正式名 Gemini 3.1 Flash-Lite Image) と、動画生成・編集モデル「Gemini Omni Flash」の同時発表
- **発表日**: 2026-06-30（鮮度: 実行日2026-07-02からtoday−2日 → 3日ルール内）
- **state**: 01_review_queue（下書き・未承認）
- **担当**: discover→draft は本セッションで実施、数字は `fact-checker` agent で独立レビュー実施（1件修正反映済み）

## 下書き案（プレーンテキスト・maru-ai voice 準拠）

※空行区切りで1投稿（長い場合はスレッド分割可）。

【速報】Googleが新しい画像・動画生成モデル「Nano Banana 2 Lite」と「Gemini Omni Flash」を発表(6/30)

軽量・高速な画像生成モデルと、会話的に動画を編集・生成できる新モデルを同時投入したね。

【モデル】
・Nano Banana 2 Lite(正式名: Gemini 3.1 Flash-Lite Image)…画像生成/編集モデル、一般提供(GA)開始
・Gemini Omni Flash…テキスト/画像/動画を入力に動画生成・編集(キャラクター入れ替え、照明・アングル変更など)ができる新モデル、公開プレビュー開始

【性能・価格】
・画像生成の速度は最短で約4秒
・Nano Banana 2 Lite: 入力$0.25/テキスト出力$1.50/画像出力$30(いずれも100万トークンあたり。1画像あたりの単価ではない)
・Gemini Omni Flash: 動画出力$0.10/秒

【ポイント】
Nano Banana系列に「最速・最安」の軽量版が加わり、会話的に動画を作れる新モデルも同時投入。Nano Banana 2 Liteで作った画像をOmni Flashでアニメ化する連携もできる、画像から動画までを安く速く回せるラインナップだね。

ソース(一次)
https://cloud.google.com/blog/products/ai-machine-learning/nano-banana-2-lite-and-gemini-omni-flash-available/

## 使った一次ソース
- 公式（一次）: https://cloud.google.com/blog/products/ai-machine-learning/nano-banana-2-lite-and-gemini-omni-flash-available/（発表日 2026-06-30）
- 公式（一次・価格）: https://cloud.google.com/gemini-enterprise-agent-platform/generative-ai/pricing（Nano Banana 2 Lite / Gemini Omni Flash の価格表、単位は100万トークンあたり）
- 参考（二次・クロスチェック）: VentureBeat, TechCrunch, SiliconANGLE, testingcatalog.com の関連記事（同日報道、内容一致を確認）

## コンプラ自己チェック（compliance.md 準拠）
- [x] **数字の独立レビュー（`fact-checker` agent・公式突合）実施 → 修正反映済み**
  - 発表日(2026-06-30)・正式名称(Gemini 3.1 Flash-Lite Image)・GA/公開プレビューのステータス・画像生成速度(約4秒)・NB2 Lite価格($0.25/$1.50/$30、各100万トークン)・Omni Flash価格($0.10/秒)・ソースURL実在性・同日同時発表 → いずれも **VERIFIED**（公式ブログ本文＋公式価格ページで直接確認、一部は複数独立メディアでもクロスチェック）
  - **修正点**: 当初「Gemini Omni Flashは画像から動画を生成する新モデル」と単純化していたが、fact-checkerの指摘により「テキスト/画像/動画を入力とする会話的な動画生成・編集モデル（キャラクター入れ替え・照明/アングル変更等）」に修正。画像→動画の連携は可能なワークフローの一例として【ポイント】に補足する形にした。
  - 価格表記に「100万トークンあたり（1画像あたりの単価ではない）」と明記し、他メディアが換算して報じている「1画像あたり$0.03台」という数字とは混同しないよう区別した。
- [x] 出典あり／誇張なし／事実と解釈を分離／噂不使用／個別株の投資勧誘・売買推奨なし
- [x] AI生成はプロフィール担保／プレーンテキスト・絵文字なし・見出しは【】・番号ラベルなし

## 未確認点 / レビュー観点
- Google公式ドキュメント個別ページ（docs.cloud.google.com 配下の各モデルページ）は本セッションからは403でアクセス不能だったため、公式ブログ本文と公式価格ページ、および複数独立メディアの報道内容のクロスチェックで裏取りした。
- 「Nano Banana 2」「Nano Banana Pro」(Lite でない通常版)は今回の6/30発表とは別タイミングでのリリースの可能性があり、本下書きでは触れていない（混同回避のため対象外）。
- 画像添付：未（公式ブログの図・スクショを付けるかは要検討。原本改変なしで同梱する場合は `source-*.png` として本ディレクトリに追加）。
