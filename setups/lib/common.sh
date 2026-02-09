#!/usr/bin/env bash
# setup/lib/common.sh
# Shared helpers: logging, run-with-dry-run, backup_and_link、等
# 共有ユーティリティ：ログ、DRY RUN 実行、バックアップ+リンク等
set -euo pipefail
echo -e "\033[1;31mTEST RED\033[0m"

# ----- colors (only if stdout is a terminal) -----
if [[ -t 1 || -n "${FORCE_COLOR:-}" ]]; then
  C_RESET="\033[0m"
  C_INFO="\033[1;34m"
  C_OK="\033[1;32m"
  C_WARN="\033[1;33m"
  C_ERR="\033[1;31m"
  C_DIM="\033[2m"
else
  C_RESET=""
  C_INFO=""
  C_OK=""
  C_WARN=""
  C_ERR=""
  C_DIM=""
fi

# log: simple prefix logger
log() { printf '[setup] %s\n' "$*"; }      # 英語ログ
# 日本語ログの例も入れておく
logj() { printf '[setup] %s\n' "$*"; }     # （日本語も同じ関数で出力可）

# err: error logger
err() { printf '[setup][ERROR] %s\n' "$*" >&2; }

# run: execute command or print if DRY_RUN
run() {
  if [ "${DRY_RUN:-0}" -eq 1 ]; then
    printf '%bDRYRUN%b: %s\n' \
      "$C_DIM" "$C_RESET" "$*"
  else
    eval "$@"
  fi
}

# backup_and_link: backup existing target (if not symlink) and create symlink
# $1 = source (file in dotfiles), $2 = dest (absolute target path)
# 既存ファイルがあれば .bak にリネームしてからシンボリックを貼る
backup_and_link() {
  src="$1"
  dst="$2"
  # If source does not exist, no-op
  if [ ! -e "$src" ]; then
    log "source not found (skip): $src"
    return 0
  fi
  if [ -L "$dst" ]; then
    # destination is a symlink; replace it
    log "Replacing existing symlink: $dst -> $src"
    run "ln -sfn \"$src\" \"$dst\""
    return 0
  fi
  if [ -e "$dst" ]; then
    # backup original
    bak="${dst}.bak.$(date +%Y%m%d%H%M%S)"
    log "Backing up existing file: $dst -> $bak"
    run "mv \"$dst\" \"$bak\""
  fi
  log "Creating symlink: $dst -> $src"
  run "ln -sfn \"$src\" \"$dst\""
}
