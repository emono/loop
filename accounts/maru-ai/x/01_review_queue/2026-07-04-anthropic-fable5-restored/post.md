# 下書き: Anthropic「Claude Fable 5」輸出規制解除・再開 — 承認待ち

- **アカウント/媒体**: maru-ai / x
- **ネタ**: Claude Fable 5・Mythos 5 の輸出規制解除と再開（規制・政策／新モデルアプデ）
- **発表・発生日**: 2026-06-30（規制解除通知）／2026-07-01（サービス再開開始）→ 実行日(2026-07-04)から3日以内・鮮度ルール内
- **state**: 01_review_queue（未承認・投稿していません）
- **担当**: discover→draft は本エージェント、数字は fact-checker agent（別context）で独立レビュー実施

## 本文案（速報スレッド想定・プレーンテキスト・maru-ai voice準拠）

【速報】Anthropicが「Claude Fable 5」の提供を全世界で再開したぞ(7/1)

米商務省の輸出規制が6/30に解除されて、6/12から止まってたアクセスが再開だね。

【経緯】
・6/12、米政府が安全保障上の理由でFable 5とMythos 5に輸出規制を発動。外国籍ユーザーを実務上区別できず、Anthropicは全ユーザー向けアクセスを停止
・きっかけはAmazon側の研究者が、ソフトウェア脆弱性特定を装う手口でFable 5の安全対策を回避できると報告したこと
・6/30、商務省が規制解除を通知。7/1からClaude.ai・Claude Platform・Claude Code・Claude Cowork で順次再開

【対応】
・報告された回避手口をブロックする新しい分類器を追加、99%超のケースで検知・ブロックし、該当リクエストはClaude Opus 4.8に振り分け
・Pro/Max/Team・一部Enterpriseプランは7/7まで週次利用枠の最大50%をFable 5に充当、それ以降は利用クレジットで継続利用
・最強のサイバーセキュリティモデルという位置づけのMythos 5は、政府審査を経た米国の一部組織限定で再開(全面解禁はまだ)

【ポイント】
AIモデルが国家安全保障を理由に一度停止し、そのまま解除まで至った珍しいケース。脱獄対策と輸出規制の両立は今後も焦点になりそうだね。

ソース(一次)
https://www.anthropic.com/news/redeploying-fable-5
https://x.com/AnthropicAI/status/2072163884430229756

## 使った一次ソース
- 公式ニュース（一次）: https://www.anthropic.com/news/redeploying-fable-5
- 公式ニュース（一次・停止時の声明）: https://www.anthropic.com/news/fable-mythos-access
- 公式X（一次・再開告知）: https://x.com/AnthropicAI/status/2072163884430229756
- 公式X（一次・解除通知の告知）: https://x.com/AnthropicAI/status/2072106151890809341
- 公式X（一次・6/12停止時の声明）: https://x.com/AnthropicAI/status/2065597531644743999
- 参考（二次・クロスチェック）: https://venturebeat.com/technology/anthropic-is-bringing-back-claude-fable-5-globally-after-us-lifts-export-control-order-where-can-enterprises-access-it
- 参考（二次・クロスチェック）: https://www.searchenginejournal.com/anthropics-claude-fable-5-is-back-with-new-usage-limits-and-safeguards/581231/

## 数字の独立レビュー（fact-checker agent・別context・実施済み）
- 停止発動日(6/12)・停止理由(Amazon研究者によるソフトウェア脆弱性特定を装った脱獄手法の報告)：VERIFIED（複数二次報道一致）
- 規制解除通知日(6/30)：VERIFIED
- 再開日(7/1)・対象サービス：VERIFIED　※下書き初稿の誤記「Claude Coword」を「Claude Cowork」に修正済み
- 新分類器の回避手口ブロック率「99%超」：VERIFIED
- フラグ済みリクエストのOpus 4.8振り分け：VERIFIED
- Pro/Max/Team・一部Enterpriseの週次利用枠上限50%(7/7まで)・以降は利用クレジット：VERIFIED
- Mythos 5の位置づけ（最強のサイバーセキュリティモデル）・米国限定組織への再開・全面解禁はまだ：VERIFIED
- 本文中の3URL（公式ニュース1件＋公式X 2件）の実在・内容整合：VERIFIED
- 総合判定：WRONGは表記1点（Cowork）のみ、修正済み。他の削除・修正は不要（fact-checker結論）

## コンプラ自己チェック（compliance.md／voice-base.md 準拠）
- [x] 出典あり（一次：Anthropic公式ニュース＋公式Xポスト、複数二次報道でクロスチェック）
- [x] 憶測数字なし・すべて公式発表内容に基づく開示値
- [x] 噂・リークではなく確定事実（公式声明ベース）。断定的な将来予測はしていない
- [x] 事実（経緯・対応の各箇条書き）と解釈（【ポイント】）を分離
- [x] 誇張・ステマなし（Anthropic自身の規制対応を淡々と要約、過度な持ち上げなし）
- [x] 個別株の投資勧誘・売買推奨に該当する記述なし
- [x] AI生成である旨はプロフィール（bio）で担保
- [x] プレーンテキスト・絵文字なし・見出しは【…】・番号ラベルなし

## 未確認点 / レビュー観点
- AWS・Google Cloud・Microsoft Foundry上でのFable 5アクセス再開時期は「できるだけ早く」としか公式に明記がなく、本文では言及を見送った（未確定情報のため）。
- 「防御」対象の重要インフラ組織の具体名や件数（100件超等の報道あり）は、一次ソースで数値確定できなかったため本文に含めていない。
- 画像添付：未（Anthropic公式ブログのスクリーンショット等は未取得。原本改変なしで添付するなら要追加取得）。
- 本文はスレッド想定（5ブロック）。X投稿時は280字/ツイート制限のため、実投稿時に単発ツイートへの圧縮や画像添付の要否は人間判断で調整可。
