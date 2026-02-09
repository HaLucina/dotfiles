#!/usr/bin/env bash
# setups/lib/stow.sh
# Run GNU stow for top-level targets and ensure bash links (.bashrc/.bash_profile)
# Top-level の stow ターゲットを自動検出して stow を実行し、bash のシンボリック作成も行います
set -euo pipefail

STOW_EXCLUDES="setups windows wsl keyd readmes .git"

detect_stow_targets() {
  local targets=()
  for d in "$DOTFILES"/*; do
    [ -d "$d" ] || continue
    name="$(basename "$d")"
    case " $STOW_EXCLUDES " in
      *" $name "*) continue ;;
    esac
    targets+=("$name")
  done
  echo "${targets[@]:-}"
}

run_stow() {
  if ! command -v stow >/dev/null 2>&1; then
    err "stow not found: please install stow or skip stow step"
    return 0
  fi

  if [ -n "${STOW_OVERRIDE:-}" ]; then
    IFS=',' read -r -a targets <<< "$STOW_OVERRIDE"
  else
    read -r -a targets <<< "$(detect_stow_targets)"
  fi

  if [ "${#targets[@]}" -eq 0 ]; then
    log "No stow targets detected"
    return 0
  fi

  cd "$DOTFILES"
  for t in "${targets[@]}"; do
    if [ -d "$t" ]; then
      log "Running: stow -R $t"
      run "stow -v -R \"$t\""
    else
      log "Skipping missing stow target: $t"
    fi
  done
}

# ensure_bash_links:
# Ensure bash/bashrc and bash/bash_profile in the repository are linked to ~/.bashrc and ~/.bash_profile
# リポジトリ内の bash/bashrc および bash/bash_profile をホームへシンボリックします
ensure_bash_links() {
  local src_rc="" src_profile=""
  # Prefer non-dot filenames (bash/bashrc) then fallback to dot variant (bash/.bashrc)
  if [ -f "$DOTFILES/bash/bashrc" ]; then
    src_rc="$DOTFILES/bash/bashrc"
  elif [ -f "$DOTFILES/bash/.bashrc" ]; then
    src_rc="$DOTFILES/bash/.bashrc"
  fi

  if [ -f "$DOTFILES/bash/bash_profile" ]; then
    src_profile="$DOTFILES/bash/bash_profile"
  elif [ -f "$DOTFILES/bash/.bash_profile" ]; then
    src_profile="$DOTFILES/bash/.bash_profile"
  fi

  if [ -n "$src_rc" ]; then
    log "Linking bashrc: $src_rc -> $HOME/.bashrc"
    backup_and_link "$src_rc" "$HOME/.bashrc"
  else
    log "No bashrc found in $DOTFILES/bash (tried bash/bashrc and bash/.bashrc)."
  fi

  if [ -n "$src_profile" ]; then
    log "Linking bash_profile: $src_profile -> $HOME/.bash_profile"
    backup_and_link "$src_profile" "$HOME/.bash_profile"
  else
    log "No bash_profile found in $DOTFILES/bash (tried bash/bash_profile and bash/.bash_profile)."
  fi
}

# Explanation: how to make stow create ~/.bashrc automatically
# 説明: stow によって ~/.bashrc を自動生成したい場合の方法
# 1) Repo に dot-file を置く方法：
#    - Put a file named ".bashrc" inside the "bash" folder in the repo (bash/.bashrc).
#    - Then run: (cd $DOTFILES && stow -t $HOME bash)
#    - This will create $HOME/.bashrc as a symlink to $DOTFILES/bash/.bashrc.
# 2) Repo without dot (your preference):
#    - Keep file as bash/bashrc (no leading dot) and let this script create the link to ~/.bashrc
#    - This repo uses option 2 by default (we look for bash/bashrc first and create symlink).
#
# Choose whichever fits your workflow. If you prefer stow-native dot-files, rename
# bash/bashrc -> bash/.bashrc in the repo (git mv) so stow handles it directly.
