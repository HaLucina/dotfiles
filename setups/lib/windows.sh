#!/usr/bin/env bash
# setup/lib/windows.sh
# On WSL, copy Windows-side assets (e.g. AHK files) into Windows user's Startup folder.
# WSL上で Windows の AHK 等を Windows 側に配置するヘルパー
set -euo pipefail

handle_windows_assets() {
  if [ "${IS_WSL:-0}" -eq 0 ]; then
    log "Not WSL: skipping Windows asset handling"
    return 0
  fi

  # Attempt to detect Windows username
  local win_user=""
  if [ -n "${WINUSERNAME:-}" ]; then
    win_user="$WINUSERNAME"
  elif command -v cmd.exe >/dev/null 2>&1; then
    win_user="$(cmd.exe /c "echo %USERNAME%" 2>/dev/null | tr -d '\r')"
  fi

  if [ -z "$win_user" ]; then
    log "Cannot determine Windows username from WSL environment; skipping Windows asset copy"
    return 0
  fi

  local dst="/mnt/c/Users/$win_user/AppData/Roaming/Microsoft/Windows/Start Menu/Programs/Startup"
  local src="$DOTFILES/windows/ahk"
  if [ -d "$src" ] && [ -d "$dst" ]; then
    log "Copying AHK files to Windows startup: $src -> $dst"
    run "cp -v \"$src\"/*.ahk \"$dst\" || true"
  else
    log "Either $src or $dst missing; skipping AHK copy"
  fi

  # Also consider chgkey or other windows assets
  local chg_src="$DOTFILES/windows/chgkey"
  if [ -d "$chg_src" ]; then
    log "Copying chgkey files to Windows user profile if appropriate (manual verify recommended)"
    # No automatic destination assumed; user may want different location.
  fi
}
