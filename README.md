# 目的
1. WezTermを開き、yazi でプロジェクトフォルダへ。
2. プロジェクトを俯瞰し、ファイルを Neovim で開く。
3. コードを書く。fzf (fzf.vim や telescope.nvim) を使いファイルを高速に切り替える。Yazi をポップアップさせてファイルを探すのもOK。
4. 大掛かりなファイル整理（大量のコピーや移動）が必要になったら、WezTermの新しいタブ/ペインで yazi を開く。
5. Starship が常に「今どのブランチで作業中か」を教えてくれる。


その通りです！まさに**「nvim-tree.lua（というファイル）を削除して、yazi.nvim（というファイル）に置き換える」**というイメージで間違いありません。

これによって、エディタ専用の「サイドバー型エディタ」から、ターミナル環境と地続きの「ポップアップ型高性能ファイラー」へと進化します。

置き換えるにあたって、いくつか具体的に変わるポイントを整理しておきますね。

---

## 1. 「見た目」の変化：サイドバーからポップアップへ

`nvim-tree` は画面の左端に常駐するスタイルですが、`yazi.nvim` は必要なときだけ画面中央にバッと現れる**フローティングウィンドウ（ポップアップ）**スタイルが主流です。

* **nvim-tree:** 常にコードの横にディレクトリ構造が見えている。
* **yazi.nvim:** 普段はコード全画面。必要なときだけ Yazi を呼び出し、ファイルを選んだら消える。

---

## 2. 「設定ファイル」の書き換え

`lua/josean/plugins/yazi.lua` （名前はお好みで）というファイルを新しく作成し、以下のような設定を入れることになります。

```lua
return {
  "mikavilpas/yazi.nvim",
  event = "VeryLazy",
  keys = {
    -- nvim-treeの代わりに <leader>e でYaziを起動する設定
    {
      "<leader>e",
      mode = { "n", "v" },
      "<cmd>Yazi<cr>",
      desc = "Open yazi at the current file",
    },
  },
  opts = {
    -- フローティングウィンドウの設定など
    open_for_directories = true,
    keymaps = {
      show_help = '<f1>',
    },
  },
}

```

---

## 3. 「使い勝手」の劇的な向上

`nvim-tree` から `yazi.nvim` に変えることで、以下の「かゆいところ」に手が届くようになります。

* **画像プレビュー:** `nvim-tree` では難しかった画像のプレビューが、WezTerm + Yazi の組み合わせなら爆速で表示されます。
* **一貫した操作:** ターミナルで `yazi` と打った時と、Neovim内で `<leader>e` を押した時で、**全く同じ操作（`j`, `k` で移動、`enter` で開くなど）**が使えます。
* **バルクリネーム:** 複数のファイル名を一気に書き換える強力な機能が Neovim 内からそのまま使えます。

---


「WezTerm ⇔ Neovim シームレス移動」を実現するための最終的なソースコード一式をまとめました。

---

### 1. Neovim 側の設定

`lazy.nvim` の構成に合わせて、新しいプラグイン設定ファイルを作成します。

**ファイルパス:** `nvim/lua/my/plugins/smart-splits.lua`

```lua
return {
  'mrjones2014/smart-splits.nvim',
  lazy = false,
  config = function()
    local ss = require('smart-splits')
    ss.setup({
      -- WezTermの端に到達した時に、WezTermのペイン移動を発動させる設定
      at_edge = 'wrap', 
    })

    -- キーバインド設定 (Ctrl + hjkl)
    -- Neovim内ではウィンドウ移動、端ではWezTermへ移動
    vim.keymap.set('n', '<C-h>', ss.move_cursor_left)
    vim.keymap.set('n', '<C-j>', ss.move_cursor_down)
    vim.keymap.set('n', '<C-k>', ss.move_cursor_up)
    vim.keymap.set('n', '<C-l>', ss.move_cursor_right)
  end,
}

```

---

### 2. WezTerm 側の設定

既存の `keybinds.lua` の構造を活かし、判定ロジックを関数として外に切り出します。

**ファイルパス:** `wezterm/.config/wezterm/keybinds.lua`

