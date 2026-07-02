# 下書き: Anthropic「Claude Fable 5」再展開 — 承認待ち

- **アカウント/媒体**: maru-ai / x
- **ネタ**: Claude Fable 5 の再展開（輸出規制解除・新セキュリティ分類器）
- **発表日**: 2026-07-01（鮮度: today−1日 → 3日ルール内）
- **state**: 01_review_queue（未承認・未投稿）
- **担当**: 本セッションで gather→draft→verify を実施。数字は `fact-checker` agent で独立レビュー済み。

## 下書き案（速報 / プレーンテキスト・maru-ai voice 準拠）

※空行区切り。ネタが濃いのでスレッド想定（【経緯】【対策】【ポイント】で分割可）。

【速報】Anthropicが「Claude Fable 5」を再開したぞ(7/1)。米国の輸出規制解除を受けての世界向け再展開。

補足: 6/12に安全保障上の輸出規制で全ユーザー向けに一時停止していたモデルが、対策つきで復帰したよ。

【経緯】
・6/9 Fable 5とMythos 5をリリース
・6/12 Amazonの調査チームが、Fable 5に脆弱性特定・攻撃コード生成をさせるジェイルブレイク手法を発見→米政府が輸出規制を発動、Anthropicは国籍確認ができず全ユーザーへの提供を一時停止
・6/30 輸出規制解除、7/1(水)にClaude Platform/Claude.ai/Claude Code/Claude Cowork で世界向け再開

【対策】
・該当の手口を99%超の確率でブロックする新セキュリティ分類器を追加
・ブロック時は拒否ではなくOpus 4.8に自動フォールバック(利用者に通知)
・Pro/Max/Team/一部Enterpriseは7/7まで週間利用枠の50%以内でFable 5を利用可、以降は利用クレジット制へ移行

【ポイント】
Anthropic自身のテストでは、同様の脆弱性特定やコード生成はOpus 4.8やGPT-5.5、Kimi K2.7など他モデルでも可能だったとのことで、能力自体がFable 5固有ではないという整理。規制対応と安全策強化を急いだ形だね。

ソース(一次)
https://www.anthropic.com/news/redeploying-fable-5

## 使った一次・参照ソース
- 公式（一次・URL引用のみ。WebFetchはツール側で403のため直接取得不可、内容は複数独立メディアの一致で裏取り）: https://www.anthropic.com/news/redeploying-fable-5
- 独立報道（相互に一致・数字の裏取りに使用）:
  - https://www.marktechpost.com/2026/07/01/anthropic-redeploys-claude-fable-5-on-july-1-after-us-export-controls-lift-adds-new-cybersecurity-classifier/
  - https://www.tomshardware.com/tech-industry/artificial-intelligence/anthropic-restores-claude-fable-5-as-us-lifts-export-controls
  - https://thehackernews.com/2026/07/anthropic-restores-claude-fable-5-after.html
  - https://9to5mac.com/2026/07/01/claude-fable-5-cleared-to-return-as-us-lifts-anthropics-export-control-restriction/
  - https://www.searchenginejournal.com/anthropics-claude-fable-5-is-back-with-new-usage-limits-and-safeguards/581231/
  - https://www.tweaktown.com/news/112412/anthropic-brings-fable-5-back-but-customers-get-fewer-free-days-than-originally-offered/index.html
  - https://www.medianama.com/2026/07/223-us-government-anthropic-claude-fable-5-export-controls-lifted/
  - https://qz.com/anthropic-claude-fable-5-mythos-5-export-controls-lifted-070126

## 数字の独立レビュー（fact-checker agent・実施済み）
- 日付(6/9 リリース／6/12 輸出規制発動／6/30 解除／7/1(水) 再開) → **VERIFIED**（複数独立ソース一致）
- 「該当手口を99%超ブロックする新分類器」 → **VERIFIED**（MarkTechPost, TechTimes等が独立に "more than 99%" と報道、原文表現とも整合）
- 「ブロック時はOpus 4.8へ自動フォールバック・利用者に通知」 → **VERIFIED**
- 「Pro/Max/Team/一部Enterprise・週間利用枠50%・7/7まで、以降は利用クレジット制」 → **VERIFIED**
- 「他モデル(Opus 4.8/GPT-5.5/Kimi K2.7)でも同様の脆弱性特定・コード生成が可能」 → **VERIFIED**（複数ソースで同旨の報道あり。単一ソース依存にはやや近いため解釈的記述に留める）
- 固有名詞(Claude Fable 5 / Mythos 5 / Claude Platform / Claude.ai / Claude Code / Claude Cowork) → **VERIFIED**
- **WRONG→修正済み**: 当初案にあった「Pro/Max/Team等は当初6/23までFable 5を無制限提供する予定だった、それより前倒しで制限」という比較記述は誤り。実際は6/9〜6/22は既存プラン枠内での提供（無制限ではない）で、6/23から従量課金(usage credits)へ移行する計画だった、かつ6/12〜6/30は輸出規制で提供自体が停止していたため単純な「前倒し」比較は文脈を欠き誤解を招く。**該当の比較記述は本文から削除**（対策欄の利用制限の事実記載のみ残した）。

## コンプラ自己チェック（compliance.md / voice-base.md 準拠）
- [x] 出典あり（一次URL明記）／噂ではなく確定した公式発表として記載
- [x] 誇張・ステマなし（ブロック率・利用制限などは数字ベースで留保表現）
- [x] 事実（経緯・対策・数字）と解釈（【ポイント】＝Fable 5固有能力ではないという整理）を分離
- [x] 個別株の投資勧誘・売買推奨に該当しない
- [x] AI生成はプロフィール担保／プレーンテキスト・絵文字なし・見出しは【…】・番号ラベルなし
- [x] posted.md（Claude Sonnet 5 のみ記録）および 01_review_queue 既存分と重複なしを確認

## 未確認点 / レビュー観点（人間承認前に確認推奨）
- Anthropic公式ブログ本文はツールのWebFetchが403で直接取得できず、内容は複数の独立メディア報道の一致によって間接的に裏取りしたもの。厳密運用なら人間がブラウザで一次ソースURLを直接確認することを推奨。
- 「他モデルでも同様の能力があった」という比較テストの詳細（テスト対象モデルの正確なバージョン一覧・実施主体）はAnthropic側の記述をメディア経由でしか確認できておらず、モデル名の網羅性は媒体により若干差異あり（Haiku 4.5等を含める報道とOpus 4.8/GPT-5.5/Kimi K2.7のみとする報道がある）。本文では確度の高い3モデルのみ記載。
- 画像添付：未（公式ブログの図表があれば別途検討）。
