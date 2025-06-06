
#autoload -Uz promptinit
#promptinit
#if [ "$color_prompt" = yes ]; then
#    PROMPT='%F{black}%K{white} %T %F{black}%K{cyan} %1~ $(__git_ps1 "%F{black}%K{green}(%s)%f")%k%f$ '
#else
#    PROMPT='%T %1~ $(__git_ps1 "(%s)") $ '
#fi
#
## dircolors
#eval $(dircolors -b ~/.dircolors)

# Set up the prompt
# Directoryの色を変更する設定
# wslがコンソール上でフォルダ名に付けるうざい背景色を付ける設定を無効化する
# 参考 > https://arakan-pgm-ai.hatenablog.com/entry/2022/11/07/000000
# もう少し詳しい解説とカスタマイズについて書かれた参考 > https://www.kwbtblog.com/entry/2019/04/27/023411

setopt histignorealldups sharehistory
# 同じコマンドの重複を無視し、全てのZshセッションで履歴を共有します。

# Use emacs keybindings even if our EDITOR is set to vi
bindkey -e
# Emacsのキーバインディングを使用します。

# Keep 1000 lines of history within the shell and save it to ~/.zsh_history:
HISTSIZE=1000
SAVEHIST=1000
HISTFILE=~/.zsh_history
# コマンド履歴の行数を1000に設定し、~/.zsh_historyに保存します。

# Use modern completion system
autoload -Uz compinit
compinit
# 最新の補完システムを使用します。

zstyle ':completion:*' auto-description 'specify: %d'
# 補完時に各候補の説明を表示します。

zstyle ':completion:*' completer _expand _complete _correct _approximate
# 補完の順序を_expand, _complete, _correct, _approximateの順に設定します。

zstyle ':completion:*' format 'Completing %d'
# 補完候補リストのフォーマットを設定します。

zstyle ':completion:*' group-name ''
# 補完候補のグループ名を設定しません。

zstyle ':completion:*' menu select=2
# 2つ目の候補から補完メニューを表示します。

zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
# デフォルトの補完リストの色を設定します。

zstyle ':completion:*' list-colors ''
# 補完リストの色をリセットします。

zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
# 補完リストのプロンプトを設定します。

zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z}' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=* l:|=*'
# 補完候補のマッチング方法を設定します。

zstyle ':completion:*' menu select=long
# 長い形式で補完メニューを表示します。

zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
# 補完メニューのスクロールプロンプトを設定します。

zstyle ':completion:*' use-compctl false
# 古い補完システム（compctl）を使用しないように設定します。

zstyle ':completion:*' verbose true
# 補完時に詳細な情報を表示します。

zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'
# killコマンドの補完リストでプロセスを表示する際の色を設定します。

zstyle ':completion:*:kill:*' command 'ps -u $USER -o pid,%cpu,tty,cputime,cmd'
# killコマンドの補完リストで使用するコマンドを設定します。

# alias
alias wi='which'
alias cl='clear'
alias to='touch'
alias so='source'
alias g='git'
alias hi='history'
alias bu='bundle'
alias ll='ls --color=auto -la'
alias ..='cd ..'
alias rmi='rm -i'
alias rmf='rm -fr'
alias vz='nvim ~/.zshrc'
alias sz='source ~/.zshrc'
alias path='echo $PATH'
alias shell='echo $SHELL'
alias vn='nvim ~/.config/nvim/init.lua'
alias v='nvim'
alias o='(nohup /mnt/z/launchers/obsidian/Obsidian.exe &> /dev/null &)'
# よく使うコマンドのエイリアスを設定します。

# function
pss () {
    if [[ -z "$1" ]]; then
        echo "Usage: pss <pattern>"
        return 1
    fi
    ps aux | grep -E "PID|$1" | grep -v grep
}
# プロセスリストから特定のパターンを持つプロセスを検索する関数。

gre () {
    if [[ -z "$1" || -z "$2" ]]; then
        echo "Usage: gre <pattern> <directory>"
        return 1
    fi
    grep -E "$1" -rl "$2"
}
# 指定したディレクトリ内でパターンに一致するファイルを検索する関数。


