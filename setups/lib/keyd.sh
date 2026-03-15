#!/usr/bin/env bash
# setups/lib/keyd.sh
# Deploy keyd configuration and build on Fedora if necessary.
# keyd の配置、および Fedora でのビルドをサポートします
set -euo pipefail

setup_keyd() {
  # Skip on WSL
  if [ "${IS_WSL:-0}" -eq 1 ]; then
    log "WSL detected: skipping keyd installation/configuration"
    return 0
  fi

  # If keyd binary exists, prefer it; otherwise handle Fedora build fallback
  if command -v keyd >/dev/null 2>&1; then
    log "keyd binary detected"
  else
    if [ "${OS_TYPE:-}" = "Fedora" ]; then
      log "keyd not found: attempting to build on Fedora"
      run "sudo dnf groupinstall -y 'Development Tools' || true"
      run "sudo dnf install -y git gcc make libevdev-devel libudev-devel || true"
      TMP="$HOME/src/keyd"
      run "rm -rf \"$TMP\" && git clone https://github.com/rvaiya/keyd.git \"$TMP\""
      run "(cd \"$TMP\" && make && sudo make install) || true"
      run "sudo modprobe uinput || true"
      run "cat <<'UDEV' | sudo tee /etc/udev/rules.d/99-uinput.rules
KERNEL==\"uinput\", MODE=\"0660\", GROUP=\"input\"
UDEV"
      run "sudo udevadm control --reload-rules && sudo udevadm trigger || true"
    else
      log "keyd not installed and no automatic build configured for this distro"
    fi
  fi

  # Deploy configuration from DOTFILES/keyd/default.conf -> /etc/keyd/default.conf
  if [ -f "$DOTFILES/keyd/default.conf" ]; then
    log "Deploying keyd config to /etc/keyd/default.conf"
    run "sudo mkdir -p /etc/keyd"
    run "sudo cp \"$DOTFILES/keyd/default.conf\" /etc/keyd/default.conf"
    run "sudo systemctl enable --now keyd.service || true"
  else
    log "No keyd/default.conf found in dotfiles; skipping config copy"
  fi
}
