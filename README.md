## いろいろ 
1. vimの読み込み
https://blog.tiqwab.com/2017/01/15/understand-vim-plugin-management.html
https://wakame.hatenablog.jp/entry/2014/09/05/085345#fn-e8293d7d

1. dotfileをgithubで管理
http://www.office-matsunaga.biz/linuxcommand/description.php?id=5
https://qiita.com/yutakatay/items/c6c7584d9795799ee164
https://qiita.com/ogaaryo/items/6fa6ba9b7a81687092a5

1. Lubuntuのaoutstartはシンボリックリンクで運用できない
https://udemy.benesse.co.jp/development/web/shellscript.html

1. Githubで管理しつつ公開したいコードの表示はgiet-itを使えばOK
https://sun0range.com/information-technology/gist-it
https://gist-it.appspot.com/

1. hugo自作ショートコードの作り方（adsenceとgistit）
gistitは作ったので
/difference_between_leader_and_command_in_vim/
のテストで書いたやつを作ること

## Linuxコマンド
1. シンボリックリンク
http://www.office-matsunaga.biz/linuxcommand/description.php?id=5
https://kazmax.zpp.jp/linux_beginner/symbolic_link.html

1. mkdirの複数の階層を一括作成
https://qiita.com/dev-sabatarou/items/c0a1cf81a8c7a0dfa04a

## vimコマンド

1. vimでターミナルを使う方法
https://knowledge.sakura.ad.jp/22488/
https://knowledge.sakura.ad.jp/23018/
https://qiita.com/gorilla0513/items/4d1c610f1283bbe46f81

1. netwrの使い方
https://qiita.com/gorilla0513/items/bf2f78dfec67242f5bcf
http://sawasawato.blog.fc2.com/blog-entry-57.html
https://pc.oreda.net/software/filer/netrw

1. tabeの使い方
http://atomiyama.com/linux/page/vim-tab-sousa/

1. その他コマンドライン
https://knowledge.sakura.ad.jp/22488/
https://www.atmarkit.co.jp/ait/articles/1706/02/news017.html

C:\Users\gs-keibi.cross\AppData\Local\Google\Chrome\User Data

## PythonとShellScriptの使い分け
- 標準入力から得られた内容を加工して、結果を標準出力に出す用途が得意
- 環境依存したくないインストール系作業
- ステートレスならshell ステートフルならPython
- 画面スクロールするレベルの量を書くならPython使った方がいい
- 複雑な計算処理はPython使った方がいい
- 変数をたくさん使うならPython使った方がいい
- 実行の過程を標準出力で見るならshell
- いちいち変数を用意しなくても標準出力でパイプ繋げれば済みそうなものはShell
- 引数、配列、if、for使う必要あるならPythonの方が楽
- json使うならPython
- オブジェクト指向、クラスを考えるほどならPython
- 非対話出来な
- ファイル操作は
- 環境依存が少ない
  - 基本Unixにはbashがある
  - Pythonだと2.xの可能性がある
  - そうじゃなくてもライブラリ依存しているかなどの不安要素がある

### 参考
- https://eel3.hatenablog.com/entry/20161225/1482676689
- https://qiita.com/piroor/items/77233173707a0baa6360
