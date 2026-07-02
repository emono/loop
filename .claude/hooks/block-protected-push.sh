#!/usr/bin/env bash
# PreToolUse(Bash) hook: master/develop への直 push をブロックする決定論的ガードレール。
# 「master に直接 push しない・ブランチ+PR で対応」を prose でなく hook で強制する。
# 判定範囲: git push 系コマンドで、かつ current branch が保護対象(master/develop)のとき exit 2。
#   （明示的な `git push origin HEAD:master` 等の高度な形は対象外＝意図的操作とみなす）

set -u

input="$(cat)"

# tool_input.command を取り出す（Bash tool 以外・取得失敗時は素通り）
cmd="$(printf '%s' "$input" | python3 -c 'import sys,json
try:
    print(json.load(sys.stdin).get("tool_input",{}).get("command",""))
except Exception:
    pass' 2>/dev/null)"

# git push を含まないコマンドは対象外
case "$cmd" in
  *"git push"*) ;;
  *) exit 0 ;;
esac

cur="$(git symbolic-ref --short HEAD 2>/dev/null)"
case "$cur" in
  master|develop)
    echo "Blocked: current branch is '$cur' (protected). 直 push は禁止です。feature ブランチを切って PR で対応してください。" >&2
    exit 2
    ;;
esac

exit 0
