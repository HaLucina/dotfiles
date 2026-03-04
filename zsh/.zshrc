# .zshrc（dotfiles/zshrc と同階層の *.shrc を自動で全て読み込み）

# dircolorsコマンドが存在し、かつ設定ファイルがある場合のみ実行
if (( $+commands[dircolors] )) && [ -f ~/.dircolors ]; then
    eval "$(dircolors -b ~/.dircolors)"
fi

# 補完と履歴など基本設定
setopt histignorealldups sharehistory
bindkey -e
HISTSIZE=1000
SAVEHIST=1000
HISTFILE=~/.zsh_history
setopt IGNOREEOF
export IGNOREEOF=0
autoload -Uz compinit
compinit

# --- 分割ファイル一括読み込み ---
shrc_dir="${HOME}/dotfiles/zsh/.shrc"  # ここを配置場所に合わせて修正

for shrc_file in "$shrc_dir"/*.shrc; do
  [ -r "$shrc_file" ] && source "$shrc_file"
done
