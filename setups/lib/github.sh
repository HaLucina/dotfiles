#!/usr/bin/env bash
# setups/lib/github.sh
# Install GitHub CLI (gh) and configure global git user name/email
# GitHub CLI (gh) をインストールし、git の user.name / user.email を設定します
set -euo pipefail

# install_github_cli: try package manager first, then fallback to official install script
install_github_cli() {
  if command -v gh >/dev/null 2>&1; then
    log "GitHub CLI (gh) already installed"
    return 0
  fi

  PM="$(detect_pm 2>/dev/null || true)"
  if [ -n "$PM" ]; then
    log "Attempting to install gh via package manager ($PM)"
    if [ "$PM" = "apt" ]; then
      # On Ubuntu, recommend official apt repo; fallback to apt if available (may not be latest)
      run "sudo apt update && sudo apt install -y gh || true"
    else
      run "sudo dnf install -y gh || true"
    fi
  fi

  # If still not installed, fallback to official installer script
  if ! command -v gh >/dev/null 2>&1; then
    log "Falling back to official GitHub CLI install script"
    if [ "${DRY_RUN:-0}" -eq 1 ]; then
      echo "DRYRUN: curl -fsSL https://cli.github.com/install.sh | sudo bash"
    else
      curl -fsSL https://cli.github.com/install.sh | sudo bash
    fi
  fi

  if command -v gh >/dev/null 2>&1; then
    log "GitHub CLI installed"
  else
    err "GitHub CLI installation failed or was skipped"
  fi
}

# configure_git_user: set git global user.name and user.email
# Use env vars GIT_NAME and GIT_EMAIL if provided; otherwise prompt interactively
configure_git_user() {
  # If git isn't installed, skip (packages module should have installed git)
  if ! command -v git >/dev/null 2>&1; then
    err "git not found; cannot configure git user"
    return 0
  fi

  current_name="$(git config --global user.name || true)"
  current_email="$(git config --global user.email || true)"

  if [ -n "$current_name" ] && [ -n "$current_email" ]; then
    log "Git global user already set: $current_name <$current_email>"
    return 0
  fi

  # If env vars present, use them
  if [ -n "${GIT_NAME:-}" ] && [ -n "${GIT_EMAIL:-}" ]; then
    log "Using GIT_NAME/GIT_EMAIL environment variables to set git config"
    if [ "${DRY_RUN:-0}" -eq 1 ]; then
      echo "DRYRUN: git config --global user.name \"$GIT_NAME\""
      echo "DRYRUN: git config --global user.email \"$GIT_EMAIL\""
    else
      git config --global user.name "$GIT_NAME"
      git config --global user.email "$GIT_EMAIL"
      log "git global user set: $GIT_NAME <$GIT_EMAIL>"
    fi
    return 0
  fi

  # Otherwise prompt the user (interactive)
  if [ "${DRY_RUN:-0}" -eq 1 ]; then
    echo "DRYRUN: Would prompt for git user.name and user.email interactively"
    return 0
  fi

  read -r -p "Enter your Git user.name: " name
  read -r -p "Enter your Git user.email: " email
  if [ -n "$name" ] && [ -n "$email" ]; then
    git config --global user.name "$name"
    git config --global user.email "$email"
    log "git global user set: $name <$email>"
  else
    log "Git user not set (blank input)"
  fi
}
