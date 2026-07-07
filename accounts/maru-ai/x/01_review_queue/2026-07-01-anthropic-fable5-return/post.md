# 下書き: Anthropic「Fable 5」輸出規制解除・世界再開 — 承認待ち

- **アカウント/媒体**: maru-ai / x
- **ネタ**: 米商務省の輸出規制で停止していたAnthropicの最上位モデル「Fable 5」が2026-07-01に世界向けで再開
- **カテゴリ**: 規制/政策 ＋ プロダクト（モデル再デプロイ）
- **発表日**: 2026-06-30（輸出規制解除の通知）／2026-07-01（世界向け再開・本日） → 鮮度: 3日ルール内（当日）
- **重複チェック**: `posted.md`・`01_review_queue`・`02_approved` を確認、既出ネタなし（直近投稿はClaude Sonnet 5でネタが異なる）
- **担当**: discover→gather→draftは本セッションで実施、数字は別subagentで独立レビュー実施

## 下書き本文（プレーンテキスト・maru-ai voice準拠・スレッド想定）

【速報】Anthropicの最上位AI「Fable 5」が世界で再解禁(7/1)。
米政府の輸出規制で止まってから19日ぶりの復活だね。

【経緯】
・6/9 Fable 5とMythos 5を公開(自社史上最強クラス)
・6/12 米商務省が安全保障上の懸念を理由に輸出規制を発動、両モデルを停止
 (ジェイルブレイクで安全性への懸念が浮上。深刻度についてAnthropicは異議あり)
・6/26 Mythos 5が一部米国組織向けに先行復旧
・6/30 商務長官が輸出規制解除を通知

【利用条件】
・7/1、Fable 5がClaude Platform/Claude.ai/Claude Code/Claude Cowork上で全世界向けに再開
・Pro/Max/Team・一部Enterpriseは7/7まで週間利用枠の最大50%までFable 5込み、以降は使用量クレジット制(標準Enterpriseは初日からクレジット制)
・API直接利用は入力$10/出力$50(100万トークンあたり)

【ポイント】
政府の輸出規制で最上位AIモデルが丸ごと止まり、解除されて復活するのは異例のケース。Anthropicはこれを機にAmazon・Microsoft・Googleなどとジェイルブレイクの深刻度を測る業界共通の枠組みも提案してるね。

ソース(一次)
https://www.anthropic.com/news/redeploying-fable-5
https://www.anthropic.com/news/fable-mythos-access

## 使った一次ソース
- Anthropic公式（再開の発表）: https://www.anthropic.com/news/redeploying-fable-5
- Anthropic公式（輸出規制発動時の声明）: https://www.anthropic.com/news/fable-mythos-access
- Anthropic公式（Fable 5/Mythos 5公開時の発表）: https://www.anthropic.com/news/claude-fable-5-mythos-5
- Anthropic公式X（輸出規制発動の告知）: https://x.com/AnthropicAI/status/2065597531644743999

## 補助・クロスチェック用の信頼メディア（二次）
- CNBC（6/30・輸出規制解除）: https://www.cnbc.com/2026/06/30/anthropic-says-trump-admin-has-lifted-export-controls-on-claude-fable-5-and-mythos-5.html
- Forbes（6/12停止の経緯）: https://www.forbes.com/sites/anishasircar/2026/06/16/anthropic-disabled-fable-5-and-mythos-5-after-a-us-export-control-order-heres-what-happened/
- TechCrunch（6/26 Mythos 5先行復旧・約100組織）: https://techcrunch.com/2026/06/26/trump-admin-releases-anthropic-mythos-to-be-used-by-more-than-100-us-companies-agencies/
- NBC News（6/26先行復旧の詳細）: https://www.nbcnews.com/tech/tech-news/us-government-gives-anthropic-green-light-limited-re-release-mythos-5-rcna352018
- The Register / SecurityWeek（ジェイルブレイクの深刻度についてAnthropicが異議を唱えている点）: https://www.theregister.com/security/2026/06/15/feds-freaked-over-fable-5-after-simple-fix-this-code-prompt-not-jailbreak-says-researcher/ , https://www.securityweek.com/anthropic-disputes-fable-5-ai-jailbreak/
- 価格（API直接利用・入力$10/出力$50）のクロスチェック: https://www.finout.io/blog/claude-fable-5-mythos-5-pricing-benchmarks

