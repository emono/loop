# 下書き: Anthropic「Claude Sonnet 5」リリース — 承認待ち

- **アカウント/媒体**: maru-ai / x
- **ネタ**: Claude Sonnet 5 リリース（中位モデル・エージェント強化）
- **発表日**: 2026-06-30（鮮度: today−1日 → 3日ルール内）
- **state**: 03_posted（配信済み 2026-07-01）
- **投稿URL**: https://x.com/marukun_ai/status/2072206252894269593
- **担当**: discover→draft は sub agent、数字は独立レビュー実施
- **実投稿版**: 280字制限のため下記スレッドは使わず、**単発1ツイートに圧縮**して投稿（下の「実際に投稿した本文」参照）。

## 実際に投稿した本文（1ツイート・改行整形）

【速報】Anthropic「Claude Sonnet 5」を発表(6/30)
中位なのに“Opus 4.8に近い”とうたうエージェント特化型。

・Free/Proの既定に、導入料金は入力$2/出力$10
・OSWorld 82.1%(Opus 4.8は86.2%)

安く回すエージェント枠だね。
anthropic.com/news/claude-sonnet-5

※Xが公式リンクカード（Claude Sonnet 5）を自動付与。

---

## 下書き案A（速報 / プレーンテキスト・maru-ai voice 準拠）

※空行区切りで1ツイート。

【速報】Anthropicが「Claude Sonnet 5」を出したぞ。(6/30発表)

中位モデルなのに“Opus 4.8に近い”とうたう新型で、エージェント用途が主戦場だね。

【料金】
・Free/Proの既定モデルに。Claude Code・APIでも利用可(claude-sonnet-5)
・導入価格(〜8/31): 入力$2 / 出力$10（100万トークンあたり）
・以降は 入力$3 / 出力$15

【性能】
・公式ベンチのOSWorld-Verified(自律PC操作)で82.1%（Sonnet 4.6は78.5%、Opus 4.8は86.2%）
・「最もエージェント的なSonnet」。ブラウザや端末を使って自律実行できるとのこと

【ポイント】
公式はSonnet 5を「Opus 4.8に近い性能」と表現。ただ公式ベンチの数字自体はOpus 4.8が上（OSWorld 86.2%）。トップ性能はOpus、コスパのエージェントはSonnet 5、って住み分けだね。

ソース（一次）
https://www.anthropic.com/news/claude-sonnet-5

---

## 使った一次ソース
- 公式（一次）: https://www.anthropic.com/news/claude-sonnet-5
- 補助（二次・数字クロスチェック）: https://techcrunch.com/2026/06/30/anthropic-launches-claude-sonnet-5-as-a-cheaper-way-to-run-agents/

## コンプラ自己チェック（compliance.md 準拠）
- [x] **数字の独立レビュー（別AI・公式突合）実施 → 修正反映済み**
  - 料金($2/$10→$3/$15)・名称・API id・Free/Pro既定・「最もエージェント的」＝**公式一致(VERIFIED)**
  - ベンチを **公式記載の OSWorld-Verified(82.1/78.5/86.2)** に差し替え（旧63.2/58.1/69.2は公式テキストに無くTechCrunch由来・名称も"SWE-bench Pro"説のため撤去）
  - 「高精度はOpus 4.8が本命とAnthropicが明言」→公式に無いため撤去。公式表現「Opus 4.8に近い」＋公式ベンチ数値ベースに修正
- [x] 出典あり／誇張なし（“近い”と留保、Opus優位も数字で明示）／事実と解釈を分離／噂不使用
- [x] AI生成はプロフィール担保／プレーンテキスト・絵文字なし・番号ラベルなし

## 使った一次ソース（更新）
- 公式（一次・料金/ベンチ/位置づけ）: https://www.anthropic.com/news/claude-sonnet-5
- 参考（二次）: https://techcrunch.com/2026/06/30/anthropic-launches-claude-sonnet-5-as-a-cheaper-way-to-run-agents/

## 未確認点 / レビュー観点
- OSWorld-Verified の数値は公式ページ記載（画像表を含む）由来。厳密運用ならシステムカードで再確認可。
- 数字はすべて公式の開示値（実測ではない）。
- 画像添付：未（公式ブログのベンチ表スクショを付けるかは要検討）。
