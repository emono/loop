# 下書き: Together AI シリーズC(8億ドル・評価額83億ドル)

- アカウント: まるくん@AI速報 (maru-ai / X)
- ネタ日付: 2026-07-01発表（実行日2026-07-02、鮮度1日以内）
- カテゴリ: 資金調達・業界
- state: 01_review_queue（下書き・未承認）

## 本文案（スレッド・空行区切り・番号ラベルなし）

【速報】
AIインフラのTogether AIが7月1日、8億ドルのシリーズC調達を発表。評価額は83億ドルに到達したよ。

主導はAramco Ventures、NVIDIAやGeneral Catalyst、Vista Equity Partnersなど大手も参加してるよ。

【要点】
・調達額: 8億ドル(シリーズC)
・評価額: 83億ドル(ポストマネー)。前回2025年2月時点の評価額33億ドルから積み増し
・主導: Aramco Ventures／参加: NVIDIA, Vista Equity Partners, General Catalyst, Emergence Capital, March Capital, Pegatron, S Ventures(SentinelOne)など
・年間ブッキング(自社発表・年換算の予約額)は前四半期時点で11.5億ドルを突破
・顧客はCursor, Cognition, Decagonなど多数
・投資家から500メガワット超のコンピュート容量を確保、5年で計算能力を約50倍に拡大する計画

【ポイント】
Together AIはDeepSeekやKimiなど「オープンモデル」を安く速く動かす基盤を提供してる会社。OpenAIやAnthropicみたいなクローズド系一強じゃなく、オープンモデル陣営を支えるインフラにも大型マネーが集まってきてる、って見方ができるね。

ソース: https://www.together.ai/blog/announcing-our-series-c

## 一次ソース

- Together AI 公式ブログ: https://www.together.ai/blog/announcing-our-series-c
  （タイトル: "Announcing our $800M Series C to accelerate the shift to open-source AI"）
- BusinessWire 公式リリース（2026-07-01付、URLに20260701を含む）:
  https://www.businesswire.com/news/home/20260701243402/en/Together-AI-Raises-$800-Million-at-$8.3-Billion-Valuation-to-Make-Frontier-AI-Accessible-to-All
- 裏取り用の二次ソース（内容が一致することをクロスチェック): TechCrunch
  (https://techcrunch.com/2026/07/01/neocloud-together-ai-raises-800m-leaps-to-8-3b-valuation/) ほか、
  PYMNTS・citybiz・letsdatascience・TheNextWeb・KuCoin 等、独立した複数媒体で同一の数字（8億ドル・83億ドル・
  Aramco Ventures主導・7/1発表）が一致。

## チェック結果（数字の独立レビュー・別subagentで実施）

作業者とは別の subagent が WebSearch で独立に再検索し、本文中の全11項目（調達額／評価額／主導投資家／
参加投資家一覧／発表日／前回評価額の推移／年間ブッキング／顧客名／コンピュート容量確保・拡大計画／事業内容／
一次ソースURL）をすべて CONFIRMED（複数の独立した信頼メディア＋公式プレスリリース＋公式ブログで一致）と判定。
架空企業・捏造数字（SEOコンテンツファーム特有のリスク）の兆候なし。

軽微な指摘（本文に反映済み）:
- 主導投資家はより厳密には「Aramco Ventures（Prosperity7ファンド経由）」だが、"Aramco Ventures"表記自体は
  公式リリース・報道でも使われており誤りではない。本文は簡潔さ優先で"Aramco Ventures"のみ表記。
- 「年間ブッキング11.5億ドル」は監査済み売上ではなく自社発表の年換算予約額。本文で「自社発表・年換算の予約額」
  と明記し、売上と誤解されないようにした。

## 未確認点・留保事項

- WebFetch がこの実行環境で together.ai / businesswire.com を含む外部サイト全般に対して403エラーを返し、
  一次ソースページを直接fetchして原文全文を確認することはできなかった（環境側のツール不調の可能性。
  Wikipedia等の無関係サイトでも同様に403だったため、対象サイトのブロックというより本セッションのWebFetch自体の
  不調とみられる）。そのため検証は WebSearch のスニペット経由で、BusinessWire公式リリースURL・Together AI公式
  ブログURLの存在確認、および8媒体以上の独立報道間での数字の完全一致（矛盾なし）によって行った。数字そのものの
  信頼度は高いと判断したが、次回セッションで WebFetch が復旧していれば一次ソース全文の直接確認を推奨。
- 「年間ブッキング11.5億ドル」は前述の通り予約額であり確定売上ではない旨、本文中に注記済み。
- 過去の評価額推移（2024年3月: 12.5億ドル→2025年2月: 33億ドル→2026年7月: 83億ドル）は複数媒体で一致しているが、
  いずれも二次報道からの引用であり、各ラウンドの一次リリースまでは遡って確認していない。

## 重複チェック

- `accounts/maru-ai/x/state/posted.md`: 既存エントリは「Anthropic Claude Sonnet 5」のみ。Together AIの
  資金調達ネタとは無関係、重複なし。
- `accounts/maru-ai/x/01_review_queue/`: 本ディレクトリ作成前は README.md のみで既存下書きなし。重複なし。

## コンプラ自己チェック（compliance.md）

- 出典: 一次（公式ブログ・BusinessWire公式リリース）＋独立した複数の信頼メディアで裏取り済み。数字に出典あり。
- 噂・リーク: なし（正式発表済みの確定情報のみ扱う）。
- 誇張・ステマ: 「〜も本格化してきた」という解釈は【ポイント】に限定し断定を避けた。特定企業の売買推奨・投資勧誘は
  一切なし（非上場企業の資金調達の事実報道のみ）。
- 事実と解釈: 【速報】【要点】＝事実（出典付き数字）、【ポイント】＝解釈、と明確に分離。
- 全投稿AI生成の旨: プロフィール(bio)で担保（本文には既定どおり付けない）。
