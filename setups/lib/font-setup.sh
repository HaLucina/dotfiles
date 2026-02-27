#!/usr/bin/env bash
# setups/lib/font-setup.sh
# Nerd Font installation and Ptyxis terminal configuration

setup_fonts_ptyxis() {
    local font_name="JetBrainsMono Nerd Font Mono"
    local font_size="11"
    local font_full_name="${font_name} ${font_size}"

    log "Checking Nerd Fonts..."

    # 1. フォントがシステムに認識されているか確認
    if ! fc-list :family | grep -i "$font_name" >/dev/null 2>&1; then
        log "Font not found. Installing $font_name..."
        
        mkdir -p "$HOME/.local/share/fonts"
        local tmp_dir
        tmp_dir=$(mktemp -d)
        
        # GitHubから最新のJetBrainsMonoをダウンロード
        if curl -L -o "${tmp_dir}/font.zip" "https://github.com/ryanoasis/nerd-fonts/releases/latest/download/JetBrainsMono.zip"; then
            unzip -o "${tmp_dir}/font.zip" -d "$HOME/.local/share/fonts"
            fc-cache -fv
            log "Font installed successfully."
        else
            log "Error: Failed to download font."
        fi
        rm -rf "$tmp_dir"
    else
        log "Font $font_name is already installed."
    fi

    # 2. Ptyxisの設定適用 (Fedora / GNOME)
    # Ptyxisがインストールされている場合のみ実行
    if command -v ptyxis >/dev/null 2>&1 || gsettings list-schemas | grep -q "org.gnome.Ptyxis"; then
        log "Applying font settings to Ptyxis..."
        
        # アプリ全体の設定をオフにする
        gsettings set org.gnome.Ptyxis use-system-font false
        gsettings set org.gnome.Ptyxis font-name "$font_full_name"

        # 全プロファイルUUIDに対してループ処理
        local profiles
        profiles=$(gsettings get org.gnome.Ptyxis profile-uuids | tr -d "[]',")
        for uuid in $profiles; do
            gsettings set org.gnome.Ptyxis.Profile:/org/gnome/Ptyxis/Profiles/"$uuid"/ use-system-font false 2>/dev/null || true
            gsettings set org.gnome.Ptyxis.Profile:/org/gnome/Ptyxis/Profiles/"$uuid"/ font-name "$font_full_name" 2>/dev/null || true
        done
        log "Ptyxis settings updated."
    else
        log "Ptyxis not found, skipping terminal font configuration."
    fi
}
