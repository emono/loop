# 下書き: Anthropic、Claude Fable 5を米輸出規制解除後に再展開(7/1)

- アカウント: まるくん@AI速報 (maru-ai) / X
- ネタの発表日: 2026-06-30(規制解除)〜2026-07-01(再展開) → 実行日 2026-07-02 から3日以内(鮮度OK)
- 既出チェック: `state/posted.md`・既存 `01_review_queue` と突合し重複なし(posted.md にあるのは 2026-06-30 の Claude Sonnet 5 リリースのみで別ネタ)

## 本文案(スレッド・プレーンテキスト)

【速報】
Anthropicが Claude Fable 5 を7/1に世界中へ再展開したね。米政府の輸出規制解除を受けての復帰だよ。

6/12に米商務省がFable 5とMythos 5について外国籍ユーザー(社員含む)への提供を止める輸出規制を発出、6/30に解除。きっかけはAmazon研究者が見つけたジェイルブレイク手法(脆弱性を突くコードを生成させたもの)。Anthropicは「他モデルでも再現しうる脆弱性」と反論してるよ。

【復帰範囲】
・Fable 5: Claude.ai / Claude Platform / Claude Code / Claude Cowork で全世界に再展開
・Mythos 5: 米国内の承認済み組織(Project Glasswing参加団体、6/26承認)限定での復帰。海外ユーザーはまだ使えない

【安全対策・利用制限】
・新しい分類器を追加、今回報告されたジェイルブレイク手法を99%超ブロック(この手法限定の数値で、汎用的な安全性スコアではない)
・7/7までは Pro/Max/Team・一部Enterpriseプランで週次利用上限の最大50%まで Fable 5 を利用可(上限であり保証枠ではない)

【ポイント】
政府による生成AIモデルへの直接的な利用停止命令という異例の規制介入から、安全対策強化を経て短期間で復帰した事例。Fable 5とMythos 5で扱いが分かれたのは、モデルの機微度によって規制・復帰に温度差が出る実例って感じだね。

ソース
https://www.anthropic.com/news/redeploying-fable-5

## 一次ソース

- Anthropic公式(一次): https://www.anthropic.com/news/redeploying-fable-5
- Anthropic公式(規制発出時の声明・一次): https://www.anthropic.com/news/fable-mythos-access
- Anthropic公式X(規制発出告知): https://x.com/AnthropicAI/status/2065597531644743999
- Anthropic公式X(規制解除告知): https://x.com/AnthropicAI/status/2072106151890809341
- Claude公式X(利用制限の原文): https://x.com/claudeai/status/2072402639644766602

**注記(重要)**: この環境の WebFetch ツールおよび直接 curl アクセスがいずれも anthropic.com に対して HTTP 403 を返し、一次ソースの本文を直接取得できなかった(サイト側のボット対策とみられ、環境固有のプロキシ問題ではないことを curl 直接アクセスでも確認済み)。そのため、下記の複数の独立した信頼メディアの報道内容が相互に一致することをもって事実確認とした(通常の一次ソース直接確認より一段階弱い検証方法である点を明記する)。

### クロス確認に使った二次ソース(すべて独立系統・内容一致を確認)
- CNBC: https://www.cnbc.com/2026/06/30/anthropic-says-trump-admin-has-lifted-export-controls-on-claude-fable-5-and-mythos-5.html
- The Hacker News: https://thehackernews.com/2026/07/anthropic-restores-claude-fable-5-after.html
- Tech Times(復帰・分類器): https://www.techtimes.com/articles/319413/20260701/claude-fable-5-returns-globally-new-classifier-blocks-jailbreak-flags-more-code.htm
- Tech Times(規制発出時): https://www.techtimes.com/articles/318350/20260614/amazon-triggered-claude-fable-5-shutdown-investor-cloud-host-now-regulator.htm
- Forbes(規制発出): https://www.forbes.com/sites/anishasircar/2026/06/16/anthropic-disabled-fable-5-and-mythos-5-after-a-u-s-export-control-order-heres-what-happened/
- Forbes(解除): https://www.forbes.com/sites/sandycarter/2026/07/01/anthropic-wins-as-commerce-lifts-fable-5-and-mythos-5-export-controls/
- Forbes(解除・別記者): https://www.forbes.com/sites/siladityaray/2026/07/01/trump-administration-lifts-export-controls-on-anthropics-mythos-5-and-fable-5-ai-models/
- Fox Business: https://www.foxbusiness.com/technology/trump-administration-lifts-claude-mythos-5-fable-5-export-restrictions-after-anthropic-works-government
- SecurityWeek(Anthropicの反論): https://www.securityweek.com/anthropic-disputes-fable-5-ai-jailbreak/
- Bloomberg(Mythos 5は限定復帰): https://www.bloomberg.com/news/articles/2026-07-01/us-limits-on-anthropic-s-mythos-keep-foreign-firms-in-limbo
- GovConWire(Mythos 5限定復帰の詳細): https://www.govconwire.com/articles/anthropic-mythos-5-access-restored-select-us-orgs

## チェック結果

### コンプラ自己チェック(compliance.md)
- [x] 出典あり(一次URL+独立二次ソース多数で相互確認)
- [x] 噂・未確認情報の断定なし(Anthropicの反論・Mythos 5の限定復帰など不確実/対立する情報は明記)
- [x] 誇張・ステマなし(Anthropicの主張とAmazon側指摘の対立を両論併記、称賛一辺倒にしていない)
- [x] 事実(発表内容)と解釈(【ポイント】)を分離
- [x] 個別株の投資勧誘・売買推奨なし
- [x] プレーンテキスト・絵文字なし・見出しは【】・番号ラベルなし

### 数字の独立レビュー(fact-checker agent・fresh context)
以下6項目を独立検証。結果: 5項目 CONFIRMED、1項目 WRONG(修正済み)。
1. 6/12輸出規制命令発出 — CONFIRMED
2. Amazon研究者のジェイルブレイク発見が契機(Anthropicは反論) — CONFIRMED(両論併記を本文に追加)
3. 6/30規制解除 — CONFIRMED
4. 「Fable 5とMythos 5が同時に世界中で復帰」 — **WRONG→修正**。Fable 5は世界中に再展開だが、Mythos 5は米国内の承認済み組織(Project Glasswing)限定復帰であり、海外ユーザーは引き続き利用不可。本文を「復帰範囲」で分けて明記する形に修正済み。
5. 新分類器が当該ジェイルブレイク手法を99%超ブロック — CONFIRMED(この手法限定の数値である旨を明記)
6. 7/7まで週次利用上限の最大50%までFable 5利用可(Pro/Max/Team・一部Enterprise) — CONFIRMED

## 未確認点(本文に含めていない/意図的に落とした情報)

- 7/7以降の課金体系(メータード利用クレジット等)の具体的な単価: 検索結果間で数字表記が不安定(例: "$10 per $50 per million tokens" のような不整合な記載あり)で信頼できる一次確認が取れなかったため本文から除外。
- 「週次利用上限の最大50%」が具体的にメッセージ数/トークン数/金額のどれで計算されるかは、複数の二次ソースでも「非公開・ダッシュボードで確認」とされており不明。本文では「上限であり保証枠ではない」とだけ言及し、具体的な換算値は書いていない。
- Anthropic公式ページ本文そのものは、この環境のネットワーク制限(WebFetch/直接curlともに403)により直接確認できていない。将来的にアクセス手段が確保できた場合は一次ソース本文で再確認することを推奨。
