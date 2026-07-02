# 下書き: Anthropic「Claude Fable 5」「Mythos 5」提供再開 — 承認待ち

- **アカウント/媒体**: maru-ai / x
- **ネタ**: 米商務省の輸出規制解除を受け、Anthropicが「Claude Fable 5」「Mythos 5」の提供を再開
- **発表/事象日**: 輸出規制解除の発表 2026-06-30、Fable 5 全世界再開 2026-07-01（実行日2026-07-02から起算し today-1〜2日 → 3日ルール内）
- **state**: 01_review_queue（下書き・未承認）
- **担当**: 本セッションで discover→draft→verify を実施

## 下書き案（速報スレッド / プレーンテキスト・maru-ai voice 準拠）

※空行区切り。ネタが濃いためスレッド構成（1ツイート140字目安、必要なら分割）。

【速報】
Anthropicが「Claude Fable 5」「Mythos 5」の提供を再開したぞ(7/1)。米商務省が輸出規制を解除したのを受けた措置だね。

補足)
6/12に米商務省が国家安全保障を理由に輸出規制を発動し、両モデルは全世界で提供停止になっていた。

【経緯】
・6/9 Fable 5公開(最上位Mythosクラスモデル)
・6/12 米商務省がAnthropicに書簡を送付し外国籍ユーザーへの提供を禁止→対象を絞れずFable 5・Mythos 5とも全世界で停止
・6/26 商務長官がMythos 5について、防御的サイバー用途に限り信頼できる米企業・政府機関など100社超への限定提供を承認
・6/30 商務省が両モデルの輸出規制を全面解除とAnthropicが発表
・7/1 Fable 5をClaude Platform・Claude.ai・Claude Code・Claude Cowork上で全世界向けに再開

【今回の条件】
・Pro/Max/Team/一部Enterpriseは7/7まで週次利用上限の最大50%分をFable 5に充当可能
・7/7以降は従量のusage creditsに移行、価格は入力$10/出力$50(100万トークンあたり)

【ポイント】
発端はAmazonのセキュリティ研究者が「既知の脆弱性を含むコードを直して」と依頼したところ、Fable 5が悪用実証コードまで生成した点。米政府はこれを「ジェイルブレイク」と説明する一方、外部専門家(セキュリティ企業Luta SecurityのKatie Moussouris氏)は「防御目的のプロンプト操作でジェイルブレイクではない」と反論していて評価は割れているね。米国のAI輸出規制が実際に発動→解除された初の事例級の出来事だね。

ソース(一次)
https://www.anthropic.com/news/redeploying-fable-5

## 使った一次/情報源
- 公式（一次・存在と内容を複数の信頼メディアが直接引用/参照で確認。本セッションのネットワークポリシーによりWebFetch直接取得は403でブロックされたため、下記の独立系メディア複数による直接引用・整合を根拠に採用）: https://www.anthropic.com/news/redeploying-fable-5
- CNBC (2026-06-30, 輸出規制解除の一報): https://www.cnbc.com/2026/06/30/anthropic-says-trump-admin-has-lifted-export-controls-on-claude-fable-5-and-mythos-5.html
- CNBC (2026-06-26, Mythos 5限定復旧): https://www.cnbc.com/2026/06/26/us-government-anthropic-claude-mythos5-ai.html
- TechCrunch (2026-06-26, Mythos5 100社超への提供): https://techcrunch.com/2026/06/26/trump-admin-releases-anthropic-mythos-to-be-used-by-more-than-100-us-companies-agencies/
- Axios (2026-06-30, 輸出規制解除): https://www.axios.com/2026/06/30/trump-anthropic-ai-model-fable-restrictions
- 9to5Mac (2026-07-01, Fable5全世界再開): https://9to5mac.com/2026/07/01/claude-fable-5-cleared-to-return-as-us-lifts-anthropics-export-control-restriction/
- The Hacker News (2026-07-01, 経緯まとめ・ジェイルブレイク論争): https://thehackernews.com/2026/07/anthropic-restores-claude-fable-5-after.html
- SearchEngineJournal / TweakTown / TheNewStack（利用上限50%・7/7以降の従量課金$10/$50、複数媒体で一致）:
  https://www.searchenginejournal.com/anthropics-claude-fable-5-is-back-with-new-usage-limits-and-safeguards/581231/
  https://www.tweaktown.com/news/112412/anthropic-brings-fable-5-back-but-customers-get-fewer-free-days-than-originally-offered/index.html
  https://thenewstack.io/how-anthropic-is-bringing-fable-5-back/
