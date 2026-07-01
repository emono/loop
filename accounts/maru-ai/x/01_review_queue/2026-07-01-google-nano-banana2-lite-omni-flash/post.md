# 下書き: Google「Nano Banana 2 Lite」「Gemini Omni Flash」発表 — 承認待ち

- **アカウント/媒体**: maru-ai / x
- **ネタ**: Google が画像生成モデル「Nano Banana 2 Lite」(Gemini 3.1 Flash-Lite Image, GA) と
  動画生成/編集モデル「Gemini Omni Flash」(Public Preview) を同時発表
- **発表日**: 2026-06-30（鮮度: today−1日 → 3日ルール内）
- **state**: 01_review_queue（下書き・未承認）
- **担当**: discover→gather→draft は本エージェント、数字は別 subagent で独立レビュー実施

## 本文案（速報 / プレーンテキスト・maru-ai voice 準拠）

※空行区切りで1ツイート。

【速報】Googleが新しい画像/動画生成モデルを発表(6/30)

画像生成の「Nano Banana 2 Lite」(Gemini 3.1 Flash-Lite Image)が一般提供開始、動画生成の「Gemini Omni Flash」がプレビュー公開だね。

【要点】
・Nano Banana 2 Lite: 最速4秒で画像生成、価格は出力$30/100万トークン(1枚あたり目安$0.034)
・Gemini Omni Flash: 動画出力$0.10/秒、会話形式でのビデオ編集に対応
・Geminiアプリ・Google Flow・AI Mode in Search・NotebookLM等に順次展開
・全生成物にC2PAとSynthIDの電子透かしを標準付与

【ポイント】
軽量・高速・低コストの画像生成と、対話で動画を編集できるOmni系列を同時投入。量産系のコンテンツ制作を安く速く回せる方向にシフト、という位置づけだね。

ソース(一次)
https://cloud.google.com/blog/products/ai-machine-learning/nano-banana-2-lite-and-gemini-omni-flash-available/

## 使った一次ソース
- 公式（一次・発表本文/価格/展開先）: https://cloud.google.com/blog/products/ai-machine-learning/nano-banana-2-lite-and-gemini-omni-flash-available/
- 公式（一次・詳細価格の裏取り）: Vertex AI / Gemini API pricing ページ（Gemini 3.1 Flash-Lite Image: 入力$0.25・テキスト出力$1.50・画像出力$30 / 100万トークン、脚注に画像1枚=1,120トークンの記載）

## コンプラ自己チェック（compliance.md 準拠）
- [x] **数字の独立レビュー（別 subagent・公式突合）実施 → 修正反映済み**
  - 発表日(2026-06-30)・モデル名・GAステータス・生成速度「最速4秒」・価格($30/100万トークン、$0.10/秒)・C2PA/SynthID標準付与 = **VERIFIED**
  - 「1枚あたり目安$0.034」の換算 = **VERIFIED**（公式pricingページ脚注の1,120トークン/枚から算出、試算である旨を明記）
  - 展開先「YouTube Shorts/Create App」は一次ソースで確認できず**WRONG（未確認）と判定 → 削除**。公式記載の「Geminiアプリ・Google Flow・AI Mode in Search・NotebookLM等」に差し替え済み
- [x] 出典あり／誇張なし／事実（何が出た）と解釈（ポイント欄）を分離／噂は使用せず
- [x] AI生成はプロフィール担保／プレーンテキスト・絵文字なし・見出しは【…】・番号ラベルなし
- [x] posted.md・既存 01_review_queue と照合 → 重複ネタなし（新規）

## 未確認点 / レビュー観点
- 「1枚あたり目安$0.034」はトークン単価からの試算（公式が単価そのものを提示しているわけではない）。
- Nano Banana 2 Lite / Gemini Omni Flash のベンチマーク・品質評価に関する数値は本文に含めていない（公式ブログに定量比較の記載なし、または裏取り不十分のため見送り）。
- 画像添付：未（公式ブログの図表を添付するかは要検討）。
