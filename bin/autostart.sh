<< DESCRIPTION
-----------------------------------------------------------------------------------
[要約]
lxterminalのautostartで実行したいことを代行させるbush


[場所]
~/mygits/dotfiles/bin/


[詳細]
- `/home/halucina/bin/`にコレのシンボリックリンクを作成

- `~/.config/lxsession/Lubuntu/autostart`から`@bash /home/halucina/bin/@autostart`を
  記述して呼び出している(@~はシンボリックリンク)

- autostartファイルをdotfilesで管理しようとシンボリックにしたら動かなかったので
  autostartファイルは置いたまま、実行したいことはbushから呼び出すことにした
-----------------------------------------------------------------------------------
DESCRIPTION


#!/bin/bash
synclient TapAndDragGesture=0 
synclient MaxTapTime=0 
syndaemon -d -t -k
synclient AreaLeftEdge=400 AreaRightEdge=2500 AreaTopEdge=200

#lxterminal -e vim . -c term
lxterminal -e nvim
