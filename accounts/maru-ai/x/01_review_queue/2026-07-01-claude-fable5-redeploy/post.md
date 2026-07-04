# 下書き: Anthropic「Claude Fable 5」輸出規制解除・グローバル復活 — 承認待ち

- **アカウント/媒体**: maru-ai / x
- **ネタ**: 米商務省の輸出規制解除を受け、Anthropicが最上位モデル「Claude Fable 5」をグローバルに復活
- **発表/発生日**: 規制発動 2026-06-12 → 規制解除 2026-06-30 → 全世界復活 2026-07-01（鮮度: today(7/4)−3日 → 3日ルール内・ぎりぎり）
- **state**: 01_review_queue（下書き・承認待ち）
- **担当**: discover→gather→draft は本エージェント、数字は `fact-checker` サブエージェントで独立レビュー実施（fresh context）

## 下書き本文（プレーンテキスト・maru-ai voice 準拠・スレッド想定）

※空行区切り。文字数の都合で投稿時は単発ツイートへの圧縮や画像リンクカード活用を検討（Sonnet 5投稿時と同様）。

【速報】Anthropicが「Claude Fable 5」をグローバル復活させたぞ(7/1)

米政府の輸出規制で19日間止まってた最上位モデル、新しい安全策を付けて世界中で使えるようになったよ。

【経緯】
・6/12、米商務省が国家安全保障を理由にFable 5とMythos 5への外国籍ユーザー(米国内の外国籍Anthropic従業員含む)のアクセス停止を指示(輸出規制)
・きっかけはAmazon研究者がFable 5に脆弱性の特定を指示することで安全策を回避する手法を報告したこと。Anthropicは「限定的なジェイルブレイク」として深刻度には異論を唱えていた
・6/30に規制解除、7/1からFable 5がClaude Platform・Claude.ai・Claude Code・Claude Coworkで世界向けに復活(Mythos 5は一部先行復元済み)

【新しい安全策】
・Amazonが報告した回避手法を狙い撃ちした新しい分類器を追加、この手法を99%超ブロック(CAISIが独立確認)
・トレードオフとして、通常のコーディング/デバッグ依頼での誤検知が増える運用に

【利用制限】
・Pro/Max/Team/一部Enterpriseは7/7まで週次利用枠の最大50%相当を含む形で提供、以降は使用量クレジット制
・標準Enterpriseはクレジット未有効化だと利用不可(自動課金ではない)

【ポイント】
安全面の懸念で丸ごと止める規制と、最上位モデルを使わせ続けたい要望のせめぎ合いが19日間で決着。安全策の強化と引き換えに制限解除、って落としどころだね。ただし規制の深刻度についてAnthropicと政府の見方は割れたままだよ。

ソース(一次)
anthropic.com/news/redeploying-fable-5
anthropic.com/news/fable-mythos-access

## 使った一次ソース
- 公式（一次）: https://www.anthropic.com/news/redeploying-fable-5
- 公式（一次・規制発動時の声明）: https://www.anthropic.com/news/fable-mythos-access

## 使った補助ソース（二次・数字クロスチェック）
- CNBC（規制解除 6/30報道）: https://www.cnbc.com/2026/06/30/anthropic-says-trump-admin-has-lifted-export-controls-on-claude-fable-5-and-mythos-5.html
- Forbes（規制発動の経緯・Anthropicの異論）: https://www.forbes.com/sites/anishasircar/2026/06/16/anthropic-disabled-fable-5-and-mythos-5-after-a-us-export-control-order-heres-what-happened/
- Fortune（Amazon起点の経緯）: https://fortune.com/2026/06/14/how-a-warning-from-amazon-led-the-white-house-to-shut-down-anthropics-mythos-model/
- MarkTechPost（新分類器・99%ブロック・CAISI確認）: https://www.marktechpost.com/2026/07/01/anthropic-redeploys-claude-fable-5-on-july-1-after-us-export-controls-lift-adds-new-cybersecurity-classifier/
- VentureBeat（プラットフォーム展開・Mythos 5との違い）: https://venturebeat.com/technology/anthropic-is-bringing-back-claude-fable-5-globally-after-us-lifts-export-control-order-where-can-enterprises-access-it
- SearchEngineJournal（利用制限の詳細）: https://www.searchenginejournal.com/anthropics-claude-fable-5-is-back-with-new-usage-limits-and-safeguards/581231/

## 数字の独立レビュー（fact-checker subagent・fresh context）結果

判定: **WRONGなし。基本的に投稿可**（主要8項目すべてVERIFIED、複数独立報道とAnthropic公式声明内容が一致）。以下4点の軽微な補足を反映済み。

1. [反映済み] Anthropicは政府の規制措置について「narrow potential jailbreak（限定的なジェイルブレイク）」として深刻度に異論を唱えていた事実 → 本文【経緯】と【ポイント】に追記し、政府側の主張のみに偏らないよう修正。
2. [反映済み] Mythos 5はFable 5と復活プロセスが異なり、一部米国組織向けに先行復元されていた → 本文に「(Mythos 5は一部先行復元済み)」と注記。
3. [反映済み] 標準Enterpriseの扱いは「初日から自動でクレジット課金」ではなく「クレジット未有効化ならアクセス不可」が正確 → 本文の表現を修正。
4. [反映済み] 期間表現は「約3週間」ではなく実測「19日間」（6/12→7/1）に修正。

補足: 本セッションのWebFetchツールは環境側の問題で全URL(example.com含む)に403を返したため、一次ソース本文の直接取得ができなかった。代わりにWebSearchで一次ソース発の複数独立報道（CNBC/Forbes/Fortune/MarkTechPost/VentureBeat/SearchEngineJournal等10媒体以上）をクロスチェックして裏取りした。数字・日付・プラットフォーム名はすべて一致。

## コンプラ自己チェック（compliance.md / voice-base.md 準拠）
- [x] 出典あり（一次: anthropic.com news 2本 / 補助: 二次報道6本でクロスチェック）
- [x] 噂の断定なし（規制の経緯・深刻度についてAnthropicと政府の見解の相違を明記し、一方的な断定を回避）
- [x] 誇張・ステマなし（数字はすべて出典一致、性能や優位性の煽りなし）
- [x] 事実と解釈を区別（【経緯】【新しい安全策】【利用制限】＝事実、【ポイント】＝解釈。文体でも区別）
- [x] 個別株の投資勧誘・売買推奨なし
- [x] AI生成である旨はプロフィール（bio）で担保済み
- [x] プレーンテキスト・絵文字なし・見出しは【…】・番号ラベルなし
- [x] posted.md・01_review_queue 既存下書きと照合し重複なし（新規ネタ）

## 未確認点 / レビュー観点
- 「週次利用枠の最大50%相当」の具体的な数量（トークン数/メッセージ数/ドル換算）は公式に非公開のため記載していない。
- CAISI(Center for AI Standards and Innovation)によるブロック率の独立確認は、Anthropic発表・報道の記述に基づく（CAISI自身の一次レポートは未直接確認）。
- WebFetchツール障害のため、Anthropic公式ブログ本文をそのまま直接引用できていない（タイトル・複数二次報道の一致からの裏取りに留まる）。次回セッションでWebFetchが復旧していれば一次ソース本文を直接再確認することを推奨。
- 画像添付：未（公式ブログの図表があれば添付を検討）。
