#!/usr/bin/env bash
# setups/lib/packages.sh
# Package installation helper for apt and dnf (with idempotency checks)
# apt/dnf 対応のパッケージインストーラ（既にインストール済みはスキップ）
set -euo pipefail

# Default packages (modify as needed)
# ここでデフォルトのパッケージを定義します（既にインストールされているものはスキップされる）
DEFAULT_PKGS=(git curl stow zsh wget neovim make gcc gh)

# Detect package manager
detect_pm() {
  PM=""
  if command -v apt >/dev/null 2>&1; then
    PM="apt"
  elif command -v dnf >/dev/null 2>&1; then
    PM="dnf"
  fi
  echo "$PM"
}

is_pkg_installed() {
  pkg="$1"
  PM="$(detect_pm)"
  case "$PM" in
    apt)
      dpkg -s "$pkg" >/dev/null 2>&1
      ;;
    dnf)
      rpm -q "$pkg" >/dev/null 2>&1
      ;;
    *)
      return 1
      ;;
  esac
}

_install_with_apt() {
  run "sudo apt update"
  run "sudo apt install -y $*"
}

_install_with_dnf() {
  run "sudo dnf install -y $*"
}

# install_packages: main entry
# 引数があればそれをインストール対象に、無ければ DEFAULT_PKGS を使います
install_packages() {
  if [ "$#" -gt 0 ]; then
    pkgs=("$@")
  else
    pkgs=("${DEFAULT_PKGS[@]}")
  fi

  PM="$(detect_pm)"
  if [ -z "$PM" ]; then
    err "No apt/dnf found; skipping package installation"
    return 0
  fi

  to_install=()
  for p in "${pkgs[@]}"; do
    if is_pkg_installed "$p"; then
      log "already installed: $p"
    else
      to_install+=("$p")
    fi
  done

  if [ "${#to_install[@]}" -eq 0 ]; then
    log "All requested packages are already installed"
    return 0
  fi

  log "Installing packages via $PM: ${to_install[*]}"
  if [ "$PM" = "apt" ]; then
    _install_with_apt "${to_install[*]}"
  else
    _install_with_dnf "${to_install[*]}"
  fi
}
