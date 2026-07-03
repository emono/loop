# 下書き: Tripo AI「Series A3で$150M調達」— 承認待ち

- **アカウント/媒体**: maru-ai / x
- **ネタ**: Tripo AI（3D基盤モデル・ワールドモデル開発スタートアップ）がSeries A3で$150Mを調達
- **発表日**: 2026-07-02（鮮度: today(2026-07-03)−1日 → 3日ルール内）
- **state**: 01_review_queue（未承認・人間承認ゲート待ち）
- **担当**: gather→draft は本セッション、数字は fact-checker agent で独立レビュー実施
- **重複チェック**: `posted.md`（Claude Sonnet 5のみ）と照合し重複なし。GitHub上の既存オープンPR一覧（32件、Claude Fable 5・Nano Banana 2 Lite/Gemini Omni Flash・Together AI Series C(#22)等）とも突合し、本ネタの下書きは無いことを確認。
  - 補足: 当初 Together AI の$800MシリーズC(2026-07-01発表)を候補にしていたが、同一ネタの下書きが前日付ですでにPR #22としてオープン中と判明したため、重複を避けてTripo AIに差し替えた。

## 下書き案（速報 / プレーンテキスト・maru-ai voice 準拠）

※空行区切り。文字数の都合で投稿時は単発1ツイートへの圧縮が必要な可能性あり。

【速報】3DのTripo AIがSeries A3で$150Mを調達したよ(7/2発表)

前回の約$200M調達からわずか1ヶ月でまた大型調達、出資合戦が続いてる感じだね。

【資金調達】
・調達額 $150M(Series A3)
・投資家: 自動車系のGeely Capital、ゲーム系の4399 Network・Tanwan・Giant Network、戦略投資家Fosun Capital・Orinno Capital、財務投資家CoStone Capital等。既存株主のINCE Capital・Genesis Capitalも追加出資
・資金使途: 3D基盤モデル・ワールドモデルのアルゴリズム開発、データ基盤構築、人材採用、グローバル展開の加速

【ポイント】
Tripo AIはTripo H3.1・Tripo P1.0など3D生成モデルに加え、ワールドモデル「Project Eden」も手がける会社。ゲーム・自動車など実需のある業界から幅広く出資を集めた形で、3D/ワールドモデル領域への投資熱が続いてることがうかがえるね。

ソース(一次)
https://www.globenewswire.com/news-release/2026/07/02/3321436/0/en/Tripo-AI-Raises-150-Million-in-Series-A3-Financing-Backed-by-Investors-Across-Automotive-Gaming-Internet-and-Technology-Sectors.html

## 使った一次ソース

- 公式プレスリリース（GlobeNewswire配信・一次相当）: https://www.globenewswire.com/news-release/2026/07/02/3321436/0/en/Tripo-AI-Raises-150-Million-in-Series-A3-Financing-Backed-by-Investors-Across-Automotive-Gaming-Internet-and-Technology-Sectors.html
- 補助（二次・数字クロスチェック）: SiliconANGLE (2026-07-02), Yahoo Finance転載, Unite.AI, pulse2, GamesBeat 等、複数の独立系メディア記事

**注記**: 本セッション中、WebFetchツールが一貫して403エラーで機能せず（anthropic.com・example.com等、無関係のURLでも失敗を確認）、GlobeNewswire本文へ直接アクセスできなかった。そのため一次ソースのURLは提示するが、本文の事実確認はWebSearch経由で複数の独立系メディアの記述が数字・固有名詞レベルで一致するかを突き合わせる「収斂検証」で代替した。

## コンプラ自己チェック（compliance.md 準拠）

- [x] **数字の独立レビュー（fact-checker agent・fresh context）実施 → 全7クレームVERIFIED**
  - 調達額$150M／ラウンド名Series A3／発表日7/2／投資家リスト／資金使途／直近実績(Tripo H3.1・P1.0)／前回$200M調達との関係(約1ヶ月前) — いずれも複数独立ソースで一致し、WRONGなし
- [x] 出典あり（一次プレスリリース+複数二次ソース）／誇張なし／事実(調達額・投資家・使途)と解釈(投資熱の見方)を分離／噂は不使用
- [x] 個別株の投資勧誘・売買推奨に該当する表現なし（非上場スタートアップの資金調達の事実報道のみ、compliance.md 厳守）
- [x] AI生成はプロフィール担保／プレーンテキスト・絵文字なし・見出しは【】・番号ラベルなし

## 未確認点 / レビュー観点

- **WebFetchツール障害のため一次ソース本文を直接閲覧できていない**（複数独立系メディアの収斂による代替検証。人間承認前に GlobeNewswire の一次ソース本文を直接開いて最終確認することを推奨）。
- 調達額の表記に軽微な揺れあり（pulse2の見出しのみ「over $150 million」、他ソースは「$150 million」）。実質的な相違ではないと判断し、本文では「$150M」と表記。
- 創業者は本文中でSimon Songのみ言及しているが、fact-checkerの確認によれば共同創業者Guoli Suも存在する（本文には含めていない。誤りではないが網羅的ではない）。
- 前回調達(約$200M・1ヶ月前)のバリュエーション等の詳細は今回の発表に直接含まれないため本文では言及していない。
- ベンチマーク・性能比較の主張は本ニュースに含まれないため対象外。
- 画像添付：未（公式プレスリリースの図表があれば別途検討）。
