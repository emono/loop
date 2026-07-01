# 04. 現行コマンド・機能リファレンス（~2026）

出典: code.claude.com/docs の commands / cli-reference / sub-agents / hooks / mcp / skills / memory / permission-modes（→ [sources.md](./sources.md)）

> docs は version 注記だらけ（`v2.1.x`）で高速進化中。公式 docs は `docs.anthropic.com` / `docs.claude.com` → **`code.claude.com/docs/en/…`** に移設済み（旧URLは301）。

## Slash commands の3分類

- **Built-in**（CLI にロジック内蔵）/ **Bundled skills**（Claude が自動起動も可: `/code-review` `/simplify` `/batch` `/debug` `/loop` `/run` `/verify` 等、`disableBundledSkills` で無効化）/ **Workflows**（`/deep-research` 等、多数 subagent に fan-out しバックグラウンド実行）。
- 主な built-in:
  - context/session: `/clear`(`/reset`,`/new`) `/compact` `/context` `/resume`(`/continue`) `/rewind`(`/checkpoint`,`/undo`) `/fork` `/branch`
  - 設定: `/config`(`key=value`可) `/init` `/memory` `/mcp` `/agents` `/hooks` `/permissions` `/model` `/effort` `/skills`
  - workflow/review: `/plan` `/diff` `/review` `/security-review` `/code-review`(`ultra`)
  - 並列/background: `/background`(`/bg`) `/tasks` `/batch` `/workflows` `/goal`
  - 他: `/btw` `/usage` `/schedule`(`/routines`) `/sandbox` `/fast`
- **custom command は skills に統合済み**。`.claude/commands/deploy.md` と `.claude/skills/deploy/SKILL.md` はどちらも `/deploy` を作る（旧 commands も動くが skills 推奨）。引数 `$ARGUMENTS` `$N` `$name`、`${CLAUDE_*}` 変数、`` !`cmd` `` で shell 出力を事前注入。

## CLI flags / modes

（`claude --help` は全 flag を列挙しない旨の注意あり）

- コア: `claude` / `claude "q"` / `claude -p`（headless）/ `-c`,`--continue` / `-r`,`--resume` / `claude update|install|mcp|agents`
- print/headless: `--output-format text|json|stream-json` `--max-turns` `--max-budget-usd` `--json-schema` `--verbose` `--bare`（自動探索スキップで高速起動）
- 権限: `--permission-mode default|acceptEdits|plan|auto|dontAsk|bypassPermissions`、`--dangerously-skip-permissions`≡bypass、`--allowedTools/--disallowedTools`
- session: `--fork-session` `--session-id` `--from-pr` `--name` `--no-session-persistence`
- agent/model: `--agent <name>`（セッション全体を subagent 化）`--agents '<json>'` `--model`(`sonnet`/`opus`/`haiku`/`fable`) `--effort low|medium|high|xhigh|max`
- system prompt: `--system-prompt(-file)`（置換）/ `--append-system-prompt(-file)`（追記）
- worktree/bg: `--worktree`(`-w`) `--tmux` `--bg` `--exec` `--ide` `--chrome` `--safe-mode`

## Subagents（Agent / Task tool）

- 「独自の context window・custom system prompt・特定 tool・独立 permission を持つ専門アシスタント」。**Task tool は v2.1.63 で `Agent` に改名**（`Task(...)` は alias）。
- built-in: **Explore**（読み取り専用・Haiku・探索）/ **Plan**（読み取り専用・plan mode 用）/ **general-purpose**（全 tool）/ 補助 `statusline-setup` `claude-code-guide`。Explore/Plan は CLAUDE.md と git status をスキップして軽量。
- 定義は `.claude/agents/*.md`（frontmatter: `name` `description` 必須、`tools` `model` `permissionMode` `skills` `isolation: worktree` 等）。優先度: managed → `--agents` → project → user → plugin。
- 起動: 自動委譲（`description` マッチ、"use proactively")/ `@agent-<name>` / `--agent`。**並列実行可**。**nested subagents は v2.1.172 で追加**（深さ上限5）。`/fork <directive>` は会話全体を継承した subagent を background 起動。resume は `SendMessage`（Explore/Plan は one-shot）。

