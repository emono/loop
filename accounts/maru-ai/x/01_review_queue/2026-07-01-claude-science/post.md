# 下書き: Anthropic「Claude Science」発表 — 承認待ち

- **アカウント/媒体**: maru-ai / x
- **ネタ**: Anthropic「Claude Science」（研究者向けAIワークベンチ、新プロダクト）
- **発表日**: 2026-06-30（鮮度: today(2026-07-01)−1日 → 3日ルール内）
- **state**: 01_review_queue（下書き・未承認）
- **担当**: discover→draft は本エージェント、数字は別 subagent で独立レビュー実施

## 下書き案（速報 / プレーンテキスト・maru-ai voice 準拠）

※空行区切りで1ツイート相当（長尺のためスレッド想定）。

【速報】Anthropicが研究者向けAIワークベンチ「Claude Science」を発表(6/30)

新モデルではなく、既存のClaudeを科学研究向けにパッケージ化した新プロダクトだね。

【概要】
・生物学/化学分野向けの研究補助アプリ。UniProt・Ensembl・PDBなど60以上の科学データベースを統合
・タンパク質構造や遺伝子ブラウザなどの成果物(アーティファクト)を生成、引用・計算をチェックする専用AIも搭載
・使うモデルはOpus 4.8など既存のClaudeのみ(公式に「新モデルではない」と明言)
・Claude Pro/Max/Team/Enterpriseでベータ提供開始

【支援プログラム】
・最大50件の研究プロジェクトに、それぞれ最大3万ドル分のクレジットを提供
・応募締切7/15、採択通知7/31、実施期間9/1〜12/1

【ポイント】
新しい頭脳(モデル)ではなく「研究のワークフローそのもの」を製品化した点がミソ。地味だけど科学者の作業時間を直接削れる方向性だね。

ソース(一次)
https://www.anthropic.com/news/claude-science-ai-workbench

## 使った一次ソース
- 公式（一次）: https://www.anthropic.com/news/claude-science-ai-workbench
- 公式イベント: https://www.anthropic.com/events/the-briefing-ai-for-science
- 補助（二次・数字クロスチェック）: https://www.bloomberg.com/news/articles/2026-06-30/anthropic-releases-claude-science-for-automating-research
- 補助（二次）: https://www.statnews.com/2026/06/30/anthropic-release-claude-science-ceo-dario-amodei/
- 補助（二次）: https://techcrunch.com/2026/06/30/anthropics-claude-science-bets-on-workflow-not-a-new-model-to-win-over-scientists/

## コンプラ自己チェック（compliance.md 準拠）
- [x] **数字の独立レビュー（別subagent・一次/複数二次ソース突合）実施 → 総合判定VERIFIED、修正該当なし**
  - 発表日(6/30・鮮度3日以内)／名称・URL／「新モデルではない、Opus 4.8含む既存Claude使用」／「60以上のDB統合(UniProt/Ensembl/PDB)」／ベータ提供対象(Pro/Max/Team/Enterprise)／支援プログラム数字(最大50件・$30,000・締切7/15・採択通知7/31・実施期間9/1-12/1) → いずれもVERIFIED
- [x] 出典あり／誇張・ステマなし（「地味だけど」と抑制的な表現、性能の誇張なし）／事実と解釈を分離（【概要】【支援プログラム】＝事実、【ポイント】＝解釈）／噂不使用
- [x] 個別株の投資勧誘・売買推奨に該当する記述なし（Anthropicは非上場。IPO文脈の言及はしていない）
- [x] AI生成はプロフィール担保／プレーンテキスト・絵文字なし・見出しは【】・番号ラベルなし
- [x] `posted.md`・既存 `01_review_queue` と照合し重複なし（既出は Claude Sonnet 5 のみ）

## 未確認点 / レビュー観点
- Claude Scienceはベータ時点でmacOS/Linux(またはSSH/HPC経由)のみ対応という制約情報あり。本文には未記載（誤りではないが厳密運用なら【概要】に追記可）。
- Modal社が一部プロジェクトに別途最大$2,000の計算クレジットを追加提供、との情報あり（本文は未記載・任意追記事項、事実として確認済み）。
- 支援プログラムの数字は全て公式の開示値（実測ではない）。
- 画像添付：未（公式ブログのartifact例スクショを付けるかは要検討）。
