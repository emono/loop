# 下書き: Anthropic「Claude Fable 5」全世界復旧(輸出規制解除) — 承認待ち

- **アカウント/媒体**: maru-ai / x
- **ネタ**: Anthropicが「Claude Fable 5」の全世界提供を再開(7/1)。米商務省(BIS)の輸出規制解除を受けた復旧。規制×プロダクトの複合ネタ。
- **発表日**: 復旧発表・開始 2026-07-01(鮮度: 実行日2026-07-03からtoday−2日 → 3日ルール内)。関連する規制解除発表は2026-06-30。
- **state**: 01_review_queue（未承認・未投稿）
- **担当**: gather→draft は本セッションで実施、数字は `fact-checker` agent（fresh context）で独立レビュー実施済み

## 下書き案(速報・プレーンテキスト・maru-ai voice準拠／スレッド)

【速報】Anthropicが「Claude Fable 5」を全世界で提供再開(7/1)。米商務省の輸出規制解除を受けての復旧だね。

6/12に安全性上の懸念から輸出規制がかかり全世界で停止→6/30に解除→7/1復旧という、AI規制では異例の展開。

【経緯】
・6/9 Fable 5公開(Mythos 5は当初から一部認定パートナー限定公開)
・6/12 米商務省(BIS)が輸出規制を発令。海外ユーザーの国籍をリアルタイムで確認できずAnthropicは全世界で提供停止
・6/30 商務省が規制解除(ルトニック商務長官が発表)
・7/1 Claude.ai/Claude Platform(API)/Claude Code/Claude Coworkで世界向け提供を再開

【対策】
・Amazon発の報告にあった特定のjailbreak手法を99%超の精度でブロックする新しい安全分類器を導入(該当手法に限定した対策で、万能化は主張していない)
・Pro/Max/Team/プレミアムEnterpriseは7/7まで週次利用枠の50%までFable 5を利用可。標準Enterpriseは開始日から従量課金(usage credits)扱い。7/7以降は全体的に1Mトークンあたり入力$10/出力$50の従量課金に移行

【ポイント】
政府とAI企業が輸出規制を巡って正面衝突し、決着した異例のケース。フロンティアモデルの地政学リスクが実運用に直結すると分かった事例だね。

ソース(一次)
https://www.anthropic.com/news/redeploying-fable-5

## 使った一次ソース
- 公式（一次）: https://www.anthropic.com/news/redeploying-fable-5（Anthropic公式ブログ「Redeploying Claude Fable 5」）
- 公式（一次・補助）: Anthropic公式X投稿（規制解除の一報） https://x.com/AnthropicAI/status/2072106151890809341

## 参考（二次・クロスチェック用）
- CNBC: https://www.cnbc.com/2026/06/30/anthropic-says-trump-admin-has-lifted-export-controls-on-claude-fable-5-and-mythos-5.html
- Forbes（発令の経緯）: https://www.forbes.com/sites/anishasircar/2026/06/16/anthropic-disabled-fable-5-and-mythos-5-after-a-u-s-export-control-order-heres-what-happened/
- Forbes（解除後）: https://www.forbes.com/sites/sandycarter/2026/07/01/anthropic-wins-as-commerce-lifts-fable-5-and-mythos-5-export-controls/
- VentureBeat（利用枠・料金詳細）: https://venturebeat.com/technology/anthropic-is-bringing-back-claude-fable-5-globally-after-us-lifts-export-control-order-where-can-enterprises-access-it
- The Hacker News（安全分類器・jailbreak経緯）: https://thehackernews.com/2026/07/anthropic-restores-claude-fable-5-after.html
- Nextgov/FCW（規制解除の政府側報道）: https://www.nextgov.com/artificial-intelligence/2026/07/us-lift-export-controls-key-anthropic-models/414561/

## 数字の独立レビュー（fact-checker agent・fresh context）
実施済み。判定は以下の通り（VERIFIED以外は本文に反映・修正済み）。

1. Fable 5/Mythos 5公開日(6/9) — VERIFIED。ただしMythos 5は当初から「全世界公開」ではなく認定パートナー限定公開 → 本文に注記追加済み。
2. 輸出規制発令(6/12・米商務省BIS・Amazon発jailbreak報告が契機) — VERIFIED。
3. 「海外ユーザーの国籍をリアルタイム確認できず全世界停止」 — VERIFIED（複数報道一致）。
4. 規制解除発表(6/30・ルトニック商務長官) — VERIFIED。
5. 復旧開始(7/1)・対象プロダクト — 日付VERIFIED。製品名は下書き初稿で「Coword」と誤記していたのを**「Claude Cowork」に修正**（WRONG→修正済み）。
6. 「特定jailbreak手法を99%超でブロック」 — VERIFIED。原文も手法限定の表現で、誇張・万能化の主張なしと確認。
7. 利用枠(週次50%・7/7まで)・料金(入力$10/出力$50 per 1Mトークン) — VERIFIED。ただしEnterpriseは一律ではなく**プレミアム/標準で扱いが異なる**（標準Enterpriseは初日から従量課金）→ 本文に反映・修正済み。
8. 「政府とAI企業の輸出規制を巡る対立が決着した初の大型ケース」という編集的表現 — UNVERIFIABLE（「初」の裏付けなし・誇張の恐れ）→ **「異例のケース」に弱め修正済み**。

## コンプラ自己チェック（compliance.md / 共通ベースライン準拠）
- [x] 出典あり（一次: Anthropic公式ブログ＋公式X）／噂ではなく確定事実の速報
- [x] 事実（経緯・対策の数字）と解釈（【ポイント】の地政学リスク評価）を分離
- [x] 誇張・ステマなし（「99%超」は原文の限定条件のまま記載、「初」は断定を避けて弱め表現に修正）
- [x] 個別株の投資勧誘・売買推奨なし
- [x] AI生成である旨はプロフィール（bio）で担保。プレーンテキスト・絵文字なし・見出しは【】・番号ラベルなし
- [x] posted.md（2026-06-30 Claude Sonnet 5のみ記録）および01_review_queue既存下書き（Sonnet 5案のみ）と照合し重複なし

## 未確認点 / レビュー観点（承認者向け）
- **環境上の制約**: 本セッションの実行環境はネットワークポリシーにより WebFetch／curl が外部ドメイン全般で403となり、anthropic.com含め一次ソースページを直接フェッチできなかった（プロキシのconnect_rejectedログで確認）。そのため一次ソースURLの内容は WebSearch 経由の複数独立系メディア（CNBC/Forbes/VentureBeat/The Hacker News/Nextgov等、10以上の別々の報道機関）による相互一致（コンセンサス）で裏取りしている。直接閲覧しての一字一句確認ではない点に留意。
- Standard Enterprise の従量課金詳細（credits未設定時に利用不可という条件）は簡略化して1行に収めている。承認者が詳細を出す場合はVentureBeat記事の原文確認を推奨。
- 「99%超」はAnthropicが独自テストで示した数値（第三者による再現検証ではない）。
- 画像添付: 未（Anthropic公式ブログのタイムライン図等を添付するかは承認者判断）。
