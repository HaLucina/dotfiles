#!/usr/bin/env bash
# setup/lib/detect-os.sh
# Detect OS and WSL; set variables: OS_TYPE, IS_WSL, OS_ID, OS_PRETTY
# OS と WSL の判定を行い、変数を設定します
set -euo pipefail

detect_os() {
  IS_WSL=0
  OS_ID=""
  OS_PRETTY=""

  # WSL detection (modern env vars + /proc/version)
  if [ -n "${WSL_INTEROP:-}" ] || [ -n "${WSL_DISTRO_NAME:-}" ]; then
    IS_WSL=1
  elif [ -r /proc/version ] && grep -qi microsoft /proc/version 2>/dev/null; then
    IS_WSL=1
  fi

  if [ -r /etc/os-release ]; then
    # shellcheck disable=SC1091
    . /etc/os-release
    OS_ID="${ID:-}"
    OS_PRETTY="${PRETTY_NAME:-$OS_ID}"
  else
    OS_ID="$(uname -s)"
    OS_PRETTY="$OS_ID"
  fi

  if [ "$IS_WSL" -eq 1 ]; then
    OS_TYPE="WSL"
  elif [[ "${OS_ID,,}" =~ ubuntu ]]; then
    OS_TYPE="Ubuntu"
  elif [[ "${OS_ID,,}" =~ fedora ]]; then
    OS_TYPE="Fedora"
  else
    OS_TYPE="Linux-Other"
  fi

  log "Detected OS: ${OS_PRETTY:-unknown} (type=${OS_TYPE}, wsl=${IS_WSL})"
}
