# 下書き: Anthropic、Claude Fable 5 を再展開／Mythos 5 も一部復旧

- account: maru-ai (まるくん@AI速報)
- media: x
- state: 01_review_queue（人間承認待ち・未投稿）
- ネタ分類: 規制/政策 + プロダクト
- 発表日: 2026-06-30（輸出規制解除）／2026-07-01（Fable 5 再展開）※実行日 2026-07-02 から1〜2日以内、鮮度ルール(3日以内)を満たす
- 既出チェック: `state/posted.md`（Claude Sonnet 5のみ・別ネタ）、`01_review_queue/` 他ディレクトリなし → 重複なし

## 本文案（単発ツイート、空行区切りでスレッド化可）

```
【速報】
AnthropicがClaude Fable 5を7/1に再展開したよ

米政府の輸出規制が6/30に解除、Mythos 5も一部米組織向けに復旧開始だね

【要点】
・Fable 5: 7/1(水)からClaude Platform/Claude.ai/Claude Code/Claude Coworkでグローバルに再展開
・Pro/Max/Team/一部Enterpriseは7/7まで週間利用上限の50%まで利用可、以降は使用量クレジット制に切替
・AWS/Google Cloud/Microsoft Foundryでのアクセスも順次再開予定
・Mythos 5: 6/26の米政府承認を受け一部の米国組織向けに復旧(Glasswingプログラム)、対象拡大は調整中

【ポイント】
両モデルは6/12に米輸出規制でアクセス停止されてた。安全面の分類器強化とセットでの再開で、規制→解除まで3週間弱のスピード対応だね

ソース: https://www.anthropic.com/news/redeploying-fable-5
```

## 一次ソース

- Anthropic公式（本命）: https://www.anthropic.com/news/redeploying-fable-5
  - 直接WebFetchは403（Bot対策と思われる）。作業者・検証者ともにブロックされたが、検索エンジン索引経由で本文相当の記述を複数箇所で確認、かつ独立した複数の二次ソースが同一の数字・固有名詞（50%上限、7/7、Glasswing等）で一致 → 信頼度高いと判断。
- Anthropic公式（関連）: https://www.anthropic.com/news/fable-mythos-access
- 補強（二次・複数一致）: CNBC (2026-06-30), MarkTechPost (2026-07-01), 9to5mac (2026-07-01), TweakTown, SearchEngineJournal, Forbes, Constellation Research

## チェック結果（数字の独立レビュー・別subagent実施）

作業者（本draft作成者）とは別のsubagentが、本文の主張・数字を一次/二次ソースで個別に突合。結果：

1. Fable 5 が 2026-07-01 に再展開 → **CONFIRMED**
2. 輸出規制が 2026-06-30 に解除（トランプ政権/商務省） → **CONFIRMED**
3. 7/1からClaude Platform/Claude.ai/Claude Code/Claude Coworkでグローバル提供 → **CONFIRMED**
4. Pro/Max/Team/一部Enterpriseは7/7まで週間利用上限の50%まで利用可、以降は使用量クレジット制 → **CONFIRMED**
5. AWS/Google Cloud/Microsoft Foundryは「できるだけ早く」再開＝7/1時点で即時ではない → **CONFIRMED**
6. Mythos 5は6/26の米政府承認を受け一部の米国組織向けに復旧（Glasswingプログラム）、対象拡大は調整中 → **CONFIRMED**
7. 両モデルとも6/12の米輸出規制で停止 → **CONFIRMED**
8. 新しいサイバーセキュリティ分類器がセットで導入 → **CONFIRMED**（本文には分類器の詳細数値は書いていないため、その粒度で問題なし）
9. 「6/12→7/1で3週間弱」という表現（試算・解釈） → **CONFIRMED**（実際19日、複数メディアも同様に「3週間弱」と表現。誤解を招く表現ではない）

verifierコメント: トーンは中立・事実ベースで誇張・ステマなし。「予定」「調整中」など未確定要素は断定していない。

## 未確認点・本文から意図的に落とした情報

- 6/12の規制発動理由（Amazon研究者によるFable 5のセーフガード回避手法の発見）は、複数の二次ソースで報じられているが一次ソースを直接確認できていないため、本文の主張には含めていない（要点・ポイントとも事実確定分のみ記載）。
- 使用量クレジットの具体的な単価（$10/$50 per Mtokという情報が一部ソースにあり）は出典間で表現に揺れがあり未確定のため本文に含めていない。
- 「当初案より無料期間が短縮された」というユーザーの反応（PCWorld等が報道）は本ニュースの主題ではないため本文では触れていない。事実誤認ではないが、必要なら別ネタとして扱う。
- Mythos 5の海外Glasswingメンバーへのアクセス再開有無は情報が曖昧（Bloombergが言及）なため、本文では「対象拡大は調整中」とぼかす表現にとどめた。

## コンプラ自己チェック（compliance.md準拠）

- 出典あり: 一次ソースURLを本文末尾に明記 ✔
- 噂・未確認の明示: 規制理由等の未確認情報は本文に含めず除外 ✔
- 誇張・ステマなし: 「〜だね」等ポップな語尾のみ、性能誇張や特定企業の持ち上げ表現なし ✔
- 事実と解釈の区別:【要点】=事実（出典ベース数字）、【ポイント】=解釈（スピード感の評価）を分離 ✔
- 個別株の投資勧誘・売買推奨: なし ✔
- AI生成である旨: プロフィールで担保（本文への免責記載は不要、既定通り） ✔
- 体裁: プレーンテキスト、絵文字なし、見出しは【】、箇条書きは「・」✔
