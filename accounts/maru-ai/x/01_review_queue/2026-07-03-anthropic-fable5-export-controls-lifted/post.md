# 下書き: Anthropic「Claude Fable 5」再展開(米輸出規制解除) — 承認待ち

- **アカウント/媒体**: maru-ai / x
- **ネタ**: 米商務省がClaude Fable 5/Mythos 5への輸出規制(外国人アクセス禁止)を解除し、Anthropicが7/1に世界でFable 5を再展開(新しい安全対策付き)
- **カテゴリ**: 規制/政策
- **発表日**: 解除=2026-06-30、再展開=2026-07-01（鮮度: today(2026-07-03)−2〜3日 → 3日ルール内）
- **state**: 01_review_queue（下書き・未承認）
- **担当**: gather/draft はメインエージェント、数字は fact-checker サブエージェントで独立レビュー

## 下書き案（速報 / プレーンテキスト・maru-ai voice準拠）

【速報】Anthropicが「Claude Fable 5」を7/1に世界で再展開したぞ。米商務省が6/30に輸出規制を解除。

米政府は6/12、国家安全保障を理由にFable 5とMythos 5への外国人(Anthropic社員含む)のアクセスを禁止。発端はAmazon側の報告で、特定の手口でモデルに脆弱性を突くコードを作らせられると分かったこと。約18日間の停止を経て、6/30に規制解除、7/1に再展開。

【対応】
・Anthropicは新しい分類器(classifier)を追加し、その脱獄の手口を99%超のケースでブロックすると説明
・誤検知で通常のコーディング作業がブロックされた場合はOpus 4.8に自動で切り替え、ユーザーに通知
・政府には引き続き輸出許可なしで運用する代わりに、セキュリティリスクの積極検知や不正利用の報告などを約束

【ポイント】
モデルが強力すぎて政府に一時停止させられ、対策を積んで復活という異例の展開だね。安全性を上げた分、誤検知(過検知)が増えるトレードオフも認めた上での再開ってところがポイント。

ソース(一次)
Anthropic公式(再展開): https://www.anthropic.com/news/redeploying-fable-5
Anthropic公式(停止時の声明): https://www.anthropic.com/news/fable-mythos-access
Anthropic公式X(再展開告知): https://x.com/AnthropicAI/status/2072163884430229756
Anthropic公式X(停止時の告知): https://x.com/AnthropicAI/status/2065597531644743999

## 使った一次ソース / 補助ソース
- 一次: Anthropic公式ブログ2本（上記URL）、Anthropic公式X 2本（上記URL）
- 補助（独立した複数の信頼メディアで同一事実を確認・クロスチェック）:
  - CNBC (2026-06-30): https://www.cnbc.com/2026/06/30/anthropic-says-trump-admin-has-lifted-export-controls-on-claude-fable-5-and-mythos-5.html
  - Al Jazeera (2026-07-01): https://www.aljazeera.com/economy/2026/7/1/us-lifts-restrictions-on-powerful-ai-models-fable-mythos-anthropic-says
  - Nextgov/FCW (2026-07): https://www.nextgov.com/artificial-intelligence/2026/07/us-lift-export-controls-key-anthropic-models/414561/
  - MarkTechPost (2026-07-01): https://www.marktechpost.com/2026/07/01/anthropic-redeploys-claude-fable-5-on-july-1-after-us-export-controls-lift-adds-new-cybersecurity-classifier/
  - Forbes (2026-06-16, 停止時の経緯): https://www.forbes.com/sites/anishasircar/2026/06/16/anthropic-disabled-fable-5-and-mythos-5-after-a-us-export-control-order-heres-what-happened/
  - Fortune (2026-06-13, 停止発表): https://fortune.com/2026/06/13/anthropic-disables-fable-mythos-export-controls-national-security-threat/

## 注記（重要・透明性のため明記）
- **WebFetchツールが本セッションで機能不全（全URL 403、Wikipedia等の無関係サイトでも再現）のため、Anthropic公式ページ本文を直接fetchできなかった**。
- そのため一次ソースの裏取りは「WebSearchで取得したAnthropic公式ブログ／公式Xの引用文・要約」＋「独立した複数の信頼メディア報道が同一の事実（日付・数字・経緯）を一致して報じていること」によるクロスチェックで代替した。
- 本文中の「99%超」の数値は、複数の独立メディア(MarkTechPost, Infosecurity Magazine等)がAnthropic公式ブログの記載として報じている値。ページ本文を直接確認できていないため、レビュー時にWebFetchが復旧していれば公式ページで再確認を推奨。

## コンプラ自己チェック（compliance.md準拠）
- [x] 出典あり（Anthropic公式ブログ2本・公式X2本を明記）
- [x] 事実(規制解除・再展開・分類器追加)と解釈(異例の展開・トレードオフ)を区別
- [x] 誇張・ステマなし（性能の持ち上げではなく規制対応の事実ベース）
- [x] 個別株の投資勧誘・売買推奨なし
- [x] 噂ではなく複数独立ソースで確認済みの事実のみ記載（未確認の推測数字は不使用）
- [x] AI生成はプロフィールで担保／プレーンテキスト・絵文字なし・見出しは【】・番号ラベルなし
- [ ] 数字の独立レビュー（fact-checkerサブエージェント）→ 下記に追記予定

## 未確認点 / レビュー観点
- 「99%超」の数値はAnthropic公式ブログ由来と複数メディアが報じているが、本セッションでは公式ページ本文を直接fetchできず未確認（メディア報道の一致による代替確認のみ）。
- 停止から解除までの期間「約18日間」は複数メディアが算出した数字（6/12〜6/30）。Anthropic公式が明示的に「18日間」と述べているわけではない（日付自体は公式Xで確認済み）。
