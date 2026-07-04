# 下書き: Anthropic「Claude Fable 5 / Mythos 5」輸出規制解除・アクセス復旧 — 承認待ち

- **アカウント/媒体**: maru-ai / x
- **ネタ**: 米商務省の輸出規制命令が解除され、Anthropicが Claude Fable 5（グローバル）/ Mythos 5（審査済み組織限定）のアクセスを7/1に復旧
- **発表日**: 2026-07-01（鮮度: today(7/4)−3日 → 3日ルール内ギリギリ）
- **state**: 01_review_queue（承認待ち・投稿はしていない）
- **担当**: discover→draft は本エージェント、数字は fact-checker agent（別 context）で独立レビュー実施

## 下書き案（速報 / プレーンテキスト・maru-ai voice 準拠）

※空行区切りでスレッド想定。文字数次第で単発1ツイートに圧縮可（前例: Sonnet 5投稿を参照）。

【速報】
Anthropic、Claude Fable 5とMythos 5のアクセスを7月1日に復旧させたぞ。米政府の輸出規制命令が6月30日付で撤回されたことを受けた対応だね。

米商務省が6月12日に出した規制で一時停止されてから19日ぶりの復活。

【要点】
・6/12 米商務省がFable 5・Mythos 5への輸出規制命令。Amazonの研究者がFable 5のセキュリティ回避手法(jailbreak)を報告したのが契機
・6/30 商務長官ルトニック氏が規制撤回の書簡を送付
・7/1(水) Fable 5はClaude Platform・Claude.ai・Claude Code・Claude Coworkでグローバルに復活。Mythos 5はProject Glasswing経由の審査済み組織限定のまま
・Pro/Max/Team/一部Enterpriseは7/7まで週次利用上限の最大50%としてFable 5利用可(追加課金なし)、7/8以降は利用クレジット(従量課金)制に移行
・AWS/Google Cloud/Microsoft Foundry経由のアクセスも順次復旧中

【ポイント】
国家安全保障を理由にした主要AIモデルへの輸出停止命令→解除という珍しい大型事例。Mythos 5は引き続き制限付きで、規制の全面解除ではなく政府とのモデル別リスク管理が続いている形だね。

ソース
https://www.anthropic.com/news/redeploying-fable-5

## 使った一次ソース・裏取りソース
- 一次（公式・タイトルのみ確認、本文は直接取得不可）: https://www.anthropic.com/news/redeploying-fable-5 ／ https://www.anthropic.com/news/fable-mythos-access ／ https://www.anthropic.com/glasswing
  - 注: WebFetchでanthropic.comへの直接アクセスがBOTブロックで403となり本文を直接引用できず。以下の独立報道多数の相互一致で裏取り。
- 独立報道（相互に矛盾なく一致）:
  - https://www.cnbc.com/2026/06/30/anthropic-says-trump-admin-has-lifted-export-controls-on-claude-fable-5-and-mythos-5.html
  - https://9to5mac.com/2026/07/01/claude-fable-5-cleared-to-return-as-us-lifts-anthropics-export-control-restriction/
  - https://www.marktechpost.com/2026/07/01/anthropic-redeploys-claude-fable-5-on-july-1-after-us-export-controls-lift-adds-new-cybersecurity-classifier/
  - https://www.forbes.com/sites/anishasircar/2026/06/16/anthropic-disabled-fable-5-and-mythos-5-after-a-us-export-control-order-heres-what-happened/
  - https://www.searchenginejournal.com/anthropics-claude-fable-5-is-back-with-new-usage-limits-and-safeguards/581231/
  - https://venturebeat.com/technology/anthropic-is-bringing-back-claude-fable-5-globally-after-us-lifts-export-control-order-where-can-enterprises-access-it
  - https://www.marketscale.com/industries/software-and-technology/us-lifts-export-controls-on-anthropics-claude-fable-5-and-mythos-5-ending-19-day-shutdown
  - https://www.aboutamazon.com/news/aws/claude-fable-5-anthropic-available-amazon-bedrock

## 数字の独立レビュー（fact-checker agent・別context）結果
全6項目とも **CORRECT**（判定日: 2026-07-04）。

1. 6/12 米商務省が輸出規制命令発令（Amazon研究者のjailbreak発見が契機）→ CORRECT（CNBC/Forbes/CyberScoop/TheHackerNews一致）
2. 6/30 商務長官Lutnickが規制撤回の書簡送付 → CORRECT（CNBC/Washington Post/Fox Business一致）
3. 7/1(水) 復旧開始。Fable 5グローバル復活、Mythos 5はProject Glasswing経由の審査済み組織限定 → CORRECT（9to5mac/MarkTechPost/CNBC/Anthropic公式Glasswingページ一致。曜日計算も一致）
4. 停止期間19日間(6/12〜7/1) → CORRECT（多数派ソース・単純日数計算と一致）。**ただし一部の二次・三次記事は「18日間」表記の揺れあり**
5. Pro/Max/Team/一部Enterpriseは7/7まで週次上限の最大50%、7/8以降は利用クレジット制($10/M入力・$50/M出力) → CORRECT（SearchEngineJournal/DigitalApplied/TweakTown一致）
6. AWS/Google Cloud/Microsoft Foundry経由のアクセスも順次復旧中 → CORRECT（aboutamazon.com/VentureBeat一致。AWS Bedrockは7/1時点で先行復旧確認）

総合判定: 修正必須の誤りなし。投稿キューに出して問題なし。

## コンプラ自己チェック（compliance.md 準拠）
- [x] 出典あり（一次URLは直接引用不可だったため、独立報道の相互一致で裏取り。上記に明記）
- [x] 誇張・ステマなし（規制解除を淡々と事実ベースで記述。Mythos 5が依然制限付きである点も明記し過度な持ち上げを回避）
- [x] 事実と解釈を分離（【要点】＝事実、【ポイント】＝解釈）
- [x] 噂・未確認の断定なし（本文中の全記述は複数独立ソース一致のCORRECT判定項目のみ）
- [x] 個別株の投資勧誘・売買推奨なし
- [x] AI生成である旨はプロフィール(bio)で担保／プレーンテキスト・絵文字なし・見出しは【】・番号ラベルなし

## 未確認点 / レビュー観点
- 「19日間」の停止期間表記について、多数派ソースは19日間で一致（単純日数計算も6/12→7/1で19日）だが、ごく一部の二次・三次記事（要約サイト等）は「18日間」としており表記の揺れが存在する。Anthropic公式本文を直接確認できればより確実（本文引用は403でブロックされ未達成）。
- anthropic.com への WebFetch は一貫して403(BOTブロックと推定)。一次ソースURLは正しいと考えられるが、本文の直接引用による最終確認は今回できていない。
- 画像添付: 未（公式図・スクショなし。テキストのみの下書き）。
- posted.md / review_queue 照合: 既出の「2026-06-30 Claude Sonnet 5リリース」とは別ネタ（本件は輸出規制解除の規制・政策ニュース）であり重複なし。
