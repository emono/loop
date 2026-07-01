---
name: llm
description: >
  LLM / エージェント開発（特に Claude Code・Claude Agent SDK）の設計知識を提供する。
  loop engineering・harness engineering・context engineering・agent loop・
  workflows vs agents・tool 設計・permission・verification など、
  「エージェントをどう設計・反復させるか」を扱うとき、または Claude Code の
  コマンド/機能/思想を確認したいときに参照する。英語公式ドキュメント準拠。
when_to_use: >
  エージェント/ループ/ハーネス/context 管理の設計を考えるとき、Claude Code の
  コマンド・思想・ベストプラクティスを確認するとき、LLM アプリを設計するとき。
---

# LLM / Agent エンジニアリング知識スキル

Claude Code / Claude Agents の設計知識を、英語公式ドキュメント（English sources only）に基づいてまとめた知識ハブ。
詳細は **参照リファレンス `references/`**（`${CLAUDE_SKILL_DIR}/references/`）に progressive disclosure で分割してある。必要な柱だけ読み込むこと。

## 参照リファレンス（references/）

| ファイル | 読むべき場面 |
| --- | --- |
| `references/README.md` | 全体像・TL;DR・索引 |
| `references/01-philosophy.md` | 設計判断の拠り所（simple first / workflows vs agents / ACI / delegate） |
| `references/02-harness-engineering.md` | harness を作る・context engineering・tool 設計・permission・verification |
| `references/03-loop-engineering.md` | 反復ループ設計・compaction・long-horizon・interval 実行・停止条件 |
| `references/04-command-reference.md` | Claude Code の現行コマンド・CLI flag・subagents・hooks・MCP・skills |
| `references/sources.md` | 出典（S#）・変遷・未確認フラグ |

**使い方**: まず下の要点で当たりをつけ、深掘りが要る柱だけ `${CLAUDE_SKILL_DIR}/references/<file>` を Read する。出典は各所の `[S#]` → `references/sources.md`。

## 要点（当たり付け用サマリ）

### 思想
- **一番シンプルな解から始め、効果が実証されたときだけ複雑さを足す**。エージェントは latency/cost を task performance と引き換える選択。[S2]
- **Workflow**（predefined code paths）と **Agent**（LLM が自らのプロセスを動的に指揮）を区別。Agent の代償は cost と **compounding errors**。[S2]
- **Delegate, don't dictate** / **give your agents a computer**（人間エンジニアと同じ affordance を与える）。[S6][S7]

### Harness
- Claude Code は Claude を包む **agentic harness**。中核ループ **`gather context → take action → verify work → repeat`**。[S6][S7]
- **Context engineering** = high-signal token の**最小集合**を維持する規律。context は有限資源で埋まるほど劣化（**context rot**）。system prompt は **right altitude**。[S1]
- **Tool 設計**: more tools ≠ better。consolidation / namespacing / high-signal 返却 / 25k token 上限 / error は feedback。[S10]
- **Permission** は「モデルでなく harness が強制」する境界。評価順 deny → ask → allow。[S11]

### Loop
- ループを閉じるのは **verification**。pass/fail を返す仕組み（test/lint/screenshot/judge）を与えると自律的に閉じる。優先度 rules-based > visual > LLM-as-judge。[S3][S6]
- **Context 管理**: compaction / `/clear` 衛生 / context editing / memory tool。長時間タスクは **compaction だけでは不足** → progress ファイル + git log の外部メモリ + 二段 harness。[S1][S5][S9]
- **停止・drift 回避**: Explore→Plan→Implement→Commit、tight feedback loop、stopping condition、失敗パターン（kitchen sink / infinite exploration / trust-then-verify gap）。[S2][S3]
- **interval / headless**: `claude -p` で fan-out・CI・イベント駆動、`/loop`・`/schedule`。[S3][S8]

## 運用ルール

- 回答は **英語公式ソース準拠**。references の `[S#]` を根拠として引用する。
- 断定できない点は `references/sources.md` の**未確認フラグ**を確認し、そのまま誠実に伝える（例: `--dangerously-skip-permissions` の現行表記、自社ベンチ数値）。
- references は生きたリファレンス。内容が古くなったら該当ファイルと `sources.md` を更新する。
