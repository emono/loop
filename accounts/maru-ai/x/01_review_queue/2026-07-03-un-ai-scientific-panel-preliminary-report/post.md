# 下書き: 国連「独立国際AI科学パネル」予備報告書 発表 — 承認待ち

- **アカウント/媒体**: maru-ai / x
- **ネタ**: 国連総会設置の「独立国際AI科学パネル(Independent International Scientific Panel on AI)」が
  初の予備報告書(Preliminary Report)を発表。7/6-7ジュネーブ「Global Dialogue on AI Governance」に提出予定。
- **発表日**: 2026-07-01（鮮度: today(2026-07-03)−2日 → 3日ルール内）
- **state**: 01_review_queue（下書き・未承認）
- **担当**: 本エージェントが discover→gather→draft、`fact-checker` agent が数字・引用の独立レビュー

## 既出チェック（重複回避）

- `accounts/maru-ai/x/state/posted.md`: Claude Sonnet 5（6/30発表）のみ記録。本ネタと重複なし。
- `accounts/maru-ai/x/01_review_queue/`（master反映済み分）: 空。重複なし。
- **GitHub上のオープンPR 23件を `mcp__github__list_pull_requests` / `search_pull_requests` で確認**（下記「発見した問題」参照）。
  国連/規制ネタのPRは無し。当初候補にしていた「Google Nano Banana 2 Lite / Gemini Omni Flash」は
  既に PR #10, #38, #46 で3重に下書き済みだったため**このネタは破棄し、本ネタに差し替えた**。

## 下書き案（プレーンテキスト・maru-ai voice 準拠）

【速報】国連の「独立国際AI科学パネル」が初の予備報告書を発表(7/1)

140カ国・2600人超の候補から選ばれた40人の科学者による、国連初のAI公式科学評価。来週7/6-7のジュネーブ「AIガバナンス国際対話」に提出される。

【要点】
・パネルは国連総会設置。140カ国・2600人超の候補から選抜された40人の専門家(共同議長はTuring賞受賞のYoshua Bengio氏とノーベル平和賞のMaria Ressa氏)が執筆
・AIの便益(生産性向上等)とリスク(欺瞞的行動の証拠増加、サイバー犯罪/詐欺・偽情報への悪用、コンテンツの真贋判定の困難化など)を両論
・「政策に使える科学的証拠が揃う頃には手遅れになりかねない」という規制上のジレンマを指摘

【ポイント】
Bengio共同議長は「AIの欺瞞的行動の証拠が増えており、能力向上に伴い単独でも悪意ある利用でも壊滅的な害を及ぼさないと科学的に保証することは現時点でできない」と発言。7/6-7のジュネーブ会議で各国政府に提示され、AI規制の国際的な土台になりそうだね。

ソース(一次)
https://www.un.org/independent-international-scientific-panel-ai/en/preliminary-report

## 使った一次ソース
- 公式（一次）: https://www.un.org/independent-international-scientific-panel-ai/en/preliminary-report （WebFetchは403のため直接本文取得は不可。複数独立報道で内容突合）
- 公式（一次・会議情報）: https://www.un.org/global-dialogue-ai-governance/en
- 参考（二次・相互検証、いずれも独立): UN News (news.un.org/en/story/2026/07/1167853)、technology.org、Business Standard、Decrypt、Times of Israel、IPS、UNESCO、ITU 等

## 数字の独立レビュー（fact-checker agent・作業者≠採点者）
実施日: 2026-07-03。判定は以下の通り（全てVERIFIED、修正なしで可）。

| 項目 | 判定 |
|---|---|
| 発表日 2026-07-01 | VERIFIED |
| パネル構成「140カ国・2600人超の候補から40人選抜」 | VERIFIED |
| Bengio氏＝共同議長・Turing賞受賞者（共同議長はもう1名 Maria Ressa氏＝ノーベル平和賞） | VERIFIED |
| Bengio氏引用の訳文（原文と意味・ニュアンス一致、誇張なし） | VERIFIED |
| 7/6-7ジュネーブ Global Dialogue on AI Governance への報告書提出 | VERIFIED |
| リスク/便益/「証拠が揃う頃には手遅れ」の要約 | VERIFIED（要旨として妥当） |
| 末尾の解釈（「国際的な土台になりそうだね」）とパネル発言の分離 | 問題なし（書き手の解釈として適切にトーンダウン、パネル発言と混同なし） |

## コンプラ自己チェック（compliance.md 準拠）
- [x] 出典あり（un.org 一次・複数独立報道でクロスチェック）
- [x] 噂・リーク不使用（正式発表のみ）
- [x] 誇張・ステマなし。Bengio氏の発言は引用として明示し、断定的な将来予測は書き手側からしていない
- [x] 事実（パネル構成・発表内容・引用）と解釈（【ポイント】の重要性評価）を分離
- [x] AI生成である旨はプロフィール（bio）で担保
- [x] プレーンテキスト・絵文字なし・見出しは【】・番号ラベルなし
- [x] 個別株の投資勧誘・売買推奨に該当する記述なし

## 未確認点 / レビュー観点
- `un.org` 本体ページは WebFetch が403で直接本文取得できず、複数の独立報道（UN News・technology.org・Business Standard・Decrypt・Times of Israel等）の一致で代替裏取りした。人間レビュー時に可能であれば un.org 一次ページを目視確認推奨。
- 報告書本文（PDF）そのものは未読了。本下書きは報道各社が引用した範囲の要約にとどまる。
- 画像添付は未実施。

## 発見した問題（運用上の申し送り・要対応）
- GitHub上に **maru-ai向けの「[maru-ai draft]」PRが23件オープンのまま滞留**しており、1つもマージ/クローズされていない。
- 同一ネタの重複ドラフトが多数発生している（例: 「Claude Fable 5 輸出規制解除」系だけでPR #4,#5,#14,#20,#24,#26,#37,#40,#42,#45 の**10件**、「Google Nano Banana 2 Lite / Gemini Omni Flash」系もPR #10,#38,#46 の**3件**）。
- 原因: 本スキルの重複チェックは `posted.md` と（master反映済みの）`01_review_queue/` のみを見ており、**他ブランチの未マージPRを見ていない**ため、実行のたびに同じネタを再ドラフトしてしまっている。
- 本ラン(2026-07-03)では GitHub の全オープンPRを事前に確認し、Nano Banana 案は重複と判明したため破棄、本ネタ（国連AI報告書）に差し替えて重複を回避した。
- **要人間対応**: (1) 上記23件のPRをレビュー・要否判断（不要なものはクローズ、採用するものは1件残してマージ）、(2) 今後は discover 時に「オープンPRの一覧」も突合するようスキル/hisho側の手順に追記することを推奨。
