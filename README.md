## tree
> [!note]- tree
> dorfiles
> │  README.md
> │
> ├─bash
> │  │  .bashrc
> │  │  .bash_profile
> │  │
> │  └─sh
> │          autostart.sh
> │          hello
> │
> ├─nvim
> │      init.lua
> │      lazy-lock.json
> │
> ├─obsidian
> │  │  .obsidian.vimrc
> │  │  app.json
> │  │  appearance.json
> │  │  command-palette.json
> │  │  community-plugins.json
> │  │  core-plugins-migration.json
> │  │  core-plugins.json
> │  │  daily-notes.json
> │  │  hotkeys.json
> │  │  note-composer.json
> │  │  page-preview.json
> │  │  templates.json
> │  │  types.json
> │  │  workspace.json
> │  │  zk-prefixer.json
> │  │
> │  └─plugins
> │          calendar.data.json
> │          dataview.data.json
> │          homepage.data.json
> │          obsidian-another-quick-switcher.data.json
> │          obsidian-front-matter-title-plugin.data.json
> │          obsidian-minimal-settings.data.json
> │          obsidian-style-settings.data.json
> │          table-editor-obsidian.data.json
> │          templater-obsidian.data.json
> │
> ├─openbox
> │  │  applications.xml
> │  │  create-rc.sh
> │  │  keyboard.xml
> │  │  lubuntu-rc.xml
> │  │
> │  ├─bk
> │  │      bk-keys.xml
> │  │      origin-lubuntu-rc.xml
> │  │      rc-application.xml
> │  │      rc-key.xml
> │  │
> │  ├─default
> │  │      applications.xml
> │  │      keyboard.xml
> │  │
> │  └─src
> │          applications.xml
> │          keyboard.xml
> │
> ├─vim
> │  │  .netrwhist
> │  │  .vimrc
> │  │  init.vim
> │  │
> │  ├─autoload
> │  │      plug.vim
> │  │
> │  ├─dein
> │  │      dein.toml
> │  │      dein.vimrc
> │  │      deinSettings.vim
> │  │
> │  ├─init
> │  │      basic-few-lines.vim
> │  │      basic-one-line.vim
> │  │      color.vim
> │  │      hugoDict.txt
> │  │      hugoThumbnailDict.txt
> │  │      mapping.vim
> │  │      mycommand.vim
> │  │      template-commands.vim
> │  │
> │  └─plugins
> │          plug-fern.vim
> │          plug-fzf.vim
> │          plug-glyph-palette.vim
> │          plug-vim-airline.vim
> │          plug-vim-gitgutter.vim
> │          plugin-open-browser.vim
> │          plugin-tweetvim.vim
> │          plugin-vim-quickrun.vim
> │
> └─zsh
>         .zshrc
> ```


## webclipにあるか調べておく 

1. vimの読み込み
https://blog.tiqwab.com/2017/01/15/understand-vim-plugin-management.html
https://wakame.hatenablog.jp/entry/2014/09/05/085345#fn-e8293d7d

1. Lubuntuのaoutstartはシンボリックリンクで運用できない
https://udemy.benesse.co.jp/development/web/shellscript.html

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

### 参考
- https://eel3.hatenablog.com/entry/20161225/1482676689
- https://qiita.com/piroor/items/77233173707a0baa6360


## Obsidian 設定ファイル説明

以下のファイルは、Obsidianの各種設定に関連しています。

### app.json
アプリケーション全体の設定を管理するファイルです。ユーザーインターフェースや基本的な動作に関する設定が含まれています。

### appearance.json
テーマや配色、フォントなど、アプリの外観に関する設定を保存します。ユーザーが選んだスタイルが反映されます。

### backlink.json
バックリンクに関する設定を管理します。リンクの表示方法やスタイルをカスタマイズするためのオプションが設定されています。

### command-palette.json
コマンドパレットの設定を保存するファイルです。ユーザーがアクセスするコマンドやショートカットを管理します。

### community-plugins.json
コミュニティプラグインに関する設定ファイルです。インストールしたプラグインやその設定が含まれています。

### core-plugins.json
Obsidianのコアプラグインに関する設定を管理します。デフォルトで提供されるプラグインの有効化や無効化に関する情報が含まれています。

### core-plugins-migration.json
コアプラグインの移行に関する設定を管理します。過去のバージョンからの変更点を扱います。

### graph.json
グラフビューの設定を保存します。ノードの表示方法やレイアウトに関するオプションが含まれています。

### hotkeys.json
ホットキーの設定を管理するファイルです。ユーザーがカスタマイズしたショートカットキーの情報が格納されています。

### page-preview.json
ページプレビューの設定を管理します。プレビュー表示に関するオプションや設定が含まれています。

### switcher.json
スイッチャー機能の設定を保存するファイルです。ノート間の切り替えや表示スタイルに関する設定が含まれています。

### templates.json
テンプレートの設定を管理します。ユーザーが作成したテンプレートやその設定が含まれています。

### types.json
データ型に関する設定を管理します。特定のデータタイプやその扱いに関する情報が格納されています。

### workspace.json
ワークスペースの設定を管理します。開いているノートやレイアウトに関する情報が含まれています。

### zk-prefixer.json
Zettelkastenスタイルのプレフィックスに関する設定を管理します。ノートの命名規則や関連付けに影響します。


## memo tmux導入参考

https://dev.to/nexxeln/my-developer-workflow-using-wsl-tmux-and-neovim-55f5

https://gist.github.com/gocs/b69e689f03cf18fda219152e0e0ad422