```lua
local wezterm = require("wezterm")
local act = wezterm.action

-- ==========================================================
-- ヘルパー関数 (判定ロジック)
-- ==========================================================
local function is_vim(pane)
  -- Neovim側から渡される変数、またはプロセス名で判定
  return pane:get_user_vars().IS_NVIM == 'true' or
         pane:get_foreground_process_name():find('n?vim') ~= nil
end

local function split_nav(key, direction)
  return {
    key = key,
    mods = "CTRL",
    action = wezterm.action_callback(function(win, pane)
      if is_vim(pane) then
        -- Neovim実行中なら、Ctrl-hjklをそのまま送信（smart-splits.nvimが処理）
        win:perform_action(act.SendKey({ key = key, mods = "CTRL" }), pane)
      else
        -- それ以外（シェル等）なら、WezTermのペインを直接移動
        win:perform_action(act.ActivatePaneDirection(direction), pane)
      end
    end),
  }
end

-- ==========================================================
-- 1. モード定義 (KeyTable)
-- ==========================================================
local mode_definitions = {
  -- (copy_mode, resize_pane_mode, activate_pane_mode の内容は既存のまま)
  -- ※ 既存の activate_pane_mode は LEADER+a 用としてそのまま残せます
}

-- ==========================================================
-- 2. 通常のキーバインド (Workspace, Tab 等)
-- ==========================================================
local key_groups = {
  -- (workspace, tabs の内容は既存のまま)

  panes = {
    { key = "d", mods = "LEADER", action = act.SplitVertical({ domain = "CurrentPaneDomain" }) },
    { key = "r", mods = "LEADER", action = act.SplitHorizontal({ domain = "CurrentPaneDomain" }) },
    { key = "x", mods = "LEADER", action = act({ CloseCurrentPane = { confirm = true } }) },
    { key = "z", mods = "LEADER", action = act.TogglePaneZoomState },
    
    -- --- シームレス移動の登録 ---
    split_nav("h", "Left"),
    split_nav("j", "Down"),
    split_nav("k", "Up"),
    split_nav("l", "Right"),
  },

  -- (clipboard, system の内容は既存のまま)
}

-- ==========================================================
-- 3. データの自動展開
-- ==========================================================
local M = {}
M.keys = {}
M.key_tables = {}

for mode, group in pairs(mode_definitions) do
  table.insert(M.keys, group.trigger)
  M.key_tables[mode] = group.map
end

for _, single_group in pairs(key_groups) do
  for _, key_def in ipairs(single_group) do
    table.insert(M.keys, key_def)
  end
end

return M

```

---

### 3. 設定の反映と確認

1. **ファイルを保存**: 上記2つのファイルをそれぞれ保存します。
2. **WezTermを再起動**: または `Ctrl+Shift+R` で設定をリロードします。
3. **テスト**:
* WezTermのペインを左右に分割（`LEADER + r`）して、`Ctrl-h/l` で行き来できるか確認。
* 片方のペインで `nvim` を起動し、さらに `nvim` 内で `:vsplit` して分割。
* `Ctrl-l` を連打して、**「Neovim内のウィンドウ移動」から「WezTermの隣のペイン」へ勝手にフォーカスが移るか**を確認してください。


これで、あなたの綺麗なコード規約を保ったまま、最強の移動環境が整います！

もしリサイズ（`Alt-hjkl` など）も同様にシームレス化したい場合は、同じ `split_nav` の仕組みを応用できますので、いつでもお声がけください。

# First commands
```
curl -sL https://raw.githubusercontent.com/HaLucina/dotfiles/main/setup/install.sh | bash
```

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

```
 dotfiles  
├──  ahk  
│   └──  bin  
├──  bash  
│   └──  bin  
├──  chgkey  
├──  nvim  
│   └──  lua  
│       └──  my  
│           ├──  core  
│           └──  plugins  
├──  obsidian  
│   └──  plugins  
├──  openbox  
│   ├──  bk  
│   ├──  default  
│   └── 󱧼 src  
├──  vim  
│   ├──  autoload  
│   ├──  dein  
│   ├──  init  
│   ├──  plugged  
│   └──  plugins  
├──  wsl  
│   └──  bin  
└──  zsh  
```


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
- [Neovim Setup](readmes/nvim.md)

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



