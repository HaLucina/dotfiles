#!/usr/bin/env bash
set -euo pipefail

# ============================================================================
# Initialization
# ============================================================================

readonly DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
readonly TARGET_DIR="$HOME"

cd "$DOTFILES_DIR"

# ============================================================================
# Pure Functions
# ============================================================================

detect_os() {
    case "$(uname -s)" in
        Linux)
            grep -qi microsoft /proc/version 2>/dev/null && printf 'wsl' || printf 'linux'
            ;;
        Darwin)
            printf 'macos'
            ;;
        MINGW*|MSYS*|CYGWIN*)
            printf 'windows'
            ;;
        *)
            printf 'unknown'
            ;;
    esac
}

# ============================================================================
# Side-Effect Functions
# ============================================================================

print_separator() {
    local message="$1"
    printf '\n%s\n%s\n%s\n\n' \
        "-------------------------------------------------------------------" \
        "$message" \
        "-------------------------------------------------------------------"
}

stow_packages() {
    local -n packages_ref="$1"

    for package in "${packages_ref[@]}"; do
        if [[ -d "$package" ]]; then
            printf '[*] stow %s\n' "$package"
            stow -v -t "$TARGET_DIR" "$package"
        fi
    done
}

# ============================================================================
# Package Definitions
# ============================================================================

declare -a LINUX_PACKAGES=(
    zsh
    bash
    nvim
    vim
    wezterm
    tmux
    yazi
    keyd
    openbox
)

declare -a WSL_PACKAGES=(
    zsh
    bash
    nvim
    vim
    wezterm
    tmux
    yazi
    wsl
)

declare -a MACOS_PACKAGES=(
    zsh
    bash
    nvim
    vim
    wezterm
    tmux
    yazi
)

declare -a WINDOWS_PACKAGES=(
    ahk
    chgkey
    scoop
)

declare -A OS_PACKAGES=(
    [linux]=LINUX_PACKAGES
    [wsl]=WSL_PACKAGES
    [macos]=MACOS_PACKAGES
    [windows]=WINDOWS_PACKAGES
)

# ============================================================================
# Main
# ============================================================================

main() {
    local os="$(detect_os)"

    case "$os" in
        linux|wsl|macos)
            print_separator "Applying dotfiles for $os"
            stow_packages "${OS_PACKAGES[$os]}"
            print_separator "Dotfiles successfully applied"
            ;;
        windows)
            print_separator "Windows detected"
            printf '%s\n' \
                "Please run the following command in PowerShell:" \
                "  PowerShell -ExecutionPolicy Bypass -File stow-windows.ps1"
            exit 1
            ;;
        unknown)
            print_separator "Unsupported or unknown OS detected"
            printf '%s\n' \
                "The installer could not determine your operating system." \
                "Please check your environment and modify detect_os() if needed."
            exit 1
            ;;
        *)
            print_separator "Unexpected OS identifier: $os"
            exit 1
            ;;
    esac
}

main "$@"
