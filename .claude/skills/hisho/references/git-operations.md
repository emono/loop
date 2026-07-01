# Git操作リファレンス

## base branchへのリベース

作業ブランチをbase branch（通常 `develop`）に対してリベースする。
ユーザーから「リベースして」「最新に追従して」等の指示があった場合に実行。

1. `git fetch origin`
2. `git rebase origin/develop`
3. コンフリクトがあればユーザーに報告して確認を取る

## developブランチへの切り替え＋pull

1. `git pull origin develop`
2. `git checkout develop`

※ 未コミットの変更がある場合はユーザーに確認してから実行する
