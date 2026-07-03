# 下書き: Google「Nano Banana 2 Lite」「Gemini Omni Flash」発表 — 承認待ち

- **アカウント/媒体**: maru-ai / x
- **ネタ**: Google が生成メディア系新モデル2本を発表(画像生成の軽量版 Nano Banana 2 Lite・動画生成/編集の Gemini Omni Flash)
- **発表日**: 2026-06-30（鮮度: today(2026-07-03)−3日 → 3日ルールぎりぎり内）
- **state**: 01_review_queue（未承認・投稿していません）
- **担当**: 本セッションで discover→draft→verify を実施。数字は fact-checker agent（別 context）で独立レビュー済み。

## 下書き案（速報 / プレーンテキスト・maru-ai voice 準拠）

※空行区切りで1ツイート、長い場合はスレッド想定。

【速報】Googleが生成メディア系の新モデルを2つ発表(6/30)

画像生成の軽量版「Nano Banana 2 Lite」と、動画生成/編集の「Gemini Omni Flash」の2本立てだね。

【Nano Banana 2 Lite】
・最短4秒で1K解像度の画像を生成
・価格は1K画像1枚あたり約$0.034(1120トークン分、正確値$0.0336)
・Gemini Enterprise Agent Platformで一般提供(GA)開始

【Gemini Omni Flash】
・自然言語でキャラクター入替やシーン書き換えなど動画の会話的編集に対応
・価格は動画出力1秒あたり$0.10
・現在はパブリックプレビュー

【ポイント】
速度とコストに振った軽量モデルという位置づけ。Adobe・Figma・WPPなど複数企業がすでに導入していて、量産系の画像/動画ワークフロー向けだね。

ソース(一次)
https://cloud.google.com/blog/products/ai-machine-learning/nano-banana-2-lite-and-gemini-omni-flash-available/

## 使った一次ソース
- 公式（一次・発表内容/機能/導入企業）: https://cloud.google.com/blog/products/ai-machine-learning/nano-banana-2-lite-and-gemini-omni-flash-available/ （Google Cloud Blog、2026-06-30付）
- 公式（一次・価格）: https://cloud.google.com/gemini-enterprise-agent-platform/generative-ai/pricing

## コンプラ自己チェック（compliance.md 準拠）
- [x] 出典あり（一次ソース2本、いずれも公式Google Cloudドメイン）
- [x] 誇張・ステマなし（「量産系ワークフロー向け」は公式ポジショニングと整合する解釈として明記、性能の過大評価なし）
- [x] 事実（スペック・価格・提供状況）と解釈（【ポイント】）を分離
- [x] 噂・リークではない（公式発表内容のみ）
- [x] 個別株の投資勧誘・売買推奨なし
- [x] AI生成はプロフィールで担保／プレーンテキスト・絵文字なし・見出しは【】・番号ラベルなし
- [x] **数字の独立レビュー（fact-checker agent・別context）実施 → 修正反映済み**
  - 生成速度「4秒」＝公式ブログに"as little as four seconds"と明記 → VERIFIED
  - Gemini Omni Flash 価格「$0.10/秒」＝公式ブログ本文・pricingページ双方に明記 → VERIFIED
  - GA / Public Preview のステータス表記＝公式ブログの記載通り → VERIFIED
  - 導入企業(Adobe/Figma/WPP)＝公式ブログに顧客事例として実名掲載 → VERIFIED
  - Nano Banana 2 Lite 価格「$0.034」＝公式pricingページの正確値は $0.034/1120トークン(=$30/1Mトークン×1120)で税引き計算上の厳密値は$0.0336。本文は丸め表記のため「約$0.034(正確値$0.0336)」に修正して両方明記
  - **発表主体の誤り（WRONG→修正済み）**: 初稿は「Google DeepMindが発表」としていたが、実際の発表元は **Google Cloud Blog**（Cloud AI担当VP名義の投稿）。DeepMindはモデル開発元/ベンチマーク提供元としての言及に留まり、発表主体ではないため「Googleが発表」に修正した。

## 未確認点 / レビュー観点
- Nano Banana 2 Lite の価格は「1K画像1枚=1120トークン×$30/1Mトークン」の計算値であり、公式ページに「1枚$0.034」という完全な一文表記があるわけではない（トークン単価からの導出）。厳密には算出値である旨を残す。
- 「Google DeepMind」表記は誤りとして修正済みだが、モデル自体はGeminiファミリー（DeepMind開発）である点は事実。速報本文では発表主体を「Google」とし、DeepMindには言及しない形にした。
- 画像添付：なし（公式ブログのスクリーンショット等は未取得。必要なら追加検討）。
- 重複チェック: posted.md・01_review_queue 内の既存ドラフトと照合し、同一ネタなし（重複しない）。
