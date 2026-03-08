#!/bin/zsh

# 1. GitHubのURLを開く (Mac/Linux両対応)
GITHUB_URL="https://github.com/HaLucina/dotfiles/blob/main/ALL_KeyMap.md"
if command -v open >/dev/null; then
    open "$GITHUB_URL"
elif command -v xdg-open >/dev/null; then
    xdg-open "$GITHUB_URL"
fi

# 2. Obsidianを開く
# URIスキームを使うことで、起動していなければ起動し、特定のファイルを開けます
# ※ vault名はご自身の環境に合わせて「MyVault」を書き換えてください
OBSIDIAN_URI="obsidian://open?vault=MyVault&file=ALL_KeyMap"
open "$OBSIDIAN_URI"

echo "Memory refreshed! 🧠"
