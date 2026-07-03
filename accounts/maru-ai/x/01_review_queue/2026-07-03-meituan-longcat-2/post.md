# 下書き: Meituan(美団)「LongCat-2.0」発表 — 承認待ち

- **アカウント/媒体**: maru-ai / x
- **ネタ**: 中国Meituan(美団)が1.6兆パラメータの新モデル「LongCat-2.0」を発表
- **発表日**: 2026-06-30（鮮度: today(2026-07-03)−3日 → 3日ルール内ギリギリ）
- **重複チェック**: `posted.md`・既存 `01_review_queue/`（README.mdのみ）と照合し重複なし。GitHub上のオープンPR（`is:pr LongCat` / `is:pr Meituan` で検索）も **0件で重複なし**（Claude Science・Fable 5・Nano Banana 2 Lite等は既に他PRで多数カバー済みのため除外し、本ネタを選定）
- **担当**: gather→draft は本セッション、数字は `fact-checker` agent（別context）で独立レビュー実施→反映済み

## 下書き案（速報・プレーンテキスト・maru-ai voice 準拠）

※空行区切り。1ツイートに収まらない場合はこの単位でスレッド分割（番号ラベル・区切り線なし）。

【速報】中国Meituan(美団)が1.6兆パラメータの新モデル「LongCat-2.0」を発表(6/30)

発表前からOpenRouterで覆面運用され、利用ランキング上位に食い込んでいたことも判明、って話題だね。

【概要】
・MoE構成で総パラメータ1.6兆、1トークンあたりの稼働パラメータは平均480億(需要に応じ330億〜560億で変動)
・ネイティブ100万トークンのコンテキストに対応
・学習は中国国産チップ(詳細非公表のASIC)のみで実施と説明。フロンティア級モデルでは初の全量国産チップ学習という位置づけ(Meituan側の説明)

【ライセンス/公開状況】
・GitHub/Hugging Faceのリポジトリ自体はMITライセンスで登録済み
・ただしモデルの重みは本稿時点で未公開(両ページとも「coming soon」表記)。「ライセンスは公開・重みはこれから」という段階で、フルオープンソース化はまだ完了していない点に注意

【価格】
・API標準価格は入力$0.75/出力$2.95(100万トークンあたり)、ローンチ記念価格は$0.30/$1.20
・GPT-5.5(入力$5/出力$30)やClaude Sonnet 5(入力$2〜3/出力$10〜15)より大幅に安い設定

【ポイント】
中国発の巨大モデルが国産チップだけで学習・かつ破格の低価格で登場したインパクトは大きいね。ただ「オープンソース」と言っても現時点は重み未公開でライセンス表明のみ、という段階は要注意だね。

ソース(一次)
https://www.longcatai.org/news/longcat-2

## 使った一次ソース
- 公式（一次）: https://www.longcatai.org/news/longcat-2
- 公式リポジトリ（一次・ライセンス/重み公開状況の確認用）: https://github.com/meituan-longcat/LongCat-2.0 、 https://huggingface.co/meituan-longcat/LongCat-2.0
  - 注: 環境内の WebFetch がこの環境では複数ドメインで一貫して403を返し直接本文取得ができなかった（既知の環境制約）。そのため WebSearch による複数独立ソースの横断一致で裏取りした。
- 参考（二次・複数独立ソースの一致で裏取り）:
  - https://venturebeat.com/technology/meituan-open-sources-longcat-2-0-the-1-6t-near-frontier-agentic-coding-model-thats-been-leading-openrouter-trained-entirely-on-chinese-chips
  - https://www.scmp.com/tech/tech-trends/article/3358854/china-debuts-biggest-ai-model-trained-local-chips-meituan-releases-longcat-20
  - https://www.opensourceforu.com/2026/06/meituan-open-sources-longcat-2-0-under-mit-license/
  - https://decrypt.co/372579/longcat-2-0-meituan-ai-stealth-model-openrouter

