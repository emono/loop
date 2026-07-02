# 下書き: Google「Nano Banana 2 Lite」/「Gemini Omni Flash」公開（2026-06-30）

状態: 01_review_queue（未承認・未投稿）
アカウント: まるくん@AI速報（maru-ai） / 媒体: X
鮮度: 発表 2026-06-30 → 実行日 2026-07-02（2日以内、鮮度ルールOK）

## 本文案（スレッド・プレーンテキスト・見出しは【】）

【速報】Googleが新しい画像・動画生成AI「Nano Banana 2 Lite」と「Gemini Omni Flash」を公開したよ（2026年6月30日）

Nano Banana 2 Liteは軽量・高速な画像生成モデルで一般提供(GA)開始、Gemini Omni Flashは画像/動画をまとめて動画に変換・編集できるモデルでプレビュー公開だよ

【要点】
・Nano Banana 2 Lite(Gemini 3.1 Flash-Lite Image): 1K画像1枚あたり0.034ドル、生成は最短4秒
・Gemini Omni Flash: 720p動画(音声つき)の出力が1秒あたり0.10ドル
・どちらも Google AI Studio / Gemini API / Gemini Enterprise Agent Platform から利用可能

【ポイント】
画像生成はさらに速く安くなって、動画のほうも自然言語で編集できるモデルが出てきた。生成AIの画像・動画まわりの価格競争がまた一段進んだ感じだね

【ソース】
https://cloud.google.com/blog/products/ai-machine-learning/nano-banana-2-lite-and-gemini-omni-flash-available/
https://blog.google/innovation-and-ai/models-and-research/gemini-models/gemini-omni-flash-nano-banana-2-lite/

## 一次ソース・裏取りメモ

- Google Cloud Blog（2026-06-30公開）: "Nano Banana 2 Lite and Gemini Omni Flash available"
  https://cloud.google.com/blog/products/ai-machine-learning/nano-banana-2-lite-and-gemini-omni-flash-available/
  - Nano Banana 2 Lite = Gemini 3.1 Flash-Lite Image、一般提供(GA)。"generate an image in as little as four seconds"
  - Gemini Omni Flash = 画像/動画入力から動画生成・編集。パブリックプレビュー。価格 $0.10/秒(動画出力)
  - 提供先: Gemini Enterprise Agent Platform, Agent Studio、パートナー(Adobe Firefly, Invideo, WPP Open, Figma, Artlist, Manus AI)
- Google公式ブログ（blog.google, 2026-06-30公開）: "Start building with Nano Banana 2 Lite and Gemini Omni Flash"
  https://blog.google/innovation-and-ai/models-and-research/gemini-models/gemini-omni-flash-nano-banana-2-lite/
  （直接WebFetch は403のためGoogle Cloud Blog記事・検索結果スニペットで内容を裏取り）
- Google Cloud 料金ページ（一次・価格表）
  https://cloud.google.com/gemini-enterprise-agent-platform/generative-ai/pricing
  - Gemini 3.1 Flash-Lite Image (Nano Banana 2 Lite): 1K出力画像1枚 = $0.034（入力画像1枚=1120トークン換算）
  - Gemini Omni Flash: 動画出力 $0.10/秒 = $17.50/100万動画出力トークン（720p+音声、5792トークン/秒換算）

## コンプラ自己チェック（compliance.md / voice-base.md）
- [x] 一次ソースあり（Google Cloud Blog + 公式料金ページ、発表からの2日以内）
- [x] 噂・リークではない（GA/プレビューとも公式発表）
- [x] 誇張・ステマなし（「価格競争が進んだ」は中立的な解釈のみ、断定的な将来予測なし）
- [x] 事実（価格・秒数・提供先）と解釈（【ポイント】）を区別
- [x] 個別株の投資勧誘・売買推奨なし
- [x] プレーンテキスト・絵文字なし・見出しは【】・番号ラベルなし
- [x] posted.md（Claude Sonnet 5のみ）・既存 01_review_queue（README.mdのみ）と重複なし

## 数字の独立レビュー（fact-checker subagent・別context・実施済み）

判定一覧:
1. Nano Banana 2 Lite = Gemini 3.1 Flash-Lite Image（同一モデルの言い換え）: CONFIRMED
2. NB2L = GA、Gemini Omni Flash = パブリックプレビュー: CONFIRMED
3. NB2L: 1K画像1枚あたり$0.034: CONFIRMED（cloud.google.com料金ページ）
4. NB2L: 生成が「約4秒」: CONFIRMED（ニュアンス注意）— 原文は"as little as four seconds"＝**最短**4秒（下限値）。本文を「約4秒」→「最短4秒」に修正済み。
5. Omni Flash: 720p動画(音声付き)$0.10/秒: CONFIRMED（料金ページに720p+音声・5,792トークン/秒の換算まで明記）
6. 提供先の切り分け（「Omni FlashだけGemini app/Google Flowでも使える」という対比表現）: UNVERIFIABLE/要修正 — 一次ソース(blog.google)本体がWebFetch403で直接確認できず、二次情報間で「NB2Lも消費者向けサーフェス(Gemini app/Google Flow等)に展開中」という記述と矛盾する可能性があった。**指摘を受け、対比表現を削除し「どちらもGoogle AI Studio/Gemini API/Gemini Enterprise Agent Platformから利用可能」の一文のみに修正済み。**
7. 発表日2026年6月30日: CONFIRMED（cloud.google.comブログ本文 + 複数独立二次報道と一致）

修正対応: 上記6により本文の【要点】3行目からOmni Flash限定の配布先対比表現を削除。4により「約4秒」を「最短4秒」に修正。他項目は修正不要。

## 未確認点
- blog.google のオリジナル記事本文はWebFetchが403でブロックされたため、Google Cloud Blog（同日公開・同内容を引用）と検索エンジンのスニペットで裏取り。一次ソースそのもの（blog.google記事）は文中リンクとして提示するが、本文の数字はGoogle Cloud Blog + 公式料金ページ（cloud.google.com）を主たる裏取り元とした。
- 両モデルの消費者向けサーフェス（Gemini app / Google Flow / NotebookLM等）への展開状況は二次情報間で細部が一致しないため、本文では言及せず「Google AI Studio / Gemini API / Gemini Enterprise Agent Platform」の開発者向け提供のみに限定して記載。
- ベンチマーク数値（動画編集/Image-to-Videoの性能比較）は公式発表内で「詳細はGemini Omniページ参照」とされているのみで、具体的なスコアは未取得のため本文には含めていない。
