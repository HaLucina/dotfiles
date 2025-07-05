# TOC

1. [ahk](#ahk)
1. [bash](#bash)
1. [chgkey](#chgkey)
1. [nvim](#nvim)
1. [obsidian](#obsidian)
1. [openbox](#openbox)
1. [vim](#vim)
1. [wsl](#wsl)
1. [zsh](#zsh)

# Directory tree

 dotfiles
├──  [ahk](#ahk)
│   └──  bin
├──  [bash](#bash)
│   └──  bin
├──  [chgkey](#chgkey)
├──  [nvim](#nvim)
│   └──  lua
│       └──  my
│           ├──  core
│           └──  plugins
├──  [obsidian](#obsidian)
│   └──  plugins  
├──  [openbox](#openbox)
│   ├──  bk
│   ├──  default
│   └── 󱧼 src
├──  [vim](#vim)
│   ├──  autoload
│   ├──  dein
│   ├──  init
│   ├──  plugged
│   └──  plugins
├──  [wsl](#wsl)
│   └──  bin
└──  [zsh](#zsh)


<a id="ahk"></a>

## Auto Hot Key

```
 ahk
├──  bin
│   └──  Export-ahks-to-WindowsStartup.sh
├──  Keybind4Windows.ahk
└──  memo.md
```


<a id="bash"></a>

## Bash

```
 bash
└──  bin
    ├──  autostart.sh
    └──  hello
```


<a id="chgkey"></a>
<details><summary>

## Change Key

```
 chgkey
└──  chgkey.ini
```


<a id="nvim"></a>

## Neovim

```
 nvim
├──  init.lua
├──  lazy-lock.json
└──  lua
    └──  my
        ├──  core
        │   ├──  functions.lua
        │   ├──  highlights.lua
        │   ├──  ime.lua
        │   ├──  init.lua
        │   ├──  keymaps.lua
        │   └──  options.lua
        ├──  lazy.lua
        └──  plugins
```


<a id="obsidian"></a>

## Obsidian

```
 obsidian
├──  app.json
├──  appearance.json
├──  command-palette.json
├──  community-plugins.json
├──  core-plugins.json
├──  daily-notes.json
├──  hotkeys.json
├──  obsidian.vimrc
├──  plugins
│   ├──  calendar.data.json
│   ├──  dataview.data.json
│   ├──  homepage.data.json
│   ├──  obsidian-another-quick-switcher.data.json
│   ├──  obsidian-front-matter-title-plugin.data.json
│   ├──  obsidian-minimal-settings.data.json
│   ├──  obsidian-style-settings.data.json
│   ├──  table-editor-obsidian.data.json
│   └──  templater-obsidian.data.json
└──  zk-prefixer.json
```

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


<a id="openbox"></a>

## Openbox

```
 openbox
├──  applications.xml
├──  bk
│   ├──  bk-keys.xml
│   ├──  origin-lubuntu-rc.xml
│   ├──  rc-application.xml
│   └──  rc-key.xml
├──  create-rc.sh
├──  default
│   ├──  applications.xml
│   └──  keyboard.xml
├──  keyboard.xml
├──  lubuntu-rc.xml
└── 󱧼 src
    ├──  applications.xml
    └──  keyboard.xml
```


<a id="vim"></a>

## Vim

```
├──  vim
│   ├──  autoload
│   │   └──  plug.vim
│   ├──  dein
│   │   ├──  dein.toml
│   │   ├──  dein.vimrc
│   │   └──  deinSettings.vim
│   ├──  init
│   │   ├──  basic-few-lines.vim
│   │   ├──  basic-one-line.vim
│   │   ├──  color.vim
│   │   ├──  hugoDict.txt
│   │   ├──  hugoThumbnailDict.txt
│   │   ├──  mapping.vim
│   │   ├──  mycommand.vim
│   │   └──  template-commands.vim
│   ├──  init.vim
│   ├──  plugged
│   │   ├──  bitly.vim
│   │   ├──  fern-git-status.vim
│   │   ├──  fern-renderer-nerdfont.vim
│   │   ├──  fern.vim
│   │   ├──  fzf
│   │   ├──  fzf.vim
│   │   ├──  gitv
│   │   ├──  glyph-palette.vim
│   │   ├──  nerdfont.vim
│   │   ├──  open-browser.vim
│   │   ├──  previm
│   │   ├──  sudo.vim
│   │   ├──  TweetVim
│   │   ├──  twibill.vim
│   │   ├──  unite-outline
│   │   ├──  unite.vim
│   │   ├──  vim-airline
│   │   ├──  vim-airline-themes
│   │   ├──  vim-code-dark
│   │   ├──  vim-fugitive
│   │   ├──  vim-gitgutter
│   │   ├──  vim-markdown
│   │   ├──  vim-quickrun
│   │   ├──  vim-table-mode
│   │   └──  webapi-vim
│   └──  plugins
│       ├──  plug-fern.vim
│       ├──  plug-fzf.vim
│       ├──  plug-glyph-palette.vim
│       ├──  plug-vim-airline.vim
│       ├──  plug-vim-gitgutter.vim
│       ├──  plugin-open-browser.vim
│       ├──  plugin-tweetvim.vim
│       └──  plugin-vim-quickrun.vim
```


<a id="wsl"></a>

## Windows Subsystem for Linux

```
 wsl
├──  bin
│   └──  open-settings-location.sh
├──  dircolors_NoBgColorForDirnames
├──  dircolors_src
└──  settings.json
```


<a id="zsh"></a>

## Z Shell

```
└──  zsh
    ├──  cmd.shrc
    ├──  completion.shrc
    ├──  func.shrc
    ├──  helpers.shrc
    ├──  prompt.shrc
    ├──  rprompt.shrc
    ├──  zprofile
    ├──  zshenv
    └──  zshrc
```

---

## memo
https://dev.to/nexxeln/my-developer-workflow-using-wsl-tmux-and-neovim-55f5

https://gist.github.com/gocs/b69e689f03cf18fda219152e0e0ad422

## webclipにあるか調べておく 

1. vimの読み込み
https://blog.tiqwab.com/2017/01/15/understand-vim-plugin-management.html
https://wakame.hatenablog.jp/entry/2014/09/05/085345#fn-e8293d7d

1. Lubuntuのaoutstartはシンボリックリンクで運用できない
https://udemy.benesse.co.jp/development/web/shellscript.html

1. mkdirの複数の階層を一括作成
https://qiita.com/dev-sabatarou/items/c0a1cf81a8c7a0dfa04a

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



