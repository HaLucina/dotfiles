#!/usr/bin/env bash
# setup/install.sh
# Entrypoint: parse CLI args and delegate to runner.sh
# エントリポイント：CLI引数を解析して runner.sh に委譲します
set -euo pipefail

# Default flags (exported for runner/lib to use)
DRY_RUN=0
NO_PKG=0
NO_STOW=0
NO_KEYD=0
STOW_OVERRIDE=""

usage() {
  cat <<'EOF'
Usage: install.sh [options] [packages.　gi s..]

Options:
  --help             Show this help
  --dry-run          Show actions without executing (DRY RUN)
  --no-pkg           Skip package installation
  --no-stow          Skip stow / linking step
  --no-keyd          Skip keyd setup
  --stow=dir,dir     Comma-separated stow targets override

Examples:
  ./install.sh                 # run default install
  ./install.sh neovim tmux     # install specific packages
EOF
}

# parse args
ARGS=()
while [ $# -gt 0 ]; do
  case "$1" in
    --help|-h) usage; exit 0 ;;
    --dry-run) DRY_RUN=1; shift ;;
    --no-pkg) NO_PKG=1; shift ;;
    --no-stow) NO_STOW=1; shift ;;
    --no-keyd) NO_KEYD=1; shift ;;
    --stow=*) STOW_OVERRIDE="${1#*=}"; shift ;;
    --stow) shift; STOW_OVERRIDE="$1"; shift ;;
    --*) echo "Unknown option: $1"; usage; exit 1 ;;
    *) ARGS+=("$1"); shift ;;
  esac
done

# Environment defaults
export DOTFILES="${DOTFILES:-$HOME/dotfiles}"  # path to dotfiles (default $HOME/dotfiles)
export DRY_RUN NO_PKG NO_STOW NO_KEYD STOW_OVERRIDE

# Delegate to runner
exec "$(cd "$(dirname "$0")" && pwd)/runner.sh" "${ARGS[@]}"
