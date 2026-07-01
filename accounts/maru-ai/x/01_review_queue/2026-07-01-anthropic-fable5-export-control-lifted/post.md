# 下書き: Anthropic「Claude Fable 5」輸出規制解除・世界再展開 — 承認待ち

- **アカウント/媒体**: maru-ai / x
- **ネタ**: 米商務省がAnthropic「Claude Fable 5」「Claude Mythos 5」への輸出規制を解除。Fable 5が2026-07-01(本日)に世界へ再展開
- **カテゴリ**: 規制/政策(＋プロダクト復旧)
- **鮮度**: 規制解除発表 2026-06-30／世界再展開開始 2026-07-01(本日) → 3日ルール内(むしろ当日)
- **担当**: gather→draft は本セッション、数字は別subagentで独立レビュー実施(結果は下記)
- **重複チェック**: `posted.md`・`01_review_queue`・`02_approved` を確認。既出は2026-06-30 Claude Sonnet 5リリースのみで、本ネタ(輸出規制/Fable 5)とは別件。重複なし。

## 下書き案(プレーンテキスト・maru-ai voice準拠・スレッド想定／空行区切り)

【速報】Anthropicの「Claude Fable 5」、米商務省が輸出規制を解除(6/30発表)し、7/1に世界へ再展開だよ

6/12に安全性の懸念で全世界のアクセスが止まってから、Fable 5は19日ぶりの復活だね(Mythos 5は6/26に一部復旧済みだった)。

【経緯】
・6/9 Fable 5・Mythos 5をリリース
・6/12 Amazon調査チームが安全策を回避する手法(ジェイルブレイク)を報告→米商務省がアモデイCEOに全外国籍ユーザー(社内含む)への提供停止を指示、Anthropicは判別手段がなく両モデルを世界で全停止
・6/26 重要インフラ防御に関わる米企業・政府機関約100先に限り、Mythos 5のみ先行復旧(Fable 5は停止継続)
・6/30 米商務省が規制解除

【対策】
新しい安全分類器を訓練し、報告されたジェイルブレイク手法を99%超のケースでブロックできるようにしたとのこと。ブロック時はOpus 4.8に自動で切り替わり、ユーザーに通知される仕組みだね。

【展開】
7/1、Fable 5はClaude Platform・Claude.ai・Claude Code・Claude Cowork上で世界向けに再展開。Mythos 5は引き続き承認済み組織限定などより制限的な運用が続くとのこと。

【ポイント】
Anthropicによれば、Opus 4.8やGPT-5.5、Kimi K2.7など他の主要モデルも報告されたのと同じ脆弱性を特定できたとのことで、Fable 5固有の危険な能力ではなかった、というのが同社の主張。AI規制と企業対応のせめぎ合いが可視化された事例だね。

ソース(一次)
https://www.anthropic.com/news/redeploying-fable-5
https://www.anthropic.com/news/fable-mythos-access

## 使った一次ソース
- 公式(一次): https://www.anthropic.com/news/redeploying-fable-5 （2026-06-30付、規制解除・99%ブロック・7/1再展開の発表本体。※直接WebFetchは403で拒否されたため、検索エンジンのインデックス内容から該当箇所を直接引用・確認）
- 公式(一次): https://www.anthropic.com/news/fable-mythos-access （6/12の輸出規制命令に関するAnthropic声明本体。同上の理由で検索インデックス経由で確認）
- 公式(一次・参考): Anthropic公式X投稿 https://x.com/AnthropicAI/status/2072106151890809341 （規制解除の速報告知）
- 補助(二次・数字クロスチェック): CNBC https://www.cnbc.com/2026/06/30/anthropic-says-trump-admin-has-lifted-export-controls-on-claude-fable-5-and-mythos-5.html
- 補助(二次): Forbes https://www.forbes.com/sites/sandycarter/2026/07/01/anthropic-wins-as-commerce-lifts-fable-5-and-mythos-5-export-controls/
- 補助(二次): CIO https://www.cio.com/article/4191550/us-reverses-export-restrictions-on-anthropics-fable-5-mythos-5-ai-models.html
- 補助(二次・詳細): the-decoder https://the-decoder.com/anthropics-fable-5-is-back-worldwide-after-a-two-week-government-ban-over-a-jailbreak/
- 補助(二次): TheHackerNews https://thehackernews.com/2026/07/anthropic-restores-claude-fable-5-after.html

## コンプラ自己チェック(compliance.md 準拠)
- [x] **数字の独立レビュー(別subagent・一次/複数二次ソース突合)実施 → 誤り1件検出・修正済み**
  - 誤り: 「6/26に約100先でFable 5・Mythos 5の両方が先行復旧」という当初想定 → **WRONG**。正しくは**Mythos 5のみ**が先行復旧、Fable 5は7/1まで全面停止継続。本文を訂正済み。
  - それ以外(リリース日6/9、輸出規制命令6/12、規制解除6/30、99%ブロック率、Opus 4.8フォールバック、7/1世界再展開・対象プラットフォーム、他モデルでも同脆弱性特定可能、の各点)は独立レビューで**VERIFIED**。
- [x] 出典あり(一次: anthropic.com公式ニュース2本＋公式X／二次: 複数の信頼メディアで数字・日付を突合)
- [x] 誇張・ステマなし(「復活」「せめぎ合い」等は事実描写の範囲、性能の優位性主張はしていない)
- [x] 事実(経緯・数字・展開日)と解釈(【ポイント】のみ)を分離
- [x] 噂・未確認情報なし(すべて公式発表内容および複数メディア一致の事実)
- [x] 個別株の投資勧誘・売買推奨に該当する記述なし
- [x] AI生成である旨はプロフィール(bio)で担保
- [x] プレーンテキスト・絵文字なし・見出しは【…】・番号ラベルなし

## 未確認点・レビュー観点(投稿前に人間が確認推奨)
- anthropic.com公式記事2本は本セッションのWebFetchが403(Forbidden)で直接本文取得できなかった。検索エンジンのインデックス経由で該当パラグラフの直接引用を複数回確認し、CNBC/Forbes/CIO/the-decoder等の独立した複数の信頼メディアの記述とも数字・日付が一致することを確認済みだが、可能であれば人間が公式ページを直接開いて最終確認することを推奨。
- 「99%超」はAnthropicの自己申告値(第三者による再現検証ではない)。本文では「とのこと」で開示値であることを明示。
- Mythos 5の6/26復旧の対象「約100先」は複数媒体で「100社超」等表現に幅あり。本文では「約100先」と概数表記。
- 本ネタはAI規制・国家安全保障がらみで論点が多い(政治的含意あり)。maru-aiのトーン規約(中立・煽らない・断定しない)を踏まえ、政治的評価は加えていない。
- 画像添付：未(公式ブログのスクリーンショット等は未取得。必要なら追加検討)。
