#.bash_profile はログイン時にのみ実行されます。具体的な用途は:
#
#    環境変数を設定する (export する変数)
#
#環境変数はプロセス間で勝手に受け継がれるのでログイン時のみ設定すれば十分です。
# 
#https://qiita.com/magicant/items/d3bb7ea1192e63fba850

export PATH=$PATH:~/mygits/dotfiles/bin