## 数字の独立レビュー（別subagent・一次+複数二次ソース突合）
本文で使う10項目の事実・数字を個別に検証（担当subagentは本文作成者と別）。結果:
1. 6/9 Fable 5/Mythos 5公開・自社史上最強クラス → **VERIFIED**
2. 6/12 米商務省の輸出規制発動・両モデル停止 → **VERIFIED**
3. 停止の引き金となったジェイルブレイク報告の内容・深刻度 → **PARTIALLY VERIFIED**（Amazon研究者による報告が輸出規制の引き金と報じられている一方、より広く報道された別ハッカー「Pliny the Liberator」の主張もあり、Anthropicは深刻性に異議を唱えている。The Registerは「単純なfix-this-codeプロンプトに過ぎない」との専門家指摘も報道）→ **本文では「脆弱性特定→エクスプロイトコード生成」と断定する記述を避け、「ジェイルブレイクで安全性への懸念が浮上。深刻度についてAnthropicは異議あり」に修正して反映**
4. 6/26 Mythos 5が一部米国組織向けに先行復旧 → **VERIFIED**（約100組織、TechCrunch/NBC/Axios一致）
5. 6/30 商務長官が輸出規制解除を通知 → **VERIFIED**（CNBC/The Hill/NBC一致）
6. 7/1 Fable 5が全世界向けに再開・19日ぶり → **VERIFIED**（6/12→7/1で19日間、複数ソース一致）
7. Pro/Max/Team・一部Enterpriseは7/7まで週間利用枠の最大50%までFable 5込み → **VERIFIED**
8. 標準Enterpriseは初日から使用量クレジット制 → **VERIFIED**
9. API直接利用 入力$10/出力$50（100万トークンあたり） → **VERIFIED**
10. Amazon・Microsoft・Google等とジェイルブレイクの深刻度を測る業界共通の評価フレームワークを提案 → **VERIFIED**（ただし詳細な評価基準の一次ソースは未特定のため、本文では概要のみに留めた）

## コンプラ自己チェック（compliance.md準拠）
- [x] 出典あり（一次: Anthropic公式ブログ2本+公式X、補助で信頼メディア複数）
- [x] 噂・未確認情報を断定しない（項目3のジェイルブレイクの深刻度は「Anthropicは異議あり」と明記し、事実として断定していない）
- [x] 誇張・ステマなし（「異例のケース」は事実からの中立的な解釈として明示、性能等の誇張表現なし）
- [x] 事実（経緯・利用条件）と解釈（【ポイント】）を区別
- [x] 個別株の投資勧誘・売買推奨に該当する記述なし
- [x] AI生成である旨はプロフィール（bio）で担保
- [x] プレーンテキスト・絵文字なし・見出しは【】・番号ラベルなし

## 未確認点・レビュー観点
- ジェイルブレイクの技術的詳細（誰が最初に報告したか、深刻度）は報道間で幅があるため、本文では意図的に高レベル・中立的な記述に留めている。厳密運用ならAnthropicの正式な事後報告書があれば再確認を推奨。
- 業界共通のジェイルブレイク評価フレームワークの具体的な評価基準（4基準等）は一次ソースを直接確認できていないため、本文には数値・基準の詳細は入れていない。
- 本セッションではWebFetchツールがネットワーク環境の制約で全URLに対し403エラーとなり直接取得不可だったため、Anthropic公式ページの内容はWebSearchツールが返す抜粋・複数メディアの一致をもって代替確認した。可能であれば人間レビュー時に公式ページを直接開いて最終確認を推奨。
- 画像添付: 未（Anthropic公式ブログの図があれば添付を検討）。
