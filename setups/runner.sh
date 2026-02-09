#!/usr/bin/env bash
# setups/runner.sh
# Orchestrator: load libs and perform installation steps
# オーケストレータ：ライブラリを読み込んでインストール手順を実行します
set -euo pipefail

BASE_DIR="$(cd "$(dirname "$0")" && pwd)"

# Ensure scripts are executable (apply chmod +x to setups/*.sh and setups/lib/*.sh)
# setups/*.sh と setups/lib/*.sh に実行権を付与します（setup 時に一度実行）
if [ -d "$BASE_DIR" ]; then
  chmod +x "$BASE_DIR"/*.sh 2>/dev/null || true
  chmod +x "$BASE_DIR"/lib/*.sh 2>/dev/null || true
  echo "[setup] Made setup scripts executable (chmod +x)."
fi

# shellcheck disable=SC1090
. "$BASE_DIR/lib/common.sh"
. "$BASE_DIR/lib/detect-os.sh"
. "$BASE_DIR/lib/packages.sh"
. "$BASE_DIR/lib/keyd.sh"
. "$BASE_DIR/lib/github.sh"
. "$BASE_DIR/lib/windows.sh"
. "$BASE_DIR/lib/stow.sh"
. "$BASE_DIR/lib/user-dirs.sh"

log "Starting dotfiles setup (DOTFILES=${DOTFILES:-$HOME/dotfiles})"
detect_os   # sets OS_TYPE, IS_WSL, OS_ID, OS_PRETTY

# Install packages unless NO_PKG specified
if [ "${NO_PKG:-0}" -eq 0 ]; then
  if [ "$#" -gt 0 ]; then
    install_packages "$@"
  else
    install_packages
  fi
else
  log "Package installation skipped (--no-pkg)"
fi

# Ensure GitHub CLI installed, then configure git user
install_github_cli
configure_git_user

# Keyd setup (unless disabled)
if [ "${NO_KEYD:-0}" -eq 0 ]; then
  setup_keyd
else
  log "Keyd setup skipped (--no-keyd)"
fi

# Windows assets (WSL -> Windows copy)
handle_windows_assets

# stow / linking
if [ "${NO_STOW:-0}" -eq 0 ]; then
  run_stow
  ensure_bash_links   # ensure bashrc & bash_profile are symlinked
else
  log "Stow/linking skipped (--no-stow)"
fi

# Normalize user dirs (xdg-user-dirs) - run at end
normalize_user_dirs

log "Done. If any step required manual action, check the logs above."