## 数字の独立レビュー（fact-checker agent・別context）結果と反映
- [x] 発表日2026-06-30 → **VERIFIED**（VentureBeat・SCMP等複数独立ソース一致）
- [x] 1.6兆パラメータ・MoE・稼働パラメータ平均480億(330億〜560億の可変幅) → **VERIFIED**（複数ソース一致。矛盾ではなく設計上の可変レンジ）
- [x] ネイティブ100万トークン文脈 → **VERIFIED**
- [x] MITライセンス登録 → **VERIFIED**
- [ ] → **重大な修正（最重要）**: fact-checkerが「モデルの重み公開の有無」を最優先で検証した結果、**WRONG**と判定。GitHub/Hugging Face両公式ページに「Model weights coming soon — stay tuned!」と明記されており、**重み自体は本稿時点で未公開**。一部二次報道の見出し（"open sources"）は本文の実態（重み未公開）と矛盾しており、そのまま採用すると誤報になるため、本文を「ライセンスは公開・重みは近日公開予定でまだ未公開」という正確な表現に修正した
- [x] 中国国産チップのみで学習 → **VERIFIED（ただしMeituan側の説明として）**。チップの具体的な型番（Ascend系など）は非公表のため断定せず「詳細非公表のASIC」と表記
- [x] 価格($0.75/$2.95標準、$0.30/$1.20ローンチ価格)、GPT-5.5・Claude Sonnet 5との比較 → **VERIFIED**（複数独立ソース一致）
- [x] 発表前にOpenRouterで覆面運用(Owl Alphaエイリアス)されランキング上位だった経緯 → **VERIFIED**（複数独立ソース一致）

## コンプラ自己チェック（compliance.md / voice-base.md 準拠）
- [x] 出典あり（一次URL明記）／噂ではなく確定発表
- [x] 誇張・ステマなし。「オープンソース化」の実態（重み未公開）を正確に区別して明記し、誤解を招く断定を回避
- [x] 事実（発表内容・スペック・価格・公開状況）と解釈（【ポイント】の位置づけコメント）を分離
- [x] 数字の独立レビュー実施・反映済み（fact-checker agentによる別context検証。重み公開有無の重大な誤りを検出・修正）
- [x] AI生成はプロフィール担保／プレーンテキスト・絵文字なし・見出しは【】・番号ラベルなし
- [x] 個別株の投資勧誘・売買推奨に該当する記述なし

## 未確認点 / レビュー観点
- 学習に使用したチップの具体的な型番・枚数は公式非公表のため本文に含めていない（「詳細非公表のASIC」とのみ表記）
- 稼働パラメータの「330億〜560億」という幅は複数の二次報道の記述に基づくもので、公式ページ本文からの直接引用確認はできていない
- 重みの実際の公開時期（「coming soon」の具体的な日付）は不明。次回セッションで公開されていれば本文の「未公開」表記を更新する必要あり
- 環境の WebFetch が本セッション中ずっと403を返し（複数サイトで再現）、一次ページの直接引用ができなかった。次回セッションでWebFetchが復旧していれば、一次ページ本文で再確認するのが望ましい
- 画像添付: 未（公式ページの図版を添付するかは要検討）

## 運用上の注意（このセッションで判明した問題）
- GitHub上に本ネタと同時期の maru-ai / maru-ir 下書きPRが**60件以上オープンのまま滞留**しており、うち「Claude Fable 5輸出規制解除」だけで約10件、「Nano Banana 2 Lite」で4件、「Claude Science」で2件の**ほぼ同一内容の重複PR**が確認された。原因は discover ステップが `posted.md`／ローカルの `01_review_queue`（masterブランチ）のみを照合し、**オープン中のPR（別ブランチ）を照合していない**ため、回を重ねるたびに同じネタで別ブランチ・別PRが量産されていると推測される。今回は事前にGitHub PR一覧を検索し重複を回避したが、恒久対応（discoverステップでオープンPRも照合する、または重複PRを人手で整理する）を推奨。
