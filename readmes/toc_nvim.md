# Neovim

## File Tree
<details>
    
```text
.
├── init.lua
├── lazy-lock.json
└── lua
    ├── err.md
    └── my
        ├── core
        │   ├── functions.lua
        │   ├── highlights.lua
        │   ├── ime.lua
        │   ├── init.lua
        │   ├── keymaps.lua
        │   └── options.lua
        ├── lazy.lua
        └── plugins
            ├── alpha.lua
            ├── auto-session.lua
            ├── autopairs.lua
            ├── bufferline.lua
            ├── colorscheme.lua
            ├── comment.lua
            ├── dressing.lua
            ├── formatting.lua
            ├── gitsigns.lua
            ├── indent-blankline.lua
            ├── init.lua
            ├── lazygit.lua
            ├── linting.lua
            ├── lsp
            │   └── mason.lua
            ├── lualine.lua
            ├── nvim-cmp.lua
            ├── nvim-tree.lua
            ├── surround.lua
            ├── telescope.lua
            ├── todo-comments.lua
            ├── treesitter.lua
            ├── trouble.lua
            ├── vim-maximizer.lua
            └── which-key.lua
```
</details>

## TOC

1. [Init.lua](#initlua)
  1. [bash](#bash)
1. [Core Directory](#core-directory)
  1. [bash](#bash)
1. [Plugins](#plugins-directory)
  1. [bash](#bash)
  1. [chgkey](#chgkey)
  1. [nvim](#nvim)
  1. [obsidian](#obsidian)
  1. [openbox](#openbox)
  1. [vim](#vim)
  1. [wsl](#wsl)
  1. [zsh](#zsh)

## Entry Points
#### init.nvim  
path:  
 - [nvim/init.lua](../nvim/init.lua)

目的と機能:  
 - Neovimの設定におけるエントリーポイント。具体的な設定は「Core」と「Plugins」の外部モジュールに分離して呼び出している。

設定:  
 - 仕様変更が無い限り`require`関数で以下の通り呼び出すだけ。
    ```lua
    require("my.core")
    require("my.lazy")
    ```
 
#### lazy.nvim  
path:  
 - [nvim/lua/my/lazy.lua](../nvim/lua/my/lazy.lua)

目的と機能:  
 - Neovimのプラグインマネージャー。プラグインのインストール、更新、個別設定の管理を一括して行う。

設定と操作:  
 - `:Lazy`と入力し、`Enter`を押すとlazy.nvimのUIが開く。
 - 不足しているプラグインをインストールするには、`大文字のI`を押す。
 - UIを閉じるには、`Q`を押します。
 - Neovimを再起動せずにプラグインをロードするには、`:Lazy reload <プラグイン名>`と入力。

---

## Core Directory
options.lua や keymaps.lua など、プラグインに依存しないエディタ自体の基本設定。

#### functions.lua  
path:  
 - [nvim/lua/my/lazy.lua](../nvim/lua/my/lazy.lua)

目的と機能:  
 - Neovimのプラグインマネージャー。プラグインのインストール、更新、個別設定の管理を一括して行う。

設定と操作:  
 - `:Lazy`と入力し、`Enter`を押すとlazy.nvimのUIが開く。
 - 不足しているプラグインをインストールするには、`大文字のI`を押す。
 - UIを閉じるには、`Q`を押します。
 - Neovimを再起動せずにプラグインをロードするには、`:Lazy reload <プラグイン名>`と入力。

#### highlights.lua  
path:  
 - [nvim/lua/my/lazy.lua](../nvim/lua/my/lazy.lua)

目的と機能:  
 - Neovimのプラグインマネージャー。プラグインのインストール、更新、個別設定の管理を一括して行う。

設定と操作:  
 - `:Lazy`と入力し、`Enter`を押すとlazy.nvimのUIが開く。
 - 不足しているプラグインをインストールするには、`大文字のI`を押す。
 - UIを閉じるには、`Q`を押します。
 - Neovimを再起動せずにプラグインをロードするには、`:Lazy reload <プラグイン名>`と入力。

#### ime.lua    
path:  
 - [nvim/lua/my/lazy.lua](../nvim/lua/my/lazy.lua)

目的と機能:  
 - Neovimのプラグインマネージャー。プラグインのインストール、更新、個別設定の管理を一括して行う。

設定と操作:  
 - `:Lazy`と入力し、`Enter`を押すとlazy.nvimのUIが開く。
 - 不足しているプラグインをインストールするには、`大文字のI`を押す。
 - UIを閉じるには、`Q`を押します。
 - Neovimを再起動せずにプラグインをロードするには、`:Lazy reload <プラグイン名>`と入力。

#### init.lua    
path:  
 - [nvim/lua/my/lazy.lua](../nvim/lua/my/lazy.lua)

目的と機能:  
 - Neovimのプラグインマネージャー。プラグインのインストール、更新、個別設定の管理を一括して行う。

設定と操作:  
 - `:Lazy`と入力し、`Enter`を押すとlazy.nvimのUIが開く。
 - 不足しているプラグインをインストールするには、`大文字のI`を押す。
 - UIを閉じるには、`Q`を押します。
 - Neovimを再起動せずにプラグインをロードするには、`:Lazy reload <プラグイン名>`と入力。

#### keymaps.lua  
path:  
 - [nvim/lua/my/lazy.lua](../nvim/lua/my/lazy.lua)

目的と機能:  
 - Neovimのプラグインマネージャー。プラグインのインストール、更新、個別設定の管理を一括して行う。

設定と操作:  
 - `:Lazy`と入力し、`Enter`を押すとlazy.nvimのUIが開く。
 - 不足しているプラグインをインストールするには、`大文字のI`を押す。
 - UIを閉じるには、`Q`を押します。
 - Neovimを再起動せずにプラグインをロードするには、`:Lazy reload <プラグイン名>`と入力。

#### options.lua  
path:  
 - [nvim/lua/my/lazy.lua](../nvim/lua/my/lazy.lua)

目的と機能:  
 - Neovimのプラグインマネージャー。プラグインのインストール、更新、個別設定の管理を一括して行う。

設定と操作:  
 - `:Lazy`と入力し、`Enter`を押すとlazy.nvimのUIが開く。
 - 不足しているプラグインをインストールするには、`大文字のI`を押す。
 - UIを閉じるには、`Q`を押します。
 - Neovimを再起動せずにプラグインをロードするには、`:Lazy reload <プラグイン名>`と入力。


## Plugins Directory
各プラグインごとの詳細設定。init.lua でこれらを一括読み込みする仕組み。

Note

- Why use `f.push_key_is`? <a name="keymap-lua"></a>
  1. This is for operations where I need to pass `Keys` as an argument.
  2. To achieve this, I'd normally have to write an anonymous function directly in the keymap command.
     example: `vim.keymap.set('n', 'j', function() myfunc('j') end)`
  3. Therefore, I created a wrapper function `push_key_is` to shorten and simplify this.

- Usage of `f.push_key_is`
  `f.push_key_is('Keys', f.myfunc)` is used when `f.myfunc` needs arguments (`Keys`).
  The `f` prefix indicates that `myfunc` is defined within the `functions.lua` module.

---

### 1. Plugin Management Platform


#### plenary.nvim
path:   
 - [lua/my/plugins/init.lua](lua/my/plugins/init.lua)

目的と機能:  
　- Luaプラグインが共通で利用するユーティリティライブラリ。利用しているプラグインは以下の通り。
  　- lazygit.nvim
  　- Telescope
  　- todo-comments

---

### 2. UI・外観改善

#### alpha.nvim
path:  
 - [lua/my/plugins/alpha.nvim](lua/my/plugins/alpha.nvim)

目的と機能:   
 - Neovimの起動時に表示されるグリーター（ダッシュボード）を設定します。
 
設定と操作:  
 - 遅延ロード: `VimEnter`イベントを使用し、Neovimの起動処理が完了した後にロードされます。
 - `alpha`モジュールと`dashboard`テーマを要求します。
 - ダッシュボードのヘッダーを設定します。
 - `alpha.nvim`が表示されたときに使用できるキーマップを設定します。
 - この特定のバッファでの折りたたみを無効にします。
 - `Q`: Neovimを終了します。


#### lualine.nvim
path:    
 - [lua/my/plugins/lualine.lua](lua/my/plugins/lualine.lua)

目的と機能:    
- Neovimウィンドウの下部にあるステータスラインの見た目を改善。

設定と操作:    
 - 依存関係: `nvim-web-devicons`が必要。
 - カスタムカラーと`lualine`テーマを定義できます。
 - テーマを`lualine.setup`に渡します。
 - モード（ノーマル、インサート、ビジュアル、コマンドライン、置換）に応じて色が変わります。
 - 非アクティブな分割画面の設定も可能です。
 - lazy.nvimとの統合: ステータスラインに保留中のプラグイン更新の数を表示します。`lazy.status`モジュールを使用し、`section X`をカスタマイズします。


#### smart-splits.lua
path:   
 - [nvim/lua/my/plugins/smart-splits.lua](nvim/lua/my/plugins/smart-splits.lua)

目的と機能:  
 - Neovim内の分割画面へ簡単に移動できるようする。
 - このプラグインにより「Neovim <-> WezTerm」の画面移動も出来るようにしている。

設定と操作:  
 - `Ctrl + H`: 左のペインに移動。
 - `Ctrl + J`: 下のペインに移動。
 - `Ctrl + K`: 上のペインに移動。
 - `Ctrl + L`: 右のペインに移動。


#### tokyonight (カラースキーム)
　- path:   [lua/josean/plugins/color-scheme.lua](lua/josean/plugins/color-scheme.lua)

目的と機能:  
 - Neovimのカラースキームを設定。ダークテーマにしたかっただけでオススメに出てきたこれを使ってみた。

設定と操作:  
 - 他のプラグインより先にロードされるように`priorityを1000`に設定。
 - `config`フィールドに関数を渡し、その中で`vim.cmd("colorscheme TokyoNight")`を実行。
 - `style`を`Knight`に設定したり、`on_colors`フィールドを使用してカラースキームの色を修正できる。

---

## 3. 検索・ナビゲーション

#### which-key
path:   
 - [lua/my/plugins/which-key.lua](lua/my/plugins/which-key.lua)

目的と機能:  
 - 設定で定義したキーマップ一覧を表示してくれる。例えばリーダーキー（Space）などを押した後に、次に押せるキーとその説明をポップアップ表示できる。

設定と操作:  
 - `init`フィールドはNeovimの起動時に実行。
 - 初期UIにとって重要ではないため遅延ロード`VeryLazy`使用後にロード。
 - `timeout`を`true`、`timeoutlen`を`500ミリ秒`に待機時間を設定。
 - キーマップ定義には`description`フィールドを追加が必要。
 - リーダーキー（`Space`）を押すとした画面に利用可能なオプションが表示される。


#### telescope
path:   
 - [lua/my/plugins/telescope.lua](lua/my/plugins/telescope.lua)

目的と機能:  
 - プロジェクト全体でファイルやテキストを簡単に検索できるファジーファインダーです。右側にファイルプレビューが表示されます。

設定と操作:  
 - 依存関係: `plenary`、`telescope-fzf-native`（ソートパフォーマンスを向上）、`nvim-web-devicons`（ファイルアイコン用）。
 - `path_display`を`smart`に設定し、パスの表示方法を変更して、ファイル名が長い場合でも識別しやすくします。
 - 挿入モード時のキーマッピングを設定します。
 - FCF拡張機能をロードしてソートパフォーマンスを向上させます。
 - `Space FS`: プロジェクト全体のテキストを検索します。
 - `Space FR`: 最近開いたファイルを検索します。
 - `Space FC`: カーソル下の現在の単語をプロジェクト全体で検索します。
 - `Space FT`: プロジェクト内のTODOコメントを検索します (todo-comments.nvimとの統合)。
 - `Ctrl + K`: 結果を上に移動します。
 - `Ctrl + J`: 結果を下に移動します。
 - `Ctrl + Q`: 選択した項目をQuickFixリストに送ります。
 - `Enter`: 検索結果のファイルを開きます。
 - `Ctrl + C`: Telescopeを閉じます。
 - `Tab`: 特定の検索結果を選択/選択解除します。
 - Telescopeでキーマップを出す

  ```vim
  :Telescope keymaps
  ```

そのまま `Ctrl + q` を叩く
（画面が閉じ、代わりに画面の一番下に「文字のリスト」が並びます。これが**Quickfix**に転送された状態です）

ファイルに書き出す

```vim
:cgetexpr getqflist()->map({_, v -> v.text}) | w keymaps.txt
```

もし頻繁にやりたいなら、`init.lua`（設定ファイル）に以下をコピペしておくと、`:SaveQuickfix` と打つだけで保存できるようになる。

```lua
-- Quickfixの中身をファイルに保存するコマンドを作る
vim.api.nvim_create_user_command('SaveQuickfix', function()
    local qflist = vim.fn.getqflist()
    local lines = {}
    for _, item in ipairs(qflist) do
        table.insert(lines, item.text)
    end
    vim.fn.writefile(lines, 'telescope_results.txt')
    print("Saved to telescope_results.txt")
end, {})
```

これなら、`Ctrl + q` のあとに `:SaveQuickfix` と打つだけで完了。



#### auto-session.lua

path:  
[lua/my/plugins/auto-session.lua](lua/my/plugins/auto-session.lua)

- 目的: Neovimを閉じて特定のプロジェクトでの作業を停止した後でも、Neovimのセッションを簡単に復元できるようにします。セッションは定期的に自動保存されます。
- 設定と操作:  
 - セッションを自動的に復元したくない場合は、`auto_restore_enabled`を`false`に設定します。
 - 無視したいディレクトリを指定できます。
- キーマップ (リーダーキー Space と W プレフィックス - workspace の略):
 - `Space WS`: 現在のセッションを手動で保存します。
 - `Space WR`: セッションを復元します。
- 機能: 現在の作業ディレクトリごとに機能します。


#### bufferline.nvim
path:  
 - [lua/my/plugins/bufferline.lua](lua/my/plugins/bufferline.lua)

目的と機能:    
 - タブの見た目を改善します。

設定と操作:  
 - 依存関係: `nvim-web-devicons`が必要です。
 - `mode`を`tabs`に設定し、Neovimのデフォルトのタブ機能を保持します。
 - `separator_style`を`slant`に設定します。


#### dressing.nvim
path:  
 - [lua/my/plugins/dressing.nvim](lua/my/plugins/dressing.nvim)
目的と機能:  
- UIの改善に役立ちます。例えば、ファイルの名前変更時の入力ボックスの見た目を良くします。
- 遅延ロード: `VeryLazy`イベントを使用します。初期UIにとって重要ではないため、後でロードされます。

設定と操作:    
 - ファイルエクスプローラーで`R`を押してファイル名を変更すると、入力ボックスの表示が変わります。
 - LSPの修正に関するUIも改善されます。

#### vim-maximizer
path:    
 - [lua/my/plugins/vim-maximizer.lua](lua/my/plugins/vim-maximizer.lua)

目的と機能:    
 - 分割されたウィンドウを最大化できるようにします。

設定と操作:    
 - 遅延ロード: 定義されたキーマップが実行されたときにロードされます。
 - `Space SM`: 現在の分割ウィンドウを最大化します。再度押せば元のサイズに戻す。


#### nvim-treesitter

path:  
 - [lua/my/plugins/nvim-treesitter.lua](lua/my/plugins/nvim-treesitter.lua)

目的と機能:    
 - 構文ハイライト、インデント他の機能を提供します。構文ツリーにアクセスできます。

設定と操作:  
 - 遅延ロード: `BufReadPre`と`BufNewFile`イベントを使用します。これは、既存のファイルを開くか新しいファイルを作成する場合にのみtreesitterが必要なためです。
 - ビルド: プラグインがインストールまたは更新されるたびに`TSUpdate`を実行します。これにより、言語パーサーも更新されます。
 - 依存関係: `nvim-ts-autotag`（タグの自動閉じ機能用）。
 - ファイルの構文ハイライトを有効にします。
 - インデント動作を有効にします。
 - `nvim-ts-autotag`プラグインによる自動タグ付けを有効にします。
 - `ensure_installed`フィールドに、treesitterが自動的にインストールする言語パーサーのリストを追加します。これは、Web開発関連の言語（HTML、CSS、JavaScript、TypeScript、TSX、Vue、Svelte、Markdown）およびその他の言語（Bash、Lua、JSON、Yaml）をサポートします。
 - `incremental_selection`を有効にし、そのためのキーマップを設定します。
 - `:inspect tree`: 構文ツリーを表示し、カーソル移動に合わせて現在のノードをハイライトします。
 - `Ctrl + Space`: ノードを選択し、再度押すとその親も選択するなど、増分選択を行います。
 - 自動タグ付け: H1タグなどを追加すると、自動的にタグが閉じられます。

#### indent-blankline.nvim
path:  
 - [lua/my/plugins/which-key.lua](lua/my/plugins/which-key.lua)

目的と機能:    
-  インデントガイドを追加します。
- 遅延ロード: オープンバッファのコンテキスト内で適用されるため、イベント（`BufEnter`、`BufNewFile`、`BufRead`など）で遅延ロードされます。
- 設定と操作:   インデントガイドに使用する特定の文字を指定します。Tree-sitterの助けを借りて、カーソルの現在のスコープもハイライトします。

#### nvim-cmp (補完)
path:    
 - [lua/my/plugins/nvim-cmp.lua](lua/my/plugins/nvim-cmp.lua)

目的:
- Neovimで入力中に自動補完の候補を表示します。
- 遅延ロード: `InsertEnter`イベントでロードされます。これにより、挿入モードに入ったときにのみプラグインがロードされます。

設定と操作:  
 - 依存関係:
 - `cmp_buffer`: 現在のバッファ内のテキストに対する補完ソース。
 - `cmp_path`: ファイルシステムパスに対する補完ソース。
 - `LuaSnip`: スニペットエンジン。
 - `cmp_luasnip`: `LuaSnip`用の補完ソース。
 - `friendly-snippets`: さまざまな言語に役立つスニペットのセット。
 - `lspkind.nvim`: VS Codeのようなピクトグラムを自動補完に表示するため。
 - `cmp-nvim-lsp`: LSP機能との統合のため。
 - `cmp`、`luasnip`、`lspkind`モジュールを要求します。
 - `friendly-snippets`プラグインからスニペットをロードし、補完で利用できるようにします。
 - `cmp.setup`を呼び出して`nvim-cmp`を構成し、補完の動作を設定します。
 - `LuaSnip`をスニペットに使用するように設定します。
 - 補完メニューで使用できるキーマップのリストを追加します。
 - 補完ソースのリストを指定します（LSP、`LuaSnip`、現在のバッファからのテキスト、ファイルシステムパス）。これらを置く順序は優先順位を示します。
 - `lspkind.nvim`を使用して、VS Codeのようなピクトグラムを設定します。
 - `Ctrl + J`: 候補を下に移動します。
 - `Ctrl + K`: 候補を上に移動します。
 - `Ctrl + E`: 補完を中止します。
 - `Ctrl + Space`: 補完メニューを開きます。
 - `Enter`: 候補を選択します。
 - `Ctrl + F`: プレビューを下にスクロールします。
 - `Ctrl + B`: プレビューを上にスクロールします。

#### nvim-autopairs

path:    
 - [lua/my/plugins/nvim-autopairs.lua](lua/my/plugins/nvim-autopairs.lua)

目的と機能:    
  ― 自動閉じペア機能（波括弧、角括弧、丸括弧、引用符）を追加します。

設定と操作:  
 - 遅延ロード: 挿入モードに入ったときにロードされます。
 - 依存関係: 自動補完と連携するために`nvim-cmp`を使用します。
 - `nvim-autopairs`プラグインを要求し、`autopairs.setup`を呼び出します。
 - Tree-sitterとの相互作用を設定します。
 - `nvim-cmp`を要求し、`nvim-autopairs`と補完が連携するようにします。
 - 開き波括弧（`{`）を入力すると、自動的に閉じ波括弧（`}`）が追加されます。
 - 角括弧（`[]`）、丸括弧（`()`）、二重引用符（`""`）、単一引用符（`''`）でも同様に機能します。

#### comment.nvim
path:  
 - [lua/my/plugins/which-key.lua](lua/my/plugins/which-key.lua)

目的と機能:    
 - コードをコメントアウトする機能を提供します。

設定と操作:  
- 遅延ロード: 新しいバッファを開くか、既存のファイルのバッファを開いたときにロードされます。
- 依存関係: `nvim-ts-context-commentstring`（TSXおよびJSXコードを適切にコメントアウトするため）。
 - `comment.nvim`プラグインと`nvim-ts-context-commentstring`の統合に必要なモジュールを要求します。
 - `comment.setup`を呼び出してプラグインを構成し、`pre_hook`フィールドで`nvim-ts-context-commentstring`との統合を設定します。
 - `GC`に続けてモーション（例: `G`でファイルの終わりまで、`2J`で2行下まで）を使用すると、コードがコメントアウトされます。
 - `GCC`: 現在の行をコメントアウトします。

#### todo-comments.nvim
path:  
 - [lua/my/plugins/which-key.lua](lua/my/plugins/which-key.lua)

目的と機能:    
- TODOコメントを管理します。特定のキーワード（TODO、HACK、BUG）をハイライトします。
- 遅延ロード: バッファのコンテキスト内で必要とされるため、イベントで遅延ロードされます。
- 依存関係: `plenary`が必要です。

設定と操作:  
 -  `todo_comments.setup`を呼び出してプラグインを構成します。
 - `]T`: 次の最も近いTODOコメントに移動します。
 - `[T`: 前の最も近いTODOコメントに移動します。
 - Telescopeとの統合: `leader FT`キーマップを追加して、プロジェクト内のTODOコメントを検索します。
 - `TODO:`、`HACK:`、`BUG:`などのキーワード（TODOはすべて大文字でコロンを続ける）を使用すると、プラグインによって認識され、ハイライトされます。
 - `Space XT` (Troubleプラグイン) でプロジェクト内のTODOを表示することもできます。

#### nvim-surround
path:  
 - [lua/my/plugins/which-key.lua](lua/my/plugins/which-key.lua)

目的と機能:    
 - 周囲の記号（引用符、括弧、タグなど）を追加するのに役立ちます。

設定と操作:  
 - 遅延ロード: 他のプラグインと同様のイベントでロードされます。
 - `config`を`true`に設定すると、デフォルトで`lazy.nvim`がプラグインを要求し、`setup`関数を呼び出します。
 - `YS` (You Surround) + モーション（例: `IW`）+ 周囲の文字（例: `"`）: テキストを囲みます。
 - `DS` (Delete Surround) + 周囲の文字: 周囲の記号を削除します。
 - `CS` (Change Surround) + 古い周囲の文字 + 新しい周囲の文字: 周囲の記号を変更します。
 - `DST` (Delete Surround Tag): 周囲のタグを削除します。
 - `YST` (You Surround Tag) + モーション + `T` + タグ名: 周囲のタグを追加します。
 - `CST` (Change Surround Tag) + 古いタグ + 新しいタグ: タグを変更します。
- 機能: 波括弧、丸括弧、角括弧、二重引用符、単一引用符、タグなどの一般的な周囲の文字で機能します。

#### mason.nvim
path:  
 - [lua/my/plugins/which-key.lua](lua/my/plugins/which-key.lua)

目的と機能:    
 - 作業する言語のLSP機能（言語サーバー、リンター、フォーマッター）を有効にするために必要なものをインストールします。

設定と操作:    
 - 依存関係:
 - `mason-lspconfig.nvim`: 言語サーバーのインストールと設定を容易にします。
 - `mason-tool-installer.nvim`: 言語サーバー以外のもの（リンターやフォーマッターなど）を自動的にインストールするのに役立ちます。
 - UIの見た目を少し変更し、パッケージがインストール済み、保留中、アンインストール済みの場合の記号（チェックマーク、矢印、X）を設定します。
 - `mason-lspconfig`を構成します。
 - `ensure_installed`リストに、Masonが自動的にインストールする言語サーバーのリストを含めます。
 - `:Mason`: Mason UIを開きます。
 - `2`: 言語サーバーのみを表示します。
 - `4`: 利用可能なリンターを表示します。
 - `5`: 利用可能なフォーマッターを表示します。
 - `I`: 手動でインストールします。
 - `X`: インストールしたものを削除します。

#### nvim-lspconfig (言語サーバープロトコル)
path:  
 - [lua/my/plugins/which-key.lua](lua/my/plugins/which-key.lua)

目的と機能:    
-  言語サーバーを構成するためのプラグインです。
- 設定と操作:  
- 遅延ロード: バッファ内にいるときにのみLSPが必要なため、イベントで遅延ロードされます。Masonの後に設定する必要があるため、これも重要です。
- 依存関係:
 - `cmp-nvim-lsp`: 自動補完と言語サーバーを統合するため。
 - `nvim-lsp-file-operations`: ファイル名が変更されたときにインポートを修正するなどの機能を追加します。
 - `neodev.nvim`: Neovimの設定で作業しているときに、Lua言語サーバーのLSP機能を向上させます。
 - `LSPAttach`イベントで自動的に実行されるロジック（autocmd）を設定し、LSPクライアントがバッファにアタッチされたときにのみ利用可能なキーマップを定義します。
 - `cmp-nvim-lsp.default_capabilities`に`capabilities`変数を設定して自動補完を有効にします。
 - サインカラムの診断シンボル（エラー、警告、ヒント、情報）を変更します。
 - `MasonLSPconfig.setup_handlers`を使用して、言語サーバーを特定のデフォルト方法で自動的に構成します。
 - 特定の言語サーバー（Svelte、GraphQL、Emmet、Luaなど）のカスタム設定を追加できます。Lua言語サーバーがNeovim設定で作業しているときに`vim`グローバル変数を認識するように設定できます。
- キーマップ (LSPクライアントがバッファにアタッチされている場合にのみ利用可能):
 - `GR` (Go References): カーソル下のLSP参照をTelescopeで検索します。
 - `GD` (Go Definition): 定義にジャンプします。
 - `GT` (Go Type Definition): 型定義にジャンプします。
 - `]D`: 次の診断エラーにジャンプします。
 - `[D`: 前の診断エラーにジャンプします。
 - `Space CA`: コードアクション（修正候補）を表示します。このUIはdressingプラグインによるものです。
 - `Space RN`: 変数をスマートに名前変更します（ファイル内のすべてのインスタンスが変更されます）。
 - `K`: カーソル下のドキュメントを表示します。
 - `Space RS`: 言語サーバーを再起動します。
- ファイル設定と操作:   `nvim-lsp-file-operations`プラグインのおかげで、ファイル名が変更されるとインポートが更新されます（例: `nvim-tree`で`R`を使用）。

#### trouble.nvim
path:  
 - [lua/my/plugins/which-key.lua](lua/my/plugins/which-key.lua)

目的: 
 - LSPとの連携を非常に便利にするプラグインです。

設定と操作:    
- 遅延ロード: 特定のキーマップが実行されたときにロードされます。
- 依存関係: `nvim-web-devicons`、`todo-comments.nvim`。
- キーマップ (リーダーキー Space と X プレフィックス):
 - `Space XX`: trouble UIをトグルします。
 - `Space XW`: プロジェクト全体のすべての診断（エラー、警告など）を表示します。
 - `Space XD`: 現在のバッファの診断のみを表示します。
 - `Space XT`: プロジェクトのTODOを表示します。

#### nvim-lint (リンティング)
path:  
 - [lua/my/plugins/which-key.lua](lua/my/plugins/which-key.lua)

目的と機能:     
 - コードのリンティングを行います。

設定と操作:  
- 遅延ロード: バッファ内でロードされます。
 - `linters_by_ft`フィールドに、ファイルタイプごとに使用するリンターを指定します（例: Web開発関連ファイルタイプにはESLint、PythonファイルにはPylint）。
 - `autocmd`グループを作成し、`BufEnter`、`BufWritePost`、`InsertLeave`イベントでリンティング機能をトリガーするように設定します。
- キーマップ: `leader L` (`Space L`): リンティングを手動でトリガーします。
- インストール: リンターは`mason.nvim`と`mason-tool-installer.nvim`を介してインストールされます。
- 設定と操作:  
 - リンティングエラーは、最大化された分割画面に診断として表示されます。
 - `]D`: エラーを順に移動します。
 - `Space XD` (Troubleプラグイン): 現在のドキュメントまたはバッファのリンティングエラーを表示できます。

#### gitsigns.nvim
path:  
 - [lua/my/plugins/gitsigns.lua](lua/my/plugins/gitsigns.lua)

目的と機能:    
 - Neovim内でGitと連携し、新しい行、削除された行、変更された行（ハンク）を表示します。

設定と操作:   
 - この`gitsigns`プラグインと連携するためのキーマップが定義されています。
 - キーマップ (リーダーキー Space と H プレフィックス - hunk / Git の略):
 - 遅延ロード: バッファのコンテキスト内でのみ必要とされるため、ロードされます。
 - `]+H`: 次のGitハンクに移動します。
 - `[+H`: 前のGitハンクに移動します。
 - `Space HS`: 現在のハンクをステージングします。
 - `Space HU`: 現在のハンクのステージングを解除します。
 - `Space HR`: 現在のハンクをリセットします。
 - `Space H+大文字のR`: バッファ全体の変更をリセットします。
 - `Space H+大文字のS`: バッファ全体の変更をステージングします。
 - `Space HB`: 現在の行のGit blame（変更者）を表示します。
 - `Space H+大文字のB`: ホバーするたびに各行のGit blameを表示し始めます。
 - `Space HD`: ファイルと元のファイルとの差分を新しい分割画面で表示します。
 - テキストオブジェクト: ハンクのテキストオブジェクトを設定することもできます。

#### lazygit.nvim
path:  
[lua/my/plugins/lazygit.lua](lua/my/plugins/lazygit.lua)

目的と機能:    
 - Neovim内でLazyGit (Git用のTUI) を使用できるようにします。
 - LazyGit自体は別途インストールする必要があります（例: Homebrewで`brew install jesseduffield/lazygit/lazygit`）。

設定と操作:  
 - 遅延ロード: 特定のコマンドやキーマップが実行されたときにプラグインがロードされます。
 - 依存関係: `plenary`。
 - `leader LG` (`Space LG`): `lazygit`コマンドを実行してUIを開きます。
 - `A`: 変更をステージングまたはアンステージングします。
 - `C`: コミットメッセージを書き込みます。
 - `Q`: UIを閉じます。

---

## Reference
[How I Setup Neovim To Make It AMAZING in 2024: The Ultimate Guide - Josean Martinez](https://www.youtube.com/watch?v=JcE_F1nLqCg)