Note: 
- Why use `f.push_key_is`?
    1. This is for operations where I need to pass `Keys` as an argument.
    2. To achieve this, I'd normally have to write an anonymous function directly in the keymap command.
       example: `vim.keymap.set('n', 'j', function() myfunc('j') end)`
    3. Therefore, I created a wrapper function `push_key_is` to shorten and simplify this.

- Usage of `f.push_key_is`
    `f.push_key_is('Keys', f.myfunc)` is used when `f.myfunc` needs arguments (`Keys`).
    The `f` prefix indicates that `myfunc` is defined within the `functions.lua` module.



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

#### app.json
アプリケーション全体の設定を管理するファイルです。ユーザーインターフェースや基本的な動作に関する設定が含まれています。

#### appearance.json
テーマや配色、フォントなど、アプリの外観に関する設定を保存します。ユーザーが選んだスタイルが反映されます。

#### backlink.json
バックリンクに関する設定を管理します。リンクの表示方法やスタイルをカスタマイズするためのオプションが設定されています。

#### command-palette.json
コマンドパレットの設定を保存するファイルです。ユーザーがアクセスするコマンドやショートカットを管理します。

#### community-plugins.json
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
 vim
├──  autoload
│   └──  plug.vim
├──  dein
│   ├──  dein.toml
│   ├──  dein.vimrc
│   └──  deinSettings.vim
├──  init
│   ├──  basic-few-lines.vim
│   ├──  basic-one-line.vim
│   ├──  color.vim
│   ├──  hugoDict.txt
│   ├──  hugoThumbnailDict.txt
│   ├──  mapping.vim
│   ├──  mycommand.vim
│   └──  template-commands.vim
├──  init.vim
├──  plugged
│   ├──  bitly.vim
│   ├──  fern-git-status.vim
│   ├──  fern-renderer-nerdfont.vim
│   ├──  fern.vim
│   ├──  fzf
│   ├──  fzf.vim
│   ├──  gitv
│   ├──  glyph-palette.vim
│   ├──  nerdfont.vim
│   ├──  open-browser.vim
│   ├──  previm
│   ├──  sudo.vim
│   ├──  TweetVim
│   ├──  twibill.vim
│   ├──  unite-outline
│   ├──  unite.vim
│   ├──  vim-airline
│   ├──  vim-airline-themes
│   ├──  vim-code-dark
│   ├──  vim-fugitive
│   ├──  vim-gitgutter
│   ├──  vim-markdown
│   ├──  vim-quickrun
│   ├──  vim-table-mode
│   └──  webapi-vim
└──  plugins
    ├──  plug-fern.vim
    ├──  plug-fzf.vim
    ├──  plug-glyph-palette.vim
    ├──  plug-vim-airline.vim
    ├──  plug-vim-gitgutter.vim
    ├──  plugin-open-browser.vim
    ├──  plugin-tweetvim.vim
    └──  plugin-vim-quickrun.vim
```


<a id="wsl"></a>

## Windows Subsystem for Linux

```
 wsl
├──  bin
│   └──  open-settings-location.sh
├──  dircolors_no_bg
├──  dircolors_src
└──  settings.json
```

#### open-settings-location.sh
Purpose of the file: 
Modify `ls` color settings for WSL2 (Ubuntu).

Note: 
- 

Reference: 
- []()

#### dircolors_no_bg
Purpose of the file: 
Modify `ls` color settings for WSL2 (Ubuntu).

Note: 
- This file is symlinked from `$HOME/.dircolors`.
- Unlike the source file, this version is configured to prevent `ls` from displaying background colors for directory names when used in WSL.

Reference: 
- [WSLのターミナルの表示を良い感じにする](https://qiita.com/tomtwinkle/items/41c06f53e81186186e9d)



#### dircolors_src

Purpose of the file: 
Modify `ls` color settings for WSL2 (Ubuntu).

Note: 
- This file is symlinked from `$HOME/.dircolors`.
- Unlike the source file, this version is configured to prevent `ls` from displaying background colors for directory names when used in WSL.

Reference: 
- https://qiita.com/tomtwinkle/items/41c06f53e81186186e9d#%E5%8F%82%E8%80%83%E8%A8%98%E4%BA%8B

#### settings.json


<a id="zsh"></a>

## Z Shell

```
 zsh
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
