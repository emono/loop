# 下書き: Anthropic「Claude Science」発表 — 承認待ち

- **アカウント/媒体**: maru-ai / x
- **ネタ**: Anthropicが研究者向けAIワークベンチ「Claude Science」を発表
- **発表日**: 2026-06-30（鮮度: today−1日 → 3日ルール内）
- **state**: 01_review_queue（未承認・下書き）
- **担当**: discover→draft→数字の独立レビュー（別subagent）を実施

## 下書き案（速報 / プレーンテキスト・maru-ai voice準拠）

※空行区切り。1ツイートに収まらない場合はスレッド分割想定。

【速報】Anthropicが研究者向けAIワークベンチ「Claude Science」を出したぞ。(6/30発表)

新モデルじゃなくて、既存Claude(Opus 4.8など)を使った研究特化アプリって位置づけだね。

【中身】
・司令塔役のAIが60以上の科学データベースにアクセスし、専門サブエージェントを動かす仕組み
・引用や計算をチェックする「レビュアーエージェント」も搭載
・Pro/Max/Team/Enterpriseの有料プランでベータ提供開始(無料プランは対象外)

【助成金】
・大学院生/ポスドク向けに最大50件、1件あたり最大3万ドルのコンピュート助成(AI for Scienceプログラム)
・応募は7/15まで、実施期間は9/1〜12/1

【ポイント】
モデル自体の進化じゃなく「使い方(ワークフロー・エージェント連携)」で研究者を取り込みにいく製品だね。公式も「新モデルでも生物学特化の高性能モデルでもない」と明言してる。

ソース(一次)
https://www.anthropic.com/news/claude-science-ai-workbench

## 使った一次ソース
- 公式（一次）: https://www.anthropic.com/news/claude-science-ai-workbench
  - 注: WebFetchは403(直取得不可)のため、内容は複数の独立系メディア報道と突合して確認（下記）。
- 補助（二次・クロスチェック用）:
  - https://www.statnews.com/2026/06/30/anthropic-release-claude-science-ceo-dario-amodei/
  - https://www.technologyreview.com/2026/06/30/1139987/claude-science-is-anthropics-newest-flagship-product/
  - https://techcrunch.com/2026/06/30/anthropics-claude-science-bets-on-workflow-not-a-new-model-to-win-over-scientists/
  - https://letsdatascience.com/news/anthropic-launches-claude-science-ai-research-workbench-85428f54

## コンプラ自己チェック（compliance.md 準拠）
- [x] **数字の独立レビュー（別subagent・一次/複数独立メディア突合）実施**
  - 発表日(6/30)・「新モデルではない/Opus 4.8等既存モデル利用」・60以上のデータベース・レビュアーエージェント・Pro/Max/Team/Enterpriseベータ・助成金(最大50件/最大$30,000)・応募締切(7/15)・実施期間(9/1〜12/1) → **VERIFIED**（複数独立メディアで一致）
  - レビューで判明した補足情報（Team/Enterpriseは管理者有効化が必要、Modal社が追加で最大$2,000のコンピュートを提供）は**本文の簡潔さを優先し割愛**（誤りではなく省略。下記「未確認点」に記載）
- [x] 出典あり／誇張なし／事実(何が出た)と解釈(ポイント)を分離／噂表現なし
- [x] AI生成はプロフィール担保／プレーンテキスト・絵文字なし・見出しは【】・番号ラベルなし
- [x] 個別株の投資勧誘・売買推奨に該当する記述なし（研究助成の紹介のみで、金融商品への言及なし）

## 未確認点 / レビュー観点
- 公式ページ(anthropic.com)はWebFetchで403となり直接テキストは未取得。複数の独立系メディア（STAT News, MIT Technology Review, TechCrunch, Let's Data Scienceほか）の報道内容が相互に一致しているため事実として採用。可能であれば人間レビュー時に公式ページを直接確認推奨。
- 助成金の詳細: Team/Enterpriseプランでの利用は「管理者による有効化が必要」な可能性、Modal社による追加$2,000相当のコンピュート提供、採択通知が「7/31まで」等の細部は本文では割愛（速報の簡潔さ優先）。誤りではないが、スレッド化する場合は追記候補。
- 数字はすべて公式発表由来の開示値（実測ではない）。
- 画像添付: 未（公式ブログの図版があれば検討可）。
