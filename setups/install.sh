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

readonly BASE_DIR="$(cd "$(dirname "$0")" && pwd)"
readonly USAGE_FILE="$BASE_DIR/usage.txt"

usage() {
  [[ -f "$USAGE_FILE" ]] && cat "$USAGE_FILE" || echo "Help file not found."
  exit 0
}

# parse args
ARGS=()
while [ $# -gt 0 ]; do
  case "$1" in
    --help|-h) usage; exit 0 ;;
    --dry-run|-d) DRY_RUN=1; shift ;;
    --no-pkg|-np) NO_PKG=1; shift ;;
    --no-stow|-ns) NO_STOW=1; shift ;;
    --no-keyd|-nk) NO_KEYD=1; shift ;;
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
