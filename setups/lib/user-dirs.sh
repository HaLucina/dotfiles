#!/usr/bin/env bash
# setups/lib/user-dirs.sh
# Normalize XDG user dirs: rename Japanese folder names to English equivalents
# xdg-user-dirs を用いて日本語ディレクトリ名を英語へ変換する (あなたのスクリプトを組み込み)
set -euo pipefail

normalize_user_dirs() {
  # If running in WSL headless / server, skip
  if [ -z "${DISPLAY:-}" ] && [ -z "${WAYLAND_DISPLAY:-}" ]; then
    log "No graphical session detected (DISPLAY/WAYLAND_DISPLAY empty); skipping user-dirs rename"
    return 0
  fi

  log "Normalizing XDG user dirs (rename Japanese names to English if present)"
  # run as a dry run if DRY_RUN
  if [ "${DRY_RUN:-0}" -eq 1 ]; then
    echo "DRYRUN: Would export LC_ALL=C and run xdg-user-dirs-update --force"
    echo "DRYRUN: Would map and move localized directories if present"
    return 0
  fi

  export LC_ALL=C
  xdg-user-dirs-update --force || true

  declare -A folders=(
      ["ダウンロード"]="Downloads"
      ["テンプレート"]="Templates"
      ["デスクトップ"]="Desktop"
      ["ドキュメント"]="Documents"
      ["公開"]="Public"
      ["ビデオ"]="Videos"
      ["画像"]="Pictures"
      ["音楽"]="Music"
  )

  for jp in "${!folders[@]}"; do
      en=${folders[$jp]}
      if [ -d "$HOME/$jp" ]; then
          log "Processing $jp -> $en..."
          mkdir -p "$HOME/$en"
          if [ "$(ls -A "$HOME/$jp")" ]; then
              run "mv \"$HOME/$jp\"/* \"$HOME/$en/\" 2>/dev/null || true"
          fi
          run "rm -rf \"$HOME/$jp\""
      fi
  done

  xdg-user-dirs-update || true
  log "XDG user dirs normalization completed. You may need to log out/in."
}