- Forbes (2026-06-16, 6/12停止の経緯・書簡の詳細): https://www.forbes.com/sites/anishasircar/2026/06/16/anthropic-disabled-fable-5-and-mythos-5-after-a-us-export-control-order-heres-what-happened/
- Fortune (2026-06-13/06-14, Amazon起点の経緯・ジェイルブレイク論争の反論側): 
  https://fortune.com/2026/06/13/anthropic-fable-mythos-models-commerce-deparment-export-restrictions-jailbreak-defense-prompting/
  https://fortune.com/2026/06/14/how-a-warning-from-amazon-led-the-white-house-to-shut-down-anthropics-mythos-model/

## コンプラ自己チェック（compliance.md 準拠）
- [x] 出典あり（一次URL＋独立系メディア複数の直接引用で内容一致を確認）
- [x] 事実（経緯・日付・条件）と解釈（【ポイント】での評価割れの紹介）を区別。断定的な将来予測はしない。
- [x] 誇張・ステマなし。政府/企業いずれの主張にも肩入れせず両論併記（「ジェイルブレイクか否か」で意見が割れている旨を明記）。
- [x] 個別株の投資勧誘・売買推奨は含まない。
- [x] AI生成である旨はプロフィール担保。プレーンテキスト・絵文字なし・見出しは【】・番号ラベルなし。
- [x] 数字の独立レビュー: fact-checker agent（別context・WebSearchのみ、WebFetchはサンドボックスのegressポリシーで403のため利用不可）で本文の9項目（日付5点・数字/固有名詞4点）を検証。**9/9 CONFIRMED、WRONG/UNVERIFIABLEなし**。修正不要と判定（詳細は下記セクション）。

## 数字の独立レビュー結果（fact-checker agent・別context）

検証項目と判定（すべて複数独立ソース一致によりCONFIRMED）:
1. Fable 5/Mythos 5 提供再開(7/1) — CONFIRMED（9to5Mac, VentureBeat, TechTimes, Anthropic公式）
2. 6/12 商務省の輸出規制発動・全世界停止 — CONFIRMED（Anthropic公式X/公式声明, Forbes, Euronews, Fortune）
3. Fable 5 は6/9公開（最上位Mythosクラス） — CONFIRMED（TechCrunch, CNBC, Anthropic公式）
4. 6/26 Mythos 5の100社超への限定提供承認 — CONFIRMED（TechCrunch, CNBC, CNN, NBC News, Semafor）。Fable 5はこの承認の対象外という点も本文と整合
5. 6/30 輸出規制の全面解除発表 — CONFIRMED（CNBC, Axios, Fox Business, Forbes）
6. Pro/Max/Team/一部Enterpriseの7/7までの週次利用上限50%充当 — CONFIRMED（SearchEngineJournal, digitalapplied.com）
7. 7/7以降の従量課金 入力$10/出力$50（100万トークン） — CONFIRMED（digitalapplied.com, TweakTown, Anthropic公式スニペット）
8. Amazon研究者の「Fix this code」経由での悪用実証コード生成 — CONFIRMED（軽微な簡略化はあるが事実として矛盾なし。実際は「レビュー依頼→拒否→言い換え」の2段階。Fortune, The Register, Cybernews）
9. 「ジェイルブレイク」vs Katie Moussouris氏(Luta Security)の反論 — CONFIRMED（Fortune, The Register, TheHackerNews, TechTimes）

総評: WRONG/UNVERIFIABLEな箇所は検出されず、本文の修正は不要。「Claude Cowork」の実在およびFable5再開先としての組み合わせもVentureBeat記事と一致確認済み。

## 未確認点 / レビュー観点
- Anthropic公式ブログ本文（anthropic.com/news/redeploying-fable-5）は本セッションのサンドボックス環境でWebFetchが全面的に403（`curl $HTTPS_PROXY/__agentproxy/status` で確認した組織のegressポリシーによるブロックで、対象サイト固有の問題ではない。example.comへのWebFetchも同様に403）となり直接閲覧できなかった。存在・見出し・引用内容は検索結果と複数の独立系メディアの直接引用・整合により裏取りしたが、**本文の一字一句までは未確認**。
- 「全世界停止からの停止日数」はメディアにより「19日間」「20日間」など表記が割れていたため、本文には具体的な停止日数を書かず、日付の列挙のみで構成した。
- 「ジェイルブレイクか否か」は米政府と一部専門家の間で評価が割れている論争中の論点。本文では断定せず両論併記にとどめた。
- usage creditsの$10(入力)/$50(出力)は複数の独立系メディア（SearchEngineJournal, TweakTown, TheNewStack, MindStudio, ayautomate等）で一致。ただし一次のAnthropic公式ページ本文は直接確認できていない。
- Mythos 5の「100社超」は govconwire/TechCrunch/CNBC等で一致（「roughly 100」「more than 100」の表現）。正確な社数の公式数値は非公開の可能性があり、本文では「100社超」とやや丸めた表現にとどめた。
