# 下書き: 上海AI Lab(InternScience)「Agents-A1」論文発表 — 承認待ち

- **アカウント/媒体**: maru-ai / x
- **ネタ**: 35BパラメータのMoEエージェントモデル「Agents-A1」論文公開（研究・オープンウェイト）
- **発表日**: 2026-06-29（arXiv投稿日。鮮度: 実行日2026-07-01からtoday−2日 → 3日ルール内）
- **state**: 01_review_queue（未承認・未投稿）
- **担当**: discover→gather→draftをメインエージェントが実施、数字は別subagentが独立レビュー実施

## 下書き案（速報 / プレーンテキスト・maru-ai voice 準拠）

※空行区切りで1ツイート（長ければスレッド分割可）。

【速報】上海AI Lab(InternScience)がエージェント特化の新モデル「Agents-A1」の論文を公開(6/29)

35Bパラメータ(MoE)という比較的小さいサイズながら、DeepSeek-V4-proやKimi-K2.6といった1兆パラメータ級モデルに迫る性能をうたう研究成果だね。

【ベンチマーク】
・GAIA: 96.0
・BrowseComp: 75.5
・重みはApache 2.0でHugging Face/GitHubに公開(オープンウェイト)

【ポイント】
数字は論文側の自己申告値で第三者による再現検証ではない点は留意。それでも小型モデルで巨大モデル級の実力をうたう研究として、長期軌跡データ・マルチ教師蒸留といったエージェント特化の学習手法に注目度高いね。

ソース(一次)
https://arxiv.org/abs/2606.30616
https://github.com/InternScience/Agents-A1

## 使った一次ソース
- arXiv論文（一次）: https://arxiv.org/abs/2606.30616
  「Scaling the Horizon, Not the Parameters: Reaching Trillion-Parameter Performance with a 35B Agent」（InternScience、2026-06-29投稿）
- 公式GitHub（一次・モデル/ライセンス確認）: https://github.com/InternScience/Agents-A1
- Hugging Face モデルページ（一次・配布確認）: https://huggingface.co/InternScience/Agents-A1
- Hugging Face Papers（論文まとめページ）: https://huggingface.co/papers/2606.30616

補足: 本セッションの環境ではWebFetch/直接HTTPアクセスが軒並み403でブロックされたため、上記一次ソースへの到達確認と数値突合はWebSearch経由の複数独立ソース集約（GitHub README直接取得を含む）で実施した。

## コンプラ自己チェック（compliance.md 準拠）
- [x] **数字の独立レビュー（別subagent・一次ソース突合）実施 → 修正反映済み**
  - VERIFIED（一次ソース由来）: arXiv投稿日(2026-06-29)／開発組織(InternScience/上海AI Lab)／35B MoE構成／BrowseComp 75.5／Apache 2.0ライセンス・HF-GitHub公開／DeepSeek-V4-pro・Kimi-K2.6との比較記述
  - VERIFIED（複数独立ソース一致、ただしabstract本文でなく結果表由来と推定）: GAIA 96.0
  - **修正**: 下書き初版にあった「GPT-5.5」との比較は、arXiv abstractの一次ソース抜粋に現れず二次メディア（ブログ/アグリゲータ）由来の可能性が高いと判定されたため、本文から削除。DeepSeek-V4-pro・Kimi-K2.6のみ（一次ソースで確認済み）を残した。
- [x] 出典あり／誇張なし（「自己申告値・第三者検証ではない」と明記して留保）／事実と解釈を分離／噂不使用
- [x] AI生成はプロフィール担保／プレーンテキスト・絵文字なし・番号ラベルなし／見出しは【】
- [x] posted.md・01_review_queue 照合 → 既出なし（新規ネタ）

## 未確認点 / レビュー観点
- GAIA 96.0はarXiv abstract本文中の文言としては直接確認できず、論文中の結果図表（ベンチマーク集計）由来と推定される。数値自体は複数独立ソースで一致しており信頼性は高いが、abstract発の記述ではない点は留意。
- 性能比較（DeepSeek-V4-pro・Kimi-K2.6級）は論文側の自己申告・自社ベンチマーク環境での比較であり、第三者による再現検証ではない。本文にもその旨明記済み。
- 画像添付: 未（公式リポジトリのベンチマーク図を添付するかは要検討）。
