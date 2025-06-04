# Set up the prompt
autoload -Uz promptinit
promptinit
prompt adam1
# プロンプトの初期設定を行い、adam1テーマを使用します。

setopt histignorealldups sharehistory
# 同じコマンドの重複を無視し、全てのZshセッションで履歴を共有します。

# Use emacs keybindings even if our EDITOR is set to vi
bindkey -v
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

eval "$(dircolors -b)"
# ディレクトリリストの色を設定します。

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

export PS1="\$ "
#export PS1="%~ %n "
#ターミナルに表示されるユーザ名を表示するところにPC名をカレントディレクトリを表示する


