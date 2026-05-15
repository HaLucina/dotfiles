#!/bin/bash

# Constants -----------------------------------------------------------

OBSIDIAN_DIR="$HOME/Documents/obsidian"
PLUGINS_DIR="$OBSIDIAN_DIR/.obsidian/plugins"
CONFIG_FILE="$OBSIDIAN_DIR/.obsidian/community-plugins.json"

GREEN='\033[0;32m'
RED='\033[0;31m'
YELLOW='\033[1;33m'
NC='\033[0m'

# Helpers -------------------------------------------------------------

# 全てのログを標準エラー(>&2)に出力することで、関数の戻り値を汚さない
log_info() { printf "${YELLOW}[System]${NC} %s\n" "$1" >&2; }
log_success() { printf "${GREEN}[Success]${NC} %s\n" "$1" >&2; }
log_error() { printf "${RED}[Error]${NC} %s\n" "$1" >&2; }

# Core Logic ----------------------------------------------------------

get_latest_stable_tag() {
    local repo=$1
    curl -s "https://api.github.com/repos/$repo/releases" | \
        jq -r '. | map(select(.prerelease == false and (.tag_name | test("beta|alpha|rc"; "i") | not))) | .[0].tag_name'
}

get_plugin_id_from_manifest() {
    local manifest_url=$1
    curl -s "$manifest_url" | jq -r '.id'
}

install_plugin() {
    local repo=$1
    local tag
    tag=$(get_latest_stable_tag "$repo")

    if [[ -z "$tag" || "$tag" == "null" ]]; then
        log_error "No stable release found for $repo."
        exit 1
    fi

    local base_url="https://github.com/$repo/releases/download/$tag"
    local manifest_url="https://raw.githubusercontent.com/$repo/$tag/manifest.json"
    
    local plugin_id
    plugin_id=$(get_plugin_id_from_manifest "$manifest_url")
    local target_dir="$PLUGINS_DIR/$plugin_id"

    log_info "Installing $plugin_id ($tag)..."
    mkdir -p "$target_dir"

    # 必須ファイルと、任意ファイル(styles.css)をスマートに処理
    # --fail を付けることで、存在しないファイル(404)は保存しない
    for file in "main.js" "manifest.json" "styles.css"; do
        curl -sL --fail "$base_url/$file" -o "$target_dir/$file" 2>/dev/null
    done

    [ ! -f "$target_dir/data.json" ] && echo "{}" > "$target_dir/data.json"
    
    # 標準出力にはIDだけを流す
    echo "$plugin_id"
}

enable_plugin() {
    local id=$1
    [ -z "$id" ] && return
    
    # Obsidian起動中は設定の上書きリスクがあるため中断
    if pgrep -x "obsidian" > /dev/null; then
        log_error "Obsidian is running. Please close it before activating plugins."
        return 1
    fi

    log_info "Activating $id..."
    [ -f "$CONFIG_FILE" ] || echo "[]" > "$CONFIG_FILE"
    
    local tmp
    tmp=$(mktemp)
    jq "(. + [\"$id\"]) | unique" "$CONFIG_FILE" > "$tmp" && mv "$tmp" "$CONFIG_FILE"
    log_success "Successfully added $id to community-plugins.json."
}

# Execute -------------------------------------------------------------

TARGET_REPO=${1:-"liamcain/obsidian-calendar-plugin"}

# 関数の標準出力(echo $plugin_id)だけを変数に代入
ID=$(install_plugin "$TARGET_REPO")

# 有効化処理を実行
enable_plugin "$ID" || exit 1

log_success "Deployment of '$ID' finished elegantly."
