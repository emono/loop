# Loop エンジニアリング docs

Claude Code / Claude Agents の **loop engineering** を、英語公式ドキュメント（English sources only）ベースでまとめたリファレンス。
用語は英語併記、出典は各ページ末尾および [sources.md](./sources.md) の `[S#]` で参照する。

## 構成

| ファイル | 内容 |
| --- | --- |
| [01-philosophy.md](./01-philosophy.md) | 思想・設計原則 — simple first / workflows vs agents / ACI / delegate, don't dictate |
| [02-harness-engineering.md](./02-harness-engineering.md) | agentic harness — agent loop / context engineering / tool 設計 / permission model / verification |
| [03-loop-engineering.md](./03-loop-engineering.md) | 反復ループの設計 — context 管理・compaction / self-correction / long-horizon / interval 実行 / 停止条件 |
| [04-command-reference.md](./04-command-reference.md) | 現行コマンド・機能 — slash commands / CLI flags / subagents / hooks / MCP / skills / permission modes |
| [sources.md](./sources.md) | 出典一覧・変遷・未確認フラグ |

## TL;DR

- Anthropic の一貫した思想は **「一番シンプルな解から始め、効果が実証されたときだけ複雑さを足す」**（*Building effective agents*）。エージェントは latency と cost を task performance と引き換えにする選択。
- Claude Code は Claude を包む **agentic harness**。中核は反復ループ **`gather context → take action → verify work → repeat`**。
- **loop engineering の主戦場は context**。context は「収穫逓減する有限資源」で、埋まるほど性能が落ちる（**context rot**）。compaction・sub-agent 分離・just-in-time 取得・structured note-taking で「high-signal token を最小集合に」保つのが核心。
- ループを閉じるのは **verification**。pass/fail を返す仕組み（test・lint・screenshot・judge）を与えると **ループは自律的に閉じる**。
- 長時間タスク（long-horizon）では **compaction だけでは不足**。progress ファイル + git log の外部メモリ + 二段 harness で context window を跨ぐ。

> 元の統合ノート（1ファイル版）: `.hisho/notes/2026-07-01-11-00-06-loop-engineering.md`
