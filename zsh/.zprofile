# Get Windows User name
export WINUSERNAME=$(cmd.exe /c "echo %USERNAME%" 2>/dev/null | tr -d '\r')
export EDITOR=nvim
export LANG=ja_JP.UTF-8
setopt IGNOREEOF
export IGNOREEOF=0
