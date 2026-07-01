# 出典一覧・変遷・未確認フラグ

英語公式ソース優先（English sources only）。

## 出典テーブル

| ID | タイトル | URL |
| --- | --- | --- |
| S1 | Effective context engineering for AI agents (2025-09-29) | https://www.anthropic.com/engineering/effective-context-engineering-for-ai-agents |
| S2 | Building effective agents (2024-12-19) | https://www.anthropic.com/engineering/building-effective-agents |
| S3 | Best practices for Claude Code | https://code.claude.com/docs/en/best-practices |
| S5 | Effective harnesses for long-running agents (2025-11-26) | https://www.anthropic.com/engineering/effective-harnesses-for-long-running-agents |
| S6 | Building agents with the Claude Agent SDK (2025-09-29) | https://claude.com/blog/building-agents-with-the-claude-agent-sdk |
| S7 | How Claude Code works | https://code.claude.com/docs/en/how-claude-code-works |
| S8 | Agent SDK overview | https://code.claude.com/docs/en/agent-sdk/overview |
| S9 | Managing context on the Claude Developer Platform | https://claude.com/blog/context-management |
| S10 | Writing tools for agents (2025-09-11) | https://www.anthropic.com/engineering/writing-tools-for-agents |
| S11 | Configure permissions | https://code.claude.com/docs/en/permissions |

参照リファレンス（fetch 済み or URL 参照）: code.claude.com/docs/en/ の `commands` `cli-reference` `sub-agents` `hooks` `mcp` `skills` `memory` `permission-modes` `headless`。

## 時系列の変遷（practices の進化）

- **2024-12 S2**: 語彙確立（workflows vs agents / augmented LLM / 5パターン / **ACI**）。自律性に慎重。
- **2025-09-11 S10**: tool ergonomics を具体化（25k token 上限・namespacing・consolidation・high-signal 返却・自己改善）。ツール=「決定的/非決定的の contract」。ACI の語より "ergonomic" を前面に。
- **2025-09-29 S1/S6**: 「prompt → **context** engineering」再定義。loop を `gather→act→verify→repeat` に定式化。attention budget / context rot / compaction / just-in-time / structured note-taking / sub-agent 分離が出そろう。
- **2025-11-26 S5**: long-horizon 多窓・自律実行へ拡張。progress ファイル + git log recovery を導入。「compaction だけでは不足」。
- **現行 docs（code.claude.com）**: best practices が移設・大幅拡張（`/goal` 検証条件・Stop hook・checkpoint・agent teams・worktree・auto mode classifier）。permission は「allow/deny + `--dangerously-skip-permissions`」から **6段パイプライン + `dontAsk`/`auto`/sandbox/enterprise managed** に成長。

## 未確認・要注意フラグ（誠実性のため）

- **ACI の出典**: 依頼では tools 記事に帰属していたが、実際は **S2（2024-12）**が初出。S10 は同概念を "contract" 等の別表現で述べる。
- **`--dangerously-skip-permissions` / "yolo mode"**: 現行 fetch した公式ページで literal string を再確認できず。現行 docs は **`bypassPermissions` mode** + 新しい **`auto` mode** で表現。「yolo mode」は legacy/非公式語彙扱い。
- **S9 のベンチ数値（+39% / +29% / −84%）**: Anthropic 自社の単一ソース eval。
- **S5 の "context anxiety" / "compaction isn't sufficient"**: 一部は検索要約由来で、fetch 本文の verbatim 再確認は未完。方向性（新モデルで manual scaffolding の必要が減る）は各ソースと整合。
- **モデル名（Opus 4.8 / Sonnet 5 / Fable）**: docs 本文の記述であり、可用性の独立検証はしていない。
