# 下書き: xAI「Voice Agent Builder」ベータ公開 — レビュー待ち

- **アカウント/媒体**: maru-ai / x
- **ネタ**: xAIが電話音声AIエージェントのノーコード構築ツール「Voice Agent Builder」をベータ公開
- **発表日**: 2026-07-01（鮮度: 実行日2026-07-03からtoday−2日 → 3日ルール内）
- **state**: 01_review_queue（下書き・未承認・未投稿）
- **担当**: gather→draft→verify を本セッションでインライン実行、数字は fact-checker subagent が独立レビュー

## 下書き案（速報 / プレーンテキスト・maru-ai voice 準拠）

【速報】xAIが「Voice Agent Builder」をベータ公開(7/1)

Grok Voiceベースで、電話対応の音声AIエージェントをノーコードで作れるツールだね。

【要点】
・平文で通話の流れを書くだけで音声エージェントが約2分で完成
・料金は音声$0.05/分＋電話番号利用$0.01/分(アカウントに無料番号1つ付き)
・25言語以上に対応(会話中の言語切替も可)、80種類超の音声＋自声クローン機能も
・従来型のSTT+LLM+TTSを繋ぐ構成ではなく、単一のspeech-to-speechモデルで完結する設計

【ポイント】
電話AIを自前で組む場合につきものの"継ぎ目"(遅延・コスト増・失敗点)を1本化でまとめて減らす狙い。価格の安さが目立つけど、実運用での品質・安定性はこれから検証されていく段階だね。

ソース(一次)
https://x.ai/news/grok-voice-agent-builder

## 使った一次ソース
- 公式（一次）: https://x.ai/news/grok-voice-agent-builder 「Introducing the Voice Agent Builder」
- 補助（一次・製品ページ）: https://x.ai/voice
- 補助（二次・数字クロスチェック用、独立した複数媒体）:
  - https://www.eesel.ai/blog/grok-voice-agent-builder
  - https://letsdatascience.com/news/xai-launches-voice-agent-builder-for-grok-voice-706092b4
  - https://cryptobriefing.com/xai-voice-agent-builder-beta-pricing/
  - https://www.basenor.com/blogs/news/xai-launches-grok-voice-agent-builder-beta-for-developers

## コンプラ自己チェック（compliance.md 準拠）
- [x] 出典あり／誇張なし／事実と解釈を分離／噂は使用していない
- [x] AI生成はプロフィール担保／プレーンテキスト・絵文字なし・見出しは【】・番号ラベルなし
- [x] 個別株の投資勧誘・売買推奨に該当する記述なし
- [x] 数字の独立レビュー（fact-checker subagent・別context）実施 → 結果は下記「独立レビュー結果」参照

## 独立レビュー結果（fact-checker subagent・別context）
判定一覧（7項目）:
1. 発表日2026-07-01・3日鮮度以内 → **VERIFIED**
2. 料金 $0.05/分(音声)＋$0.01/分(電話)・無料番号1つ付き → **VERIFIED**
3a. 25言語以上・会話中切替可 → **VERIFIED**
3b. 80種類超のボイス → **VERIFIED**
3c. 自声クローン「音声約2分から生成」 → **UNVERIFIABLE**（2026年4月30日発表の別機能「Custom Voices」の仕様(録音1分・処理2分以内)と混同している可能性があり、Voice Agent Builder本体の数値として裏取りできず）
4. セットアップ「約2分」 → **VERIFIED**（公式ページ見出し自体が"Under 2 Minutes"と複数二次ソースが一致して報告）
5. 単一speech-to-speechモデル vs 従来STT+LLM+TTS構成の対比 → **VERIFIED**（誇張なし）
6. 「電話対応の音声AIエージェントをノーコードで作れるツール」という要約 → **VERIFIED**（過大評価なし）
7. ソースURL実在性 → **VERIFIED（限定的）**（複数の独立検索結果でタイトル・URLが一貫して出現するが、WebFetch不通のため本文直接確認はできず）

→ 3cの「音声約2分から」という具体的秒数の断定を**本文から削除**（対応済み。上記本文は修正後）。他6項目は複数の独立二次ソースが一致しており大きな誤りなし。

## 未確認点 / レビュー観点
- 本セッションの WebFetch ツールが環境要因で全面的に 403 を返し（x.ai・anthropic.com・wikipedia.org 等、無関係な複数サイトでも再現する環境側の問題）、xAI公式ページの直接フェッチができなかった。そのため一次ソースの内容は WebSearch 経由の要約と、独立した複数の二次メディア（eesel, letsdatascience, cryptobriefing, basenor, glenrhodes, alphasignal 等）が共通して報告する引用・数字のクロスチェックで裏取りしている。一次ソースの本文を直接確認したものではない点は残存する未確認点として明記する。
- 自声クローンに必要な音声長（「約2分」等の具体的秒数）は、別機能「Custom Voices」(2026-04-30発表)との混同の可能性があり本文から削除した。
- xAIの音声モデル「Grok Voice Think Fast 1.0」の τ-voice Bench スコア(67.3%、他モデル比較)は2026年4月発表の**別ニュース**（本Builderの新情報ではない）かつxAI自己申告・未第三者検証のベンチのため、本文からは除外した（鮮度ルール外・自己採点ベンチの誇張回避）。
- ベータ版のため、料金・仕様は今後変更される可能性がある旨は本文には明記していない（速報の性質上）。
