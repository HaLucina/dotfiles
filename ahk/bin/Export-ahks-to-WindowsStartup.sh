#!/bin/bash
# 
#
# () でサブシェル化し、全体の出力を/dev/nullにリダイレクトしています。
# これにより標準出力・標準エラー出力を完全に捨て、コンソールに何も表示しません。
# サブシェル化しなくても実行できるが以下のようなエラーが出力されて気持ち悪くなる
#
# > '\\wsl.localhost\Ubuntu-test\home\halucina\dotfiles\wsl\bin'
# > ��L�̌��݂̃f�B���N�g���� CMD.EXE ��J�n���܂����B
# > UNC �p�X�̓T�|�[�g����܂���BWindows �f�B���N�g�������Ŏg�p���܂��B

# コピー元ディレクトリ
SRC="$HOME/dotfiles/ahk"

# コピー先ディレクトリ
DST="/mnt/c/Users/$WINUSERNAME/AppData/Roaming/Microsoft/Windows/Start Menu/Programs/Startup"

# .ahkファイルをすべてコピー
cp "$SRC"/*.ahk "$DST"

#(
# # コピー元ディレクトリ
# SRC="$HOME/dotfiles/ahk"
# 
# # コピー先ディレクトリ
# win_user=$(cmd.exe /c "echo %USERNAME%" | tr -d '\r')
# DST="/mnt/c/Users/$win_user/AppData/Roaming/Microsoft/Windows/Start Menu/Programs/Startup"
# 
# # .ahkファイルをすべてコピー
# cp "$SRC"/*.ahk "$DST"
#) >/dev/null 2>&1
