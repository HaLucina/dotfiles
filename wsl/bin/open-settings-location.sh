#!/bin/bash
# このスクリプトはWindows TerminalのLocalStateディレクトリをエクスプローラーで開きます。
# 
# () でサブシェル化し、全体の出力を/dev/nullにリダイレクトしています。
# これにより標準出力・標準エラー出力を完全に捨て、コンソールに何も表示しません。
# サブシェル化しなくても実行できるが以下のようなエラーが出力されて気持ち悪くなる
#
# > '\\wsl.localhost\Ubuntu-test\home\halucina\dotfiles\wsl\bin'
# > ��L�̌��݂̃f�B���N�g���� CMD.EXE ��J�n���܂����B
# > UNC �p�X�̓T�|�[�g����܂���BWindows �f�B���N�g�������Ŏg�p���܂��B


localstate_wsl="/mnt/c/Users/$WINUSERNAME/AppData/Local/Packages/Microsoft.WindowsTerminal_8wekyb3d8bbwe/LocalState"
explorer.exe "$(wslpath -w "$localstate_wsl")"

#(
#  win_user=$(cmd.exe /c "echo %USERNAME%" | tr -d '\r')
#  localstate_wsl="/mnt/c/Users/$win_user/AppData/Local/Packages/Microsoft.WindowsTerminal_8wekyb3d8bbwe/LocalState"
#  cd /mnt/c
#  explorer.exe "$(wslpath -w "$localstate_wsl")"
#) >/dev/null 2>&1
