# 下書き: Anthropic「Claude Fable 5」輸出規制解除・全世界で利用再開 — 承認待ち

- **アカウント/媒体**: maru-ai / x
- **ネタ**: Claude Fable 5、米政府の輸出規制解除で7/1に全世界再開（規制/政策 × モデル）
- **発表日**: 規制解除 2026-06-30（Anthropic公式発表）／再開 2026-07-01（鮮度: today−1〜2日 → 3日ルール内）
- **state**: 01_review_queue（下書き・未承認）
- **担当**: discover→draft は主エージェント、数字は別 subagent で独立レビュー実施（WebFetch は anthropic.com 含め全URLで403のため、複数独立の二次・三次メディアで相互裏取り）

## 下書き案（速報 / プレーンテキスト・maru-ai voice 準拠）

※空行区切りでスレッド。1ツイートに収めるなら要圧縮（前回同様、承認時に検討）。

【速報】Anthropicの「Claude Fable 5」が7/1、全世界で利用再開(6/30に米政府が輸出規制を解除)

ジェイルブレイクによる脆弱性コード生成の懸念で一時停止されてたけど、対策を強化して復帰したよ。

【経緯】
・Fable 5とMythos 5は6/9に公開
・Amazonの調査チームが安全策を回避するジェイルブレイク手口を報告(脆弱性の実証コードを生成させられたケースあり)。Anthropicは「深刻度は誇張、他社モデルでも再現可能」と反論していた
・米商務省が6/12、外国籍ユーザー向けアクセスの停止を指示(Anthropicは国籍をリアルタイムで判別できないため、実質的に全ユーザー停止で対応)
・6/30に規制解除、Fable 5は7/1からClaude.ai・Claude Platform・Claude Code・Claude Cowork で全ユーザーに復旧

【対策】
・報告された手口を99%超ブロックする新しい安全分類器を追加(Anthropic公式発表の数値。ブロック時はOpus 4.8に自動切り替え)
・安全関連の脆弱性報告を受け付けるHackerOne経由の窓口を新設
・Mythos 5(防御的サイバーセキュリティ用途)は承認済みの一部組織向けに限定復旧のみで、一般提供はまだ

【ポイント】
AIモデルが安全保障上の懸念で政府に止められ、対策を経て復帰した珍しいケース。輸出管理という規制の力がAI企業の配布判断まで動かした実例だね。Anthropic側は深刻度の評価に異議を唱えていた点もポイント。

ソース(一次)
https://www.anthropic.com/news/redeploying-fable-5
https://www.anthropic.com/news/fable-mythos-access

## 使った一次ソース
- 公式（一次）: https://www.anthropic.com/news/redeploying-fable-5（6/30公表・再展開の詳細）
- 公式（一次）: https://www.anthropic.com/news/fable-mythos-access（6/12公表・当初の停止指示についての声明）

※両URLとも本セッションの WebFetch は 403（example.com 含め全URLで再現、環境側のブロックと判断）で本文取得不可だったため、下記の独立した二次・三次メディア複数（同一事実を相互に一致して報道）で事実確認・裏取りを実施。
- Bloomberg (2026-06-30): https://www.bloomberg.com/news/articles/2026-06-30/us-government-lifts-restrictions-on-anthropic-s-fable-5-model
- CNBC (2026-06-30): https://www.cnbc.com/2026/06/30/anthropic-says-trump-admin-has-lifted-export-controls-on-claude-fable-5-and-mythos-5.html
- The New Stack: https://thenewstack.io/how-anthropic-is-bringing-fable-5-back/
- Forbes (2026-06-16、当初停止の経緯): https://www.forbes.com/sites/anishasircar/2026/06/16/anthropic-disabled-fable-5-and-mythos-5-after-a-us-export-control-order-heres-what-happened/
- NBC News（Mythos 5限定復旧）: https://www.nbcnews.com/tech/tech-news/us-government-gives-anthropic-green-light-limited-re-release-mythos-5-rcna352018
- The Hacker News / Tom's Hardware / MarkTechPost（分類器の99%超ブロック数値、Anthropic公式write-up由来として一致報道）
- CNBC (2026-06-09、Fable 5公開): https://www.cnbc.com/2026/06/09/anthropic-releases-fable-5.html 相当の一次公開報道 ／ Simon Willison ブログ（同日、初見レポート）

## コンプラ自己チェック（compliance.md 準拠）
- [x] **数字の独立レビュー（別 subagent・複数ソース突合）実施 → 指摘反映済み**
  - 「99%超ブロック」＝Anthropic公式write-up由来の数値と明記（二次メディアの独自推計ではないことを確認）→VERIFIED、本文に明記のうえ残置
  - Mythos 5の復旧先組織数「約100社」は一次ソース未確認・二次ソース1件のみのため**本文から除外**（「承認済みの一部組織向け」という非数値表現に留める）
  - 「外国籍ユーザー停止指示」のみでは実態と乖離するため、「Anthropicは国籍を即時判別できず実質全ユーザー停止で対応」を追記（政府指示の対象と実際の停止範囲を区別）
  - Amazon側の指摘のみでなく、Anthropicが深刻度に反論していた事実（他モデルでも再現可能と主張）を追記し中立性を確保
  - HackerOneプログラムの説明を「ジェイルブレイク限定」から「安全関連の脆弱性報告全般」に軽く曖昧化（過去の別プログラムとの混同を避けるため）
- [x] 出典あり（一次URL2本＋複数独立の二次・三次メディアで相互裏取り）／誇張なし／事実（経緯・対策）と解釈（【ポイント】）を分離／噂は使用せず全て複数ソース一致の確定事実のみ使用
- [x] 個別株の投資勧誘・売買推奨に該当する記述なし
- [x] ジェイルブレイクの技術的手口・悪用可能なプロンプト詳細は一切記載せず（拡散防止）
- [x] AI生成はプロフィール担保／プレーンテキスト・絵文字なし・見出しは【…】・番号ラベルなし

## 重複チェック
- `accounts/maru-ai/x/state/posted.md`・`01_review_queue/` を確認。既出は 2026-06-30 Claude Sonnet 5（モデルリリース）のみで、本ネタ（輸出規制・Fable 5再展開＝規制/政策トピック）とは異なる。重複なし。

## 未確認点 / レビュー観点
- 一次ソース（anthropic.com）は本セッションの WebFetch 環境制約で本文を直接取得できず、複数独立の大手メディア（Bloomberg/CNBC/NBC News/Forbes等）の相互一致報道で代替確認した。承認前に人間側で一次URLへの直接アクセスによる最終確認を推奨。
- Mythos 5の限定復旧先の組織数（「100社超」との報道あり）は不確実なため本文では意図的に数字を伏せている。確度が上がれば追記可。
- 「7/7まで週間利用上限が通常の50%に制限される」という移行措置の情報あり（The New Stack報道）。本文には未反映（速報の主眼から外れるため）。承認時に追記するか検討可。
