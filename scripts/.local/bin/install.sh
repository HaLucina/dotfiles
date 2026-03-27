#!/usr/bin/env bash
set -euo pipefail

# Cross-distro installer for dotfiles
# - Detects common Linux/BSD/macOS package managers
# - Installs packages passed as arguments (or a sensible default)
# - Designed to be idempotent and interactive-safe

DEFAULT_PKGS=(git stow zsh curl wget)

usage() {
  cat <<EOF
Usage: $0 [package...]

If no packages are specified, the script installs a default set:
  ${DEFAULT_PKGS[*]}

Examples:
  $0                 # install defaults
  $0 neovim tmux      # install specific packages
EOF
}

if [[ "[1;33m${1:-}"[0m == "--help" || "[1;33m${1:-}"[0m == "-h" ]]; then
  usage
  exit 0
fi

PKGS=()
if [[ $# -gt 0 ]]; then
  PKGS=("$@")
else
  PKGS=("${DEFAULT_PKGS[@]}")
fi

# Detect distro / package manager
PM=""
INSTALL_CMD=""
UPDATE_CMD=""

if command -v apt-get >/dev/null 2>&1; then
  PM="apt"
  UPDATE_CMD="sudo apt-get update -y"
  INSTALL_CMD="sudo apt-get install -y"
elif command -v apt >/dev/null 2>&1; then
  PM="apt"
  UPDATE_CMD="sudo apt update -y"
  INSTALL_CMD="sudo apt install -y"
elif command -v pacman >/dev/null 2>&1; then
  PM="pacman"
  UPDATE_CMD="sudo pacman -Sy"
  INSTALL_CMD="sudo pacman -S --noconfirm"
elif command -v dnf >/dev/null 2>&1; then
  PM="dnf"
  UPDATE_CMD="sudo dnf makecache"
  INSTALL_CMD="sudo dnf install -y"
elif command -v yum >/dev/null 2>&1; then
  PM="yum"
  UPDATE_CMD="sudo yum makecache"
  INSTALL_CMD="sudo yum install -y"
elif command -v zypper >/dev/null 2>&1; then
  PM="zypper"
  UPDATE_CMD="sudo zypper refresh"
  INSTALL_CMD="sudo zypper install -y"
elif command -v apk >/dev/null 2>&1; then
  PM="apk"
  UPDATE_CMD="sudo apk update"
  INSTALL_CMD="sudo apk add --no-cache"
elif command -v brew >/dev/null 2>&1; then
  PM="brew"
  UPDATE_CMD="brew update || true"
  INSTALL_CMD="brew install"
elif [[ "[1;33m$(uname -s)"[0m == "FreeBSD" ]]; then
  PM="pkg"
  UPDATE_CMD="sudo pkg update"
  INSTALL_CMD="sudo pkg install -y"
else
  echo "No supported package manager found. You may need to install packages manually."
  exit 2
fi

echo "Detected package manager: $PM"

# Update
echo "Updating package index..."
if [[ -n "$UPDATE_CMD" ]]; then
  eval "$UPDATE_CMD"
fi

# Install packages function
echo "Installing packages: ${PKGS[*]}"
case "$PM" in
  apt|dnf|yum|zypper|pkg|apk)
    eval "$INSTALL_CMD ${PKGS[*]}"
    ;;  pacman)
    # pacman can fail if some packages are already installed; --needed is a wrapper in some distros
    for p in "${PKGS[@]}"; do
      if pacman -Qi "$p" >/dev/null 2>&1; then
        echo "$p already installed, skipping"
      else
        eval "$INSTALL_CMD $p"
      fi
    done
    ;;
  brew)
    for p in "${PKGS[@]}"; do
      if brew list --formula | grep -x "$p" >/dev/null 2>&1 || brew list --cask | grep -x "$p" >/dev/null 2>&1; then
        echo "$p already installed, skipping"
      else
        eval "$INSTALL_CMD $p"
      fi
    done
    ;;
  *)
    echo "Unsupported package manager: $PM"
    exit 3
    ;;
esac

# Post-install hints
cat <<EOF
Done. Next steps (suggested):
- Run 'stow' or your dotfiles manager to symlink configs, e.g.:
    cd "$HOME/dotfiles" && stow vim zsh
- Change your default shell if installed (example):
    chsh -s "
"$(command -v zsh)"

If you want this script to manage dotfiles symlinks automatically, consider adding those steps here.
EOF
