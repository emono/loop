# 下書き: 米商務省がAnthropic「Fable 5」の輸出規制を解除、7/1グローバル復帰 — 承認待ち

- **アカウント/媒体**: maru-ai / x
- **ネタ**: Fable 5 / Mythos 5 の輸出管理措置(export control)解除・7/1グローバル復帰（規制/政策＋プロダクト）
- **発表日**: 2026-06-30（商務省解除・Anthropic発表）／効力発生 2026-07-01（鮮度: today−0〜1日 → 3日ルール内）
- **state**: 01_review_queue（承認待ち）
- **担当**: discover→draft は本エージェント、数字は別 subagent で独立レビュー実施（結果は下記）
- **重複チェック**: `posted.md`（Claude Sonnet 5のみ）・既存 `01_review_queue`（空）と突合し重複なし。

## 下書き案（速報 / プレーンテキスト・maru-ai voice 準拠）

※空行区切りで1ツイート。

【速報】米商務省がAnthropic「Fable 5」の輸出規制を解除、7/1からグローバル復帰

6/12発令の輸出管理措置が6/30に解除された形だね。

【経緯】
・6/12、米商務省が国家安全保障を理由にFable 5/Mythos 5への外国籍者アクセスを禁じる輸出管理措置を発令(Anthropicの外国籍社員も対象)
・AmazonのCEO Jassyが、Fable系モデルへの特定プロンプトでガードレールを回避しサイバー攻撃に使える情報を出力させられたと政府高官に直接警告したのが発端(複数メディア報道)
・Anthropicは「限定的なjailbreak発見だけで商用モデルを止めるべきとは思わない」と反論しつつも規制に従った

【復帰】
・6/30に商務省が規制解除、Anthropicが発表
・7/1からClaude Platform・Claude.ai・Claude Code・Claude Coworkで全世界に復帰
・Pro/Max/Team/一部Enterpriseでは7/7まで週次利用上限の最大50%に制限(以降は使用量クレジット制)

【ポイント】
AIモデルが国家安全保障を理由に丸ごと止められたのも、規制解除で復帰したのも今回が初めての規模感。ガードレールの脆弱性1件が世界的なアクセス制限に直結した点が、今後の規制対応の前例になりそうだね。

ソース(一次)
https://www.anthropic.com/news/redeploying-fable-5

## 使った一次ソース
- 公式（一次）: https://www.anthropic.com/news/redeploying-fable-5（Anthropic公式発表。本セッションのWebFetchツールがこの環境で全URL共通に403を返したため直接本文取得はできず、タイトル・要旨はWeb検索結果の抜粋で確認。存在・タイトルは検索結果で複数回確認済み）
- 公式（一次・背景）: https://www.anthropic.com/news/claude-fable-5-mythos-5 、輸出規制時の公式声明（検索結果で存在確認、"fable-mythos-access" 系ページ）
- 二次（クロスチェック・独立レビューsubagentが使用）: CNBC, CNN, Forbes, TechCrunch, Fortune, Tom's Hardware, Search Engine Journal, thehackernews, coindesk, cio.com 等、複数の独立報道で日付・数字が一致

## コンプラ自己チェック（compliance.md 準拠）
- [x] **数字の独立レビュー（別 subagent・一次/二次ソース突合）実施 → 修正反映済み**
  - 発令日(6/12)・解除日(6/30)・復帰日(7/1)：VERIFIED（複数独立ソース一致）
  - Fable 5/Mythos 5両方が対象、Anthropic社内の外国籍社員も対象：VERIFIED
  - Amazon研究者によるjailbreak発見・サイバー攻撃情報出力の経緯：VERIFIED（ただし当初案は簡略化しすぎ→AmazonのJassy CEOが政府高官に直接警告した経緯を補足し修正）
  - Anthropicの反論しつつ規制順守という経緯：VERIFIED（公式声明と一致）
  - 復帰後の利用制限「Pro/Max/Team/一部Enterpriseで7/7まで週次上限の最大50%」：VERIFIED
  - 「Claude Cowowork」表記：WRONG（誤字）→「Claude Cowork」に修正済み
- [x] 出典あり／誇張なし（規制解除という事実と「前例になりそう」という解釈を分離）／事実と解釈を区別／噂は使用せず全て複数ソースで裏取り済みの確定事実
- [x] AI生成はプロフィール担保／プレーンテキスト・絵文字なし・見出しは【…】・番号ラベルなし
- [x] 個別株の投資勧誘・売買推奨なし

## 未確認点 / レビュー観点
- 一次ソース（Anthropic公式ブログ本文）は本セッションのWebFetchツールが環境要因（全URL共通で403）により直接取得できなかった。存在・タイトル・要旨は検索結果（複数独立媒体の引用・要約）から確認したが、次回セッションでWebFetchが復旧していれば公式本文を直接再確認するのが望ましい。
- 「7/7以降は使用量クレジット制」の詳細（Enterprise標準枠が対象外になるか等）は媒体間で表現に微妙な差があり、本文には含めず簡潔な言及のみに留めた。
- Amazon側の技術的詳細（具体的にどのプロンプトでどこまでの情報を出力させたか）はメディアでも詳細が一致していない部分があるため、本文には含めず「サイバー攻撃に使える情報」という粒度に留めた。
- 画像添付：未（公式ブログの図があれば別途検討）。