######## 参考 > https://joshigaurava.medium.com/custom-zsh-prompt-from-scratch-171e55a80f58
######## src  > https://gist.github.com/joshigaurava/b437e1fce4c2214fd71c2ea8c4ab852b/revisions
# 参考を翻訳して理解したい
# Color and glyph configurations
COLOR_PROMPT_TEXT='009'              # Red
COLOR_PROMPT_GLYPH='255'             # White
COLOR_GIT_REPOSITORY_TEXT='245'      # Grey
COLOR_GIT_BRANCH_TEXT='255'          # White
COLOR_GIT_STATUS_CLEAN='010'         # Green
COLOR_GIT_STATUS_DIRTY='009'         # Red
NUM_DIRS_LEFT_OF_TRUNCATION=1        # Number of directory names to the left of the truncation symbol (must be > 0)
NUM_DIRS_RIGHT_OF_TRUNCATION=2       # Number of directory names to the right of the truncation symbol (must be > 0)
GLYPH_PROMPT_TRUNCATION_SYMBOL='⋯'   # DejaVu Sans Mono glyph for prompt truncation
GLYPH_PROMPT_END_SYMBOL='❯'          # DejaVu Sans Mono glyph for end of prompt
GLYPH_GIT_BRANCH_SYNC_SYMBOL='«'     # DejaVu Sans Mono glyph for Git branch sync status indicator
GLYPH_GIT_STASH_SYMBOL='∘'           # DejaVu Sans Mono glyph for Git stash indicator
GLYPH_GIT_STATUS_SYMBOL='»'          # DejaVu Sans Mono glyph for Git status indicator

# Prompt customizations
precmd_functions+=(set_prompt)
precmd_functions+=(set_rprompt)

# Helpers

set_prompt() {
  # Validate truncation thresholds and set defaults if required
  [[ $NUM_DIRS_LEFT_OF_TRUNCATION -le 0 ]] && NUM_DIRS_LEFT_OF_TRUNCATION=1
  [[ $NUM_DIRS_RIGHT_OF_TRUNCATION -le 0 ]] && NUM_DIRS_RIGHT_OF_TRUNCATION=2

  # Refer https://zsh.sourceforge.io/Doc/Release/Prompt-Expansion.html
  local prompt_truncation_symbol="%F{${COLOR_PROMPT_GLYPH}}%B${GLYPH_PROMPT_TRUNCATION_SYMBOL}%b%f"
  local prompt_end_symbol="%F{${COLOR_PROMPT_GLYPH}}%B${GLYPH_PROMPT_END_SYMBOL}%b%f"
  local total_dirs=$(($NUM_DIRS_LEFT_OF_TRUNCATION+$NUM_DIRS_RIGHT_OF_TRUNCATION+1))
  local dir_path_full="%F{${COLOR_PROMPT_TEXT}}%d%f"
  local dir_path_truncated="%F{${COLOR_PROMPT_TEXT}}%-${NUM_DIRS_LEFT_OF_TRUNCATION}d/%f${prompt_truncation_symbol}%F{${COLOR_PROMPT_TEXT}}/%${NUM_DIRS_RIGHT_OF_TRUNCATION}d%f"

  PROMPT="%(${total_dirs}C.${dir_path_truncated}.${dir_path_full}) ${prompt_end_symbol} "
}

set_rprompt() {
  # Attempt to get the current Git branch name
  local git_branch_name=$(git symbolic-ref --short HEAD 2> /dev/null)
  if [[ -z $git_branch_name ]]; then
    # Unable to get the branch name
    RPROMPT=""

    return
  fi

  # Collect Git status information

  local git_remote_commit=$(git rev-parse "origin/$git_branch_name" 2> /dev/null)
  local git_local_commit=$(git rev-parse "$git_branch_name" 2> /dev/null)
  local git_branch_sync_color=$COLOR_GIT_STATUS_DIRTY
  if [[ $git_remote_commit == $git_local_commit ]]; then
    # Branch in sync
    git_branch_sync_color=$COLOR_GIT_STATUS_CLEAN
  fi

  local git_stash=$(git stash list)
  local git_stash_symbol=$GLYPH_GIT_STASH_SYMBOL
  if [[ -z $git_stash ]]; then
    # Empty stash
    git_stash_symbol=""
  fi

  local git_status=$(git status --porcelain)
  local git_stash_color=$COLOR_GIT_STATUS_DIRTY
  local git_status_color=$COLOR_GIT_STATUS_DIRTY
  if [[ -z $git_status ]]; then
    # Nothing reported in status
    git_stash_color=$COLOR_GIT_STATUS_CLEAN
    git_status_color=$COLOR_GIT_STATUS_CLEAN
  fi

  # Get the top-level directory of the Git repository
  local git_repository_path=$(git rev-parse --show-toplevel)
  local git_repository_name=$(basename "$git_repository_path")

  local git_repository_text="%F{${COLOR_GIT_REPOSITORY_TEXT}}${git_repository_name}%f"
  local git_branch_sync_symbol="%F{${git_branch_sync_color}}%B${GLYPH_GIT_BRANCH_SYNC_SYMBOL}%b%f"
  local git_stash_symbol="%F{${git_stash_color}}%B${git_stash_symbol}%b%f"
  local git_status_symbol="%F{${git_status_color}}%B${GLYPH_GIT_STATUS_SYMBOL}%b%f"
  local git_branch_text="%F{${COLOR_GIT_BRANCH_TEXT}}${git_branch_name}%f"

  RPROMPT="${git_repository_text} ${git_branch_sync_symbol}${git_stash_symbol}${git_status_symbol} ${git_branch_text}"
}
