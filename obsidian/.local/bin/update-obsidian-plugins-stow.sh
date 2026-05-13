#!/bin/bash

# Constants -----------------------------------------------------------

DOTFILES_DIR="$HOME/dotfiles"
OBSIDIAN_PKG="obsidian"
REAL_PLUGINS_DIR="$HOME/Documents/obsidian/.obsidian/plugins"
DOT_PLUGINS_DIR="$DOTFILES_DIR/obsidian/Documents/obsidian/.obsidian/plugins"

GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m'

# Helpers -------------------------------------------------------------

log_info() { printf "${YELLOW}[System]${NC} %s\n" "$1"; }
log_success() { printf "${GREEN}[Success]${NC} %s\n" "$1"; }

# Core Logic (Functional Approach) ------------------------------------

# 1. 未管理のプラグインを特定し、data.jsonを移動する関数
# 引数: プラグインのフルパス
sync_plugin_setting() {
    local plugin_path="$1"
    local plugin_name=$(basename "$plugin_path")
    local target_dot_dir="$DOT_PLUGINS_DIR/$plugin_name"

    # 「dotfiles側に未存在」かつ「data.jsonが存在」する場合のみ実行 (Filter & Map)
    if [[ ! -d "$target_dot_dir" && -f "$plugin_path/data.json" ]]; then
        log_info "New plugin detected: $plugin_name"
        mkdir -p "$target_dot_dir"
        mv "$plugin_path/data.json" "$target_dot_dir/"
    fi
}

# 2. メイン処理のパイプライン化
process_plugins() {
    # exportすることで、外部コマンド(xargs)から関数を呼び出せるようにする
    export -f log_info sync_plugin_setting
    export DOT_PLUGINS_DIR YELLOW NC

    # 手続き的なループの代わりに、findの結果をxargsで処理(イテレート)
    find "$REAL_PLUGINS_DIR" -maxdepth 1 -mindepth 1 -type d -print0 | \
        xargs -0 -I {} bash -c 'sync_plugin_setting "$@"' _ {}
}

relink_stow() {
    log_info "Restructuring symbolic links with GNU Stow..."
    cd "$DOTFILES_DIR" && {
        stow -D "$OBSIDIAN_PKG"
        stow -v -R --no-folding "$OBSIDIAN_PKG"
    }
}

# Execute -------------------------------------------------------------

process_plugins
relink_stow

log_success "All processes completed elegantly."
exit 0
