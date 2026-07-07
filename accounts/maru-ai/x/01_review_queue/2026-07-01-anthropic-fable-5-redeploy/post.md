# 下書き: Anthropic「Claude Fable 5」グローバル再展開 — 承認待ち

- **アカウント/媒体**: maru-ai / x
- **ネタ**: 米政府の輸出規制解除を受け、Anthropicが「Claude Fable 5」を全世界で再展開。新しい安全分類器の追加と、Amazon/Microsoft/Google等との業界横断ジェイルブレイク深刻度スコアリング枠組みの共同提案も同時発表。
- **発表/発生日**: 輸出規制発動 2026-06-12 → 解除 2026-06-30 → グローバル再展開 2026-07-01（鮮度: today[2026-07-02]−1日 → 3日ルール内）
- **state**: 01_review_queue（人間承認待ち・未投稿）
- **担当**: gather/draft は本エージェント、数字は別サブエージェントによる独立レビュー実施済み

## 下書き案（速報 / プレーンテキスト・maru-ai voice 準拠）

※空行区切りで1ツイート、または140字超のためスレッド分割を推奨（下記はスレッド想定）。

【速報】Anthropicが「Claude Fable 5」を全世界で再展開(7/1)。米政府の輸出規制解除を受けての復活だね。

6/12に米政府がFable 5/Mythos 5に輸出規制をかけ提供を一時停止していたが、6/30に規制解除、7/1から利用再開。

【経緯】
・6/12: Amazon側が指摘したジェイルブレイク手法を受け米政府が輸出規制を発動、Anthropicは全ユーザー向け提供を一時停止
・6/30: 輸出規制解除
・7/1: Claude Platform/Claude.ai/Claude Code/Claude Cowork で世界的に再展開

【安全対策】
・新しい分類器(classifier)を追加、Amazonが報告した特定の手法を99%超の割合でブロック
・業界横断のジェイルブレイク深刻度スコアリング枠組みをAmazon/Microsoft/Google等と共同提案(4基準: 能力向上度・適用範囲・武器化の容易さ・発見しやすさ)
・HackerOneでFable 5のサイバー系ジェイルブレイク発見プログラム(脆弱性開示プログラム)を開始

【料金】
・Pro/Max/Team/一部Enterpriseは7/7まで週次利用枠の50%まで利用可
・7/7以降は使用量クレジット制(入力$10/出力$50、100万トークンあたり)

【ポイント】
輸出規制でモデルが一時停止するのは異例。政府協議の末に安全対策を強化して復活した形で、AIモデルの海外提供と国家安全保障がせめぎ合う一件が可視化されたね。

ソース(一次)
https://www.anthropic.com/news/redeploying-fable-5

## 使った一次ソース
- 公式（一次・URL確認済みだが本セッションではWebFetchが組織ポリシーでブロックされ直接本文取得は不可）: https://www.anthropic.com/news/redeploying-fable-5
- 公式（一次・X投稿）: https://x.com/AnthropicAI/status/2072163884430229756（同セッションでWebFetch不可のため直接引用はできず、WebSearch経由の要約で存在・概要のみ確認）
- 補助（二次・複数独立媒体でのクロスチェック）:
  - https://thehackernews.com/2026/07/anthropic-restores-claude-fable-5-after.html
  - https://www.marktechpost.com/2026/07/01/anthropic-redeploys-claude-fable-5-on-july-1-after-us-export-controls-lift-adds-new-cybersecurity-classifier/
  - https://www.coindesk.com/tech/2026/07/01/anthropic-restores-ai-models-fable-mythos-after-the-u-s-lifts-export-controls
  - https://www.infosecurity-magazine.com/news/anthropic-fable-mythos-back/
  - https://venturebeat.com/technology/anthropic-is-bringing-back-claude-fable-5-globally-after-us-lifts-export-control-order-where-can-enterprises-access-it
  - https://9to5google.com/2026/07/01/anthropic-fable-5-returns-to-claude/
  - https://hackerone.com/anthropic-cyber-jailbreak （HackerOneプログラム自体の一次確認）

## コンプラ自己チェック（compliance.md 準拠）
- [x] **数字の独立レビュー（別 subagent・WebSearchで一次/複数独立媒体突合）実施 → 10項目すべてVERIFIED、修正不要**
  - 輸出規制発動日(6/12)／解除日(6/30)／再展開日(7/1)と対象プラットフォーム／発端(Amazonの指摘)／分類器のブロック率(99%超、範囲を「報告された手法」に限定)／深刻度スコアリング枠組みの共同提案先と4基準／HackerOneプログラムの存在／料金条件(週次枠50%・7/7まで、以降$10/$50)／鮮度（3日以内）
- [x] 出典あり（一次URL明記）／噂ではなく確定情報（断定表現も公式発表内容に準拠）／誇張・煽り・ステマなし／事実（経緯・安全対策・料金）と解釈（【ポイント】の1文のみ）を分離
- [x] AI生成はプロフィール担保／プレーンテキスト・絵文字なし・見出しは【】・番号ラベルなし
- [x] 個別株の投資勧誘・売買推奨に該当する記述なし（compliance.md 準拠）
- [x] posted.md（Claude Sonnet 5 案件のみ記録）および 01_review_queue 内の既存下書き（現状なし）と重複なしを確認

## 未確認点 / レビュー観点
- 本セッションでは `WebFetch` ツールが example.com 相手にすら 403 で失敗しており、組織の egress ポリシーによる全面ブロックと判明（プロキシ status の recentRelayFailures で "policy denial" を確認）。そのため Anthropic 公式ブログ本文・公式X投稿本文を直接フェッチして一次確認することができず、**WebSearch の要約結果および複数の独立系メディア（7件以上）のクロスチェックのみで裏取り**した。人間レビュー時に可能であれば `https://www.anthropic.com/news/redeploying-fable-5` を直接開いて本文と数字（特に「99%超」の厳密な文言、料金の$10/$50が本当にFable 5通常API価格と同一かどうか）を最終確認することを推奨。
- HackerOneの「発見プログラム」は無報酬の脆弱性開示プログラム(VDP)であり、バグバウンティ（報奨金あり）ではない点に注意（下書きは中立表現に留めているため問題ないと判断）。
- 画像添付：未（公式ブログに図表があるかは直接確認できていないため今回は見送り）。