## Hooks

3つの cadence（毎セッション / 毎ターン / 毎 tool 呼び出し）。

- session: `SessionStart`(`startup`/`resume`/`clear`/`compact`) `SessionEnd` `Setup` `InstructionsLoaded`
- turn: `UserPromptSubmit` `Stop` `StopFailure`
- tool: `PreToolUse` `PostToolUse` `PostToolUseFailure` `PermissionRequest` `PermissionDenied`
- subagent/task: `SubagentStart/Stop` `TaskCreated/Completed`。compaction: `PreCompact/PostCompact`
- 設定は settings.json の `"hooks"`（`EVENT → matcher → hooks[]`）。handler type: `command`(JSON on stdin) / `http` / `mcp_tool` / `prompt` / `agent`（検証 subagent、experimental）。**exit 0=成功、2=blocking（stderr を Claude に渡し行為をブロック）**、他=非ブロッキング。

## MCP

- transport: HTTP（推奨、`streamable-http`）/ SSE（deprecated）/ stdio / WebSocket。`claude mcp add --transport ... <name> ...` 等。
- scope: `local`（既定）/ `project`（`.mcp.json` 版管理・要承認）/ `user`。enterprise は managed MCP。
- naming: `mcp__<server>__<tool>`。resource は `@server:proto://path`、prompt は `/mcp__<server>__<prompt>`。**Tool search（遅延ロードの `ToolSearch`）は既定 ON**（`ENABLE_TOOL_SEARCH`）。`MAX_MCP_OUTPUT_TOKENS` 既定25,000。

## Skills / Agent Skills

- `SKILL.md` に指示を書くと toolkit に加わる。**Agent Skills** オープン標準（agentskills.io）準拠。**progressive disclosure**:「body は使用時のみロード」、平時は name+description のみ context に（`SKILL.md` は 500行未満推奨、詳細は supporting file へ）。
- 配置: managed → `~/.claude/skills/` → `.claude/skills/` → plugin。frontmatter: `name` `description` `when_to_use` `arguments` `allowed-tools` `model` `context: fork` `disable-model-invocation`(user限定) `user-invocable`(Claude限定) 等。

## Plan mode / permission modes / background / checkpoints / memory / settings

- **Shift+Tab** で `default → acceptEdits → plan` を循環。**Plan mode** = 変更せず調査し提案（Ctrl+G で plan 編集、`EnterPlanMode`/`ExitPlanMode`）。**Auto mode** は research preview（別 classifier が行為を審査、3連続/20回ブロックで人間に fallback）。**protected paths**（`.git` `.claude` shell rc 等）は bypass 以外で自動承認されない。
- **Background**: `/background`(`/bg`) でセッションを background agent 化、`claude agents`=agent view で並列監視、`claude attach/stop/rm/logs <id>`。`/batch` は大変更を 5〜30 単位に分解し worktree ごとに background subagent。
- **Checkpoints**: `/rewind`（会話 and/or code を巻き戻す or 選択メッセージから要約）。「Claude の変更のみ追跡、git の代替ではない」。
- **Memory**: 2系統 = **CLAUDE.md**（人が書く）+ **auto memory**（Claude が書く、v2.1.59+、既定 ON、`~/.claude/projects/<p>/memory/MEMORY.md`）。CLAUDE.md scope: managed → user → project → local、`@path` import（最大4 hop）、`.claude/rules/*.md`（`paths:` で path 別ルール）。`/init` が starter を生成。
- **settings.json**: `~/.claude/settings.json`(user) / `.claude/settings.json`(project) / `.claude/settings.local.json`(local) / managed。主要キー: `permissions.{defaultMode,allow,ask,deny}` `hooks` `agent` `model` `env` `autoMemoryEnabled` `disableBundledSkills` `skillOverrides` 等。
