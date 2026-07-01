# 01. 思想・設計原則（Philosophy）

出典: [S2][S6][S7][S1][S10]（→ [sources.md](./sources.md)）

## 大原則: シンプルから始める

- 「開発者はまず LLM API を直接使うところから始めるべき。多くのパターンは数行で書ける」→ **「必要になったときだけ複雑さを増やす（increasing complexity only when needed）」**。[S2]
- 「成功は最も洗練されたシステムを作ることではない。**ニーズに対して *正しい* システムを作ること**」。[S2]
- エージェントは万能ではない:「Agentic system はしばしば latency と cost を task performance と引き換えにする。**そのトレードオフが妥当なときを見極めよ**」。[S2]

## Workflows vs Agents（用語の要）[S2]

- **Workflow** = 「LLM とツールが **predefined code paths** で orchestrate されるシステム」→ 予測可能性・一貫性。定義済みタスク向き。
- **Agent** = 「LLM が **自らのプロセスとツール使用を動的に指揮し、達成方法の制御を保持する**システム」→ 柔軟性・model-driven な判断が必要な場面向き。実体は「**environmental feedback に基づきループ内でツールを使う LLM**」。
- 土台は **augmented LLM**（retrieval・tools・memory を備えた LLM）。
- Agent の代償: **higher cost と compounding errors（誤りの累積）**。sandbox でのテストと guardrail を推奨。

## 5つの workflow パターン [S2]

- **Prompt chaining** — 逐次分解、各 LLM 呼び出しが前の出力を処理。
- **Routing** — 入力を分類し専用の後続処理へ。
- **Parallelization** — sectioning（独立サブタスク分割）と voting（同一タスク複数実行の多数決）。
- **Orchestrator-workers** — 中央 LLM が動的に分解・委譲・統合（サブタスクは事前定義でなく orchestrator が決める）。
- **Evaluator-optimizer** — 生成役と評価・feedback 役をループさせる。

## Agent-Computer Interface (ACI) [S2]

- 「human-computer interface (HCI) と同等の労力を **ACI** に注げ」。ツール定義にもプロンプト同等の作り込みを。
- 実装3原則: **(1) simplicity（設計をシンプルに）(2) transparency（計画ステップを明示）(3) ACI をドキュメント + テストで丁寧に作る**。
- **Poka-yoke** 設計:「引数を工夫して間違えにくくする」。

## モデルに人間エンジニアと同じ affordance を与える [S6][S7]

- Agent SDK の設計原理は **「give your agents a computer」** — file 書き込み・command 実行・反復を可能に。「Claude にはプログラマが毎日使うのと同じツールが要る」。
- 「**Code is precise, composable, and infinitely reusable**」→ code はエージェントの理想的な出力。
- Claude Code の delegation 哲学: **「Delegate, don't dictate」**。「有能な同僚に任せるように、文脈と方向性を与えて詳細は Claude に任せる。どのファイルを読むか等は指定しなくてよい」。

## 思想の変遷（重要な軟化）

- **2024-12（S2）**: 語彙確立。自律性にはかなり慎重（cost・compounding errors・sandbox 必須）。
- **2025（S1/S10）**: 「作るか否か」から「どう与え装備するか」へ。simplicity を **token/context の最小化** に再定義。「**より賢いモデルには、より少ない人間のキュレーションで賢く動かせる**方向へ向かう」と自律性拡大を予測。
- **2025-11（S5）**: 純粋なミニマリズムへの現実的カウンター。長時間タスクでは「素の autonomy + compaction では不足」→ **意図的な harness 構造**が必要、と成熟。
