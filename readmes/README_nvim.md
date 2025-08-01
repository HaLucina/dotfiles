# File tree

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



### lazy.nvim (プラグインマネージャー)

-   目的: Neovimとエコシステムが進化したため、この更新されたセットアップガイドで、Neovimをゼロから素晴らしいものにするために使用されます。このプラグインマネージャーは、すべてのプラグインのインストールと設定に使用されます。
-   設定:
    -   lazyをブートストラップし、Neovimを開いたときにインストールされていない場合にインストールされるようにします。
    -   `require("lazy")`を呼び出し、`setup()`関数にプラグイン設定を保持するフォルダへのパス（`josean.plugins`）を渡します。
    -   `init.lua`ファイルに`require("josean.lazy")`を追加し、Neovimの起動時に`lazy.lua`ファイルがロードされるようにします。
-   操作:
    -   `:lazy`と入力し、`Enter`を押すとlazy.nvimのUIが開きます。
    -   不足しているプラグインをインストールするには、`大文字のI`を押します。
    -   UIを閉じるには、`Q`を押します。
    -   Neovimを再起動せずにプラグインをロードするには、`:lazy reload <プラグイン名>`と入力します。
    -   プラグインの変更を自動的に検出する機能を無効にするには、`lazy.lua`ファイルに`change_detection = { notify = false }`を追加します。
    -   ステータスラインで保留中のプラグイン更新の数を確認できます。

### plenary.nvim

-   目的: 多くの他のプラグインが利用するLuaプラグインです。
-   依存関係: Telescope、todo-comments、lazygit.nvimの依存関係として使用されます。

### vim-tmux-navigator

-   目的: Neovim内の分割画面とtmuxペイン間を簡単に移動できるようにします。
-   操作:
    -   `Ctrl + H`: 左のペインに移動します。
    -   `Ctrl + J`: 下のペインに移動します。
    -   `Ctrl + K`: 上のペインに移動します。
    -   `Ctrl + L`: 右のペインに移動します。

### tokyonight (カラースキーム)

-   目的: Neovimのカラースキームを設定します。
-   設定:
    -   他のプラグインより先にロードされるように`priorityを1000`に設定します。
    -   `config`フィールドに関数を渡し、その中で`vim.cmd("colorscheme TokyoNight")`を実行します。
    -   `style`を`Knight`に設定したり、`on_colors`フィールドを使用してカラースキームの色を修正したりできます。

### nvim-tree (ファイルエクスプローラー)

-   目的: Neovimの組み込みファイルエクスプローラーであるnetrwよりも優れたファイルエクスプローラーを提供します。
-   依存関係: ファイルアイコンを表示するために`nvim-web-devicons`が必要です。
-   設定:
    -   ファイルエクスプローラーのデフォルトの幅を設定します。
    -   相対行番号を表示します。
    -   フォルダが閉じているときと開いているときのアイコンを変更します。
    -   ウィンドウピッカーを無効にして、ウィンドウ分割とうまく連携するようにします。
    -   Gitによって無視されるファイルを表示するように`ignore`を`false`に設定します。
-   キーマップ (リーダーキー Space と E プレフィックス):
    -   `Space E`: nvim-treeをトグルします（開いたり閉じたりします）。
    -   `Space EF`: 現在のファイルがある場所でファイルエクスプローラーを開きます。
    -   `Space EC`: すべてを折りたたみます。
    -   `Space ER`: nvim-treeをリロードします。
-   ヘルプ: `colon H nvim-tree`と入力すると、設定可能なオプションの詳細が表示されます。

### which-key

-   目的: 設定で定義したキーマップを覚えやすくします。リーダーキーを押した後に使用可能なオプションを表示します。
-   遅延ロード: `VeryLazy`イベントを使用します。これは、初期UIにとって重要ではないため、後でロードされることをlazy.nvimに伝えます。
-   設定:
    -   `init`フィールドはNeovimの起動時に実行されます。
    -   `timeout`を`true`に、`timeoutlen`を`500ミリ秒`に設定します。これはwhich-keyがアクティブになるまでの待機時間です。
    -   `opts`フィールドでデフォルト設定を使用します。
-   操作: リーダーキー（`Space`）を押すと、500ミリ秒後にwhich-keyがアクティブになり、利用可能なオプションが表示されます。キーマップ定義に`description`フィールドを追加することが重要です。

### telescope (ファジーファインダー)

-   目的: プロジェクト全体でファイルやテキストを簡単に検索できるファジーファインダーです。右側にファイルプレビューが表示されます。
-   依存関係: `plenary`、`telescope-fzf-native`（ソートパフォーマンスを向上）、`nvim-web-devicons`（ファイルアイコン用）。
-   設定:
    -   `path_display`を`smart`に設定し、パスの表示方法を変更して、ファイル名が長い場合でも識別しやすくします。
    -   挿入モード時のキーマッピングを設定します。
    -   FCF拡張機能をロードしてソートパフォーマンスを向上させます。
-   キーマップ (リーダーキー Space と F プレフィックス - find の略):
    -   `Space FF`: プロジェクト内のファイルを検索します。
    -   `Space FS`: プロジェクト全体のテキストを検索します。
    -   `Space FR`: 最近開いたファイルを検索します。
    -   `Space FC`: カーソル下の現在の単語をプロジェクト全体で検索します。
    -   `Space FT`: プロジェクト内のTODOコメントを検索します (todo-comments.nvimとの統合)。
-   操作:
    -   `Ctrl + K`: 結果を上に移動します。
    -   `Ctrl + J`: 結果を下に移動します。
    -   `Ctrl + Q`: 選択した項目をQuickFixリストに送ります。
    -   `Enter`: 検索結果のファイルを開きます。
    -   `Ctrl + C`: Telescopeを閉じます。
    -   `Tab`: 特定の検索結果を選択/選択解除します。

### alpha.nvim (グリーター)

-   目的: Neovimの起動時に表示されるグリーター（ダッシュボード）を設定します。
-   遅延ロード: `VimEnter`イベントを使用し、Neovimの起動処理が完了した後にロードされます。
-   設定:
    -   `alpha`モジュールと`dashboard`テーマを要求します。
    -   ダッシュボードのヘッダーを設定します。
    -   `alpha.nvim`が表示されたときに使用できるキーマップを設定します。
    -   この特定のバッファでの折りたたみを無効にします。
-   操作:
    -   `Q`: Neovimを終了します。

### auto-session

-   目的: Neovimを閉じて特定のプロジェクトでの作業を停止した後でも、Neovimのセッションを簡単に復元できるようにします。セッションは定期的に自動保存されます。
-   設定:
    -   セッションを自動的に復元したくない場合は、`auto_restore_enabled`を`false`に設定します。
    -   無視したいディレクトリを指定できます。
-   キーマップ (リーダーキー Space と W プレフィックス - workspace の略):
    -   `Space WS`: 現在のセッションを手動で保存します。
    -   `Space WR`: セッションを復元します。
-   機能: 現在の作業ディレクトリごとに機能します。

### bufferline.nvim

-   目的: タブの見た目を改善します。
-   依存関係: `nvim-web-devicons`が必要です。
-   設定:
    -   `mode`を`tabs`に設定し、Neovimのデフォルトのタブ機能を保持します。
    -   `separator_style`を`slant`に設定します。

### lualine.nvim (ステータスライン)

-   目的: Neovimウィンドウの下部にあるステータスラインの見た目を改善します。
-   依存関係: `nvim-web-devicons`が必要です。
-   設定:
    -   カスタムカラーと`lualine`テーマを定義できます。
    -   テーマを`lualine.setup`に渡します。
    -   モード（ノーマル、インサート、ビジュアル、コマンドライン、置換）に応じて色が変わります。
    -   非アクティブな分割画面の設定も可能です。
-   lazy.nvimとの統合: ステータスラインに保留中のプラグイン更新の数を表示します。`lazy.status`モジュールを使用し、`section X`をカスタマイズします。

### dressing.nvim

-   目的: UIの改善に役立ちます。例えば、ファイルの名前変更時の入力ボックスの見た目を良くします。
-   遅延ロード: `VeryLazy`イベントを使用します。初期UIにとって重要ではないため、後でロードされます。
-   操作:
    -   ファイルエクスプローラーで`R`を押してファイル名を変更すると、入力ボックスの表示が変わります。
    -   LSPの修正に関するUIも改善されます。

### vim-maximizer

-   目的: 分割されたウィンドウを最大化できるようにします。
-   遅延ロード: 定義されたキーマップが実行されたときにロードされます。
-   キーマップ (リーダーキー Space と S プレフィックス - split の略):
    -   `Space SM`: 現在の分割ウィンドウを最大化します。
    -   `Space SM` (再度押す): 元のサイズに戻します。

### nvim-treesitter

-   目的: 優れた構文ハイライト、インデント、およびその他のクールな機能を提供します。構文ツリーにアクセスできます。
-   遅延ロード: `BufReadPre`と`BufNewFile`イベントを使用します。これは、既存のファイルを開くか新しいファイルを作成する場合にのみtreesitterが必要なためです。
-   ビルド: プラグインがインストールまたは更新されるたびに`TSUpdate`を実行します。これにより、言語パーサーも更新されます。
-   依存関係: `nvim-ts-autotag`（タグの自動閉じ機能用）。
-   設定:
    -   ファイルの構文ハイライトを有効にします。
    -   インデント動作を有効にします。
    -   `nvim-ts-autotag`プラグインによる自動タグ付けを有効にします。
    -   `ensure_installed`フィールドに、treesitterが自動的にインストールする言語パーサーのリストを追加します。これは、Web開発関連の言語（HTML、CSS、JavaScript、TypeScript、TSX、Vue、Svelte、Markdown）およびその他の言語（Bash、Lua、JSON、Yaml）をサポートします。
    -   `incremental_selection`を有効にし、そのためのキーマップを設定します。
-   操作:
    -   `:inspect tree`: 構文ツリーを表示し、カーソル移動に合わせて現在のノードをハイライトします。
    -   `Ctrl + Space`: ノードを選択し、再度押すとその親も選択するなど、増分選択を行います。
    -   自動タグ付け: H1タグなどを追加すると、自動的にタグが閉じられます。

### indent-blankline.nvim

-   目的: インデントガイドを追加します。
-   遅延ロード: オープンバッファのコンテキスト内で適用されるため、イベント（`BufEnter`、`BufNewFile`、`BufRead`など）で遅延ロードされます。
-   設定: インデントガイドに使用する特定の文字を指定します。Tree-sitterの助けを借りて、カーソルの現在のスコープもハイライトします。

### nvim-cmp (補完)

-   目的: Neovimで入力中に自動補完の候補を表示します。
-   遅延ロード: `InsertEnter`イベントでロードされます。これにより、挿入モードに入ったときにのみプラグインがロードされます。
-   依存関係:
    -   `cmp_buffer`: 現在のバッファ内のテキストに対する補完ソース。
    -   `cmp_path`: ファイルシステムパスに対する補完ソース。
    -   `LuaSnip`: スニペットエンジン。
    -   `cmp_luasnip`: `LuaSnip`用の補完ソース。
    -   `friendly-snippets`: さまざまな言語に役立つスニペットのセット。
    -   `lspkind.nvim`: VS Codeのようなピクトグラムを自動補完に表示するため。
    -   `cmp-nvim-lsp`: LSP機能との統合のため。
-   設定:
    -   `cmp`、`luasnip`、`lspkind`モジュールを要求します。
    -   `friendly-snippets`プラグインからスニペットをロードし、補完で利用できるようにします。
    -   `cmp.setup`を呼び出して`nvim-cmp`を構成し、補完の動作を設定します。
    -   `LuaSnip`をスニペットに使用するように設定します。
    -   補完メニューで使用できるキーマップのリストを追加します。
    -   補完ソースのリストを指定します（LSP、`LuaSnip`、現在のバッファからのテキスト、ファイルシステムパス）。これらを置く順序は優先順位を示します。
    -   `lspkind.nvim`を使用して、VS Codeのようなピクトグラムを設定します。
-   操作:
    -   `Ctrl + J`: 候補を下に移動します。
    -   `Ctrl + K`: 候補を上に移動します。
    -   `Ctrl + E`: 補完を中止します。
    -   `Ctrl + Space`: 補完メニューを開きます。
    -   `Enter`: 候補を選択します。
    -   `Ctrl + F`: プレビューを下にスクロールします。
    -   `Ctrl + B`: プレビューを上にスクロールします。

### nvim-autopairs

-   目的: 自動閉じペア機能（波括弧、角括弧、丸括弧、引用符）を追加します。
-   遅延ロード: 挿入モードに入ったときにロードされます。
-   依存関係: 自動補完と連携するために`nvim-cmp`を使用します。
-   設定:
    -   `nvim-autopairs`プラグインを要求し、`autopairs.setup`を呼び出します。
    -   Tree-sitterとの相互作用を設定します。
    -   `nvim-cmp`を要求し、`nvim-autopairs`と補完が連携するようにします。
-   操作:
    -   開き波括弧（`{`）を入力すると、自動的に閉じ波括弧（`}`）が追加されます。
    -   角括弧（`[]`）、丸括弧（`()`）、二重引用符（`""`）、単一引用符（`''`）でも同様に機能します。

### comment.nvim

-   目的: コードをコメントアウトする機能を提供します。
-   遅延ロード: 新しいバッファを開くか、既存のファイルのバッファを開いたときにロードされます。
-   依存関係: `nvim-ts-context-commentstring`（TSXおよびJSXコードを適切にコメントアウトするため）。
-   設定:
    -   `comment.nvim`プラグインと`nvim-ts-context-commentstring`の統合に必要なモジュールを要求します。
    -   `comment.setup`を呼び出してプラグインを構成し、`pre_hook`フィールドで`nvim-ts-context-commentstring`との統合を設定します。
-   操作:
    -   `GC`に続けてモーション（例: `G`でファイルの終わりまで、`2J`で2行下まで）を使用すると、コードがコメントアウトされます。
    -   `GCC`: 現在の行をコメントアウトします。

### todo-comments.nvim

-   目的: TODOコメントを管理します。特定のキーワード（TODO、HACK、BUG）をハイライトします。
-   遅延ロード: バッファのコンテキスト内で必要とされるため、イベントで遅延ロードされます。
-   依存関係: `plenary`が必要です。
-   設定: `todo_comments.setup`を呼び出してプラグインを構成します。
-   キーマップ (ノーマルモード):
    -   `]T`: 次の最も近いTODOコメントに移動します。
    -   `[T`: 前の最も近いTODOコメントに移動します。
-   Telescopeとの統合: `leader FT`キーマップを追加して、プロジェクト内のTODOコメントを検索します。
-   操作:
    -   `TODO:`、`HACK:`、`BUG:`などのキーワード（TODOはすべて大文字でコロンを続ける）を使用すると、プラグインによって認識され、ハイライトされます。
    -   `Space XT` (Troubleプラグイン) でプロジェクト内のTODOを表示することもできます。

### substitute.nvim

-   目的: テキストの置換を容易にします。Neovimの組み込みのSコマンドを上書きします。
-   遅延ロード: バッファ内にいるときにのみ必要とされるため、イベントでロードされます。
-   設定: プラグインを要求し、`setup`関数を呼び出して、キーマップを追加します。
-   キーマップ:
    -   `S`に続けてモーション（例: `IW`で単語内、`$`で行末まで、`G`でファイル末尾まで）を使用すると、そのモーションが移動するテキストを置換します。
    -   `大文字のS`: 行末まで置換します。
    -   ビジュアルモードでも使用できます。

### nvim-surround

-   目的: 周囲の記号（引用符、括弧、タグなど）を追加するのに役立ちます。
-   遅延ロード: 他のプラグインと同様のイベントでロードされます。
-   設定: `config`を`true`に設定すると、デフォルトで`lazy.nvim`がプラグインを要求し、`setup`関数を呼び出します。
-   操作:
    -   `YS` (You Surround) + モーション（例: `IW`）+ 周囲の文字（例: `"`）: テキストを囲みます。
    -   `DS` (Delete Surround) + 周囲の文字: 周囲の記号を削除します。
    -   `CS` (Change Surround) + 古い周囲の文字 + 新しい周囲の文字: 周囲の記号を変更します。
    -   `DST` (Delete Surround Tag): 周囲のタグを削除します。
    -   `YST` (You Surround Tag) + モーション + `T` + タグ名: 周囲のタグを追加します。
    -   `CST` (Change Surround Tag) + 古いタグ + 新しいタグ: タグを変更します。
-   機能: 波括弧、丸括弧、角括弧、二重引用符、単一引用符、タグなどの一般的な周囲の文字で機能します。

### mason.nvim

-   目的: 作業する言語のLSP機能（言語サーバー、リンター、フォーマッター）を有効にするために必要なものをインストールします。
-   依存関係:
    -   `mason-lspconfig.nvim`: 言語サーバーのインストールと設定を容易にします。
    -   `mason-tool-installer.nvim`: 言語サーバー以外のもの（リンターやフォーマッターなど）を自動的にインストールするのに役立ちます。
-   設定:
    -   UIの見た目を少し変更し、パッケージがインストール済み、保留中、アンインストール済みの場合の記号（チェックマーク、矢印、X）を設定します。
    -   `mason-lspconfig`を構成します。
    -   `ensure_installed`リストに、Masonが自動的にインストールする言語サーバーのリストを含めます。
-   操作:
    -   `:Mason`: Mason UIを開きます。
    -   `2`: 言語サーバーのみを表示します。
    -   `4`: 利用可能なリンターを表示します。
    -   `5`: 利用可能なフォーマッターを表示します。
    -   `I`: 手動でインストールします。
    -   `X`: インストールしたものを削除します。

### nvim-lspconfig (言語サーバープロトコル)

-   目的: 言語サーバーを構成するためのプラグインです。
-   遅延ロード: バッファ内にいるときにのみLSPが必要なため、イベントで遅延ロードされます。Masonの後に設定する必要があるため、これも重要です。
-   依存関係:
    -   `cmp-nvim-lsp`: 自動補完と言語サーバーを統合するため。
    -   `nvim-lsp-file-operations`: ファイル名が変更されたときにインポートを修正するなどの機能を追加します。
    -   `neodev.nvim`: Neovimの設定で作業しているときに、Lua言語サーバーのLSP機能を向上させます。
-   設定:
    -   `LSPAttach`イベントで自動的に実行されるロジック（autocmd）を設定し、LSPクライアントがバッファにアタッチされたときにのみ利用可能なキーマップを定義します。
    -   `cmp-nvim-lsp.default_capabilities`に`capabilities`変数を設定して自動補完を有効にします。
    -   サインカラムの診断シンボル（エラー、警告、ヒント、情報）を変更します。
    -   `MasonLSPconfig.setup_handlers`を使用して、言語サーバーを特定のデフォルト方法で自動的に構成します。
    -   特定の言語サーバー（Svelte、GraphQL、Emmet、Luaなど）のカスタム設定を追加できます。Lua言語サーバーがNeovim設定で作業しているときに`vim`グローバル変数を認識するように設定できます。
-   キーマップ (LSPクライアントがバッファにアタッチされている場合にのみ利用可能):
    -   `GR` (Go References): カーソル下のLSP参照をTelescopeで検索します。
    -   `GD` (Go Definition): 定義にジャンプします。
    -   `GT` (Go Type Definition): 型定義にジャンプします。
    -   `]D`: 次の診断エラーにジャンプします。
    -   `[D`: 前の診断エラーにジャンプします。
    -   `Space CA`: コードアクション（修正候補）を表示します。このUIはdressingプラグインによるものです。
    -   `Space RN`: 変数をスマートに名前変更します（ファイル内のすべてのインスタンスが変更されます）。
    -   `K`: カーソル下のドキュメントを表示します。
    -   `Space RS`: 言語サーバーを再起動します。
-   ファイル操作: `nvim-lsp-file-operations`プラグインのおかげで、ファイル名が変更されるとインポートが更新されます（例: `nvim-tree`で`R`を使用）。

### trouble.nvim

-   目的: LSPとの連携を非常に便利にするプラグインです。
-   遅延ロード: 特定のキーマップが実行されたときにロードされます。
-   依存関係: `nvim-web-devicons`、`todo-comments.nvim`。
-   キーマップ (リーダーキー Space と X プレフィックス):
    -   `Space XX`: trouble UIをトグルします。
    -   `Space XW`: プロジェクト全体のすべての診断（エラー、警告など）を表示します。
    -   `Space XD`: 現在のバッファの診断のみを表示します。
    -   `Space XT`: プロジェクトのTODOを表示します。

### conform.nvim (フォーマット)

-   目的: コードをフォーマットします。
-   遅延ロード: バッファ内で必要とされるため、ロード時に遅延ロードされます。
-   設定:
    -   `formatters_by_ft`フィールドを使用して、ファイルタイプごとに使用するフォーマッターを指定します（例: WebファイルタイプにはPrettier、LuaファイルにはStyLua、Pythonファイルにはisortとblack）。複数のフォーマッターがある場合、順序は重要です（isortが先に実行され、次にblack）。
    -   `format_on_save`機能を有効にし、いくつかのオプションを渡します。
-   キーマップ: `leader MP` (`Space MP`): 特定のテキスト範囲をフォーマットします。
-   インストール: フォーマッターは`mason.nvim`と`mason-tool-installer.nvim`を介してインストールされます。
-   機能: プロジェクトで使用している設定ファイル（例: `.stylua.toml`や`.prettierrc`）を尊重します。

### nvim-lint (リンティング)

-   目的: コードのリンティングを行います。
-   遅延ロード: バッファ内でロードされます。
-   設定:
    -   `linters_by_ft`フィールドに、ファイルタイプごとに使用するリンターを指定します（例: Web開発関連ファイルタイプにはESLint、PythonファイルにはPylint）。
    -   `autocmd`グループを作成し、`BufEnter`、`BufWritePost`、`InsertLeave`イベントでリンティング機能をトリガーするように設定します。
-   キーマップ: `leader L` (`Space L`): リンティングを手動でトリガーします。
-   インストール: リンターは`mason.nvim`と`mason-tool-installer.nvim`を介してインストールされます。
-   操作:
    -   リンティングエラーは、最大化された分割画面に診断として表示されます。
    -   `]D`: エラーを順に移動します。
    -   `Space XD` (Troubleプラグイン): 現在のドキュメントまたはバッファのリンティングエラーを表示できます。

### gitsigns.nvim

-   目的: Neovim内でGitと連携し、新しい行、削除された行、変更された行（ハンク）を表示します。
-   遅延ロード: バッファのコンテキスト内でのみ必要とされるため、ロードされます。
-   設定: この`gitsigns`プラグインと連携するためのキーマップが定義されています。
-   キーマップ (リーダーキー Space と H プレフィックス - hunk / Git の略):
    -   `]+H`: 次のGitハンクに移動します。
    -   `[+H`: 前のGitハンクに移動します。
    -   `Space HS`: 現在のハンクをステージングします。
    -   `Space HU`: 現在のハンクのステージングを解除します。
    -   `Space HR`: 現在のハンクをリセットします。
    -   `Space H+大文字のR`: バッファ全体の変更をリセットします。
    -   `Space H+大文字のS`: バッファ全体の変更をステージングします。
    -   `Space HB`: 現在の行のGit blame（変更者）を表示します。
    -   `Space H+大文字のB`: ホバーするたびに各行のGit blameを表示し始めます。
    -   `Space HD`: ファイルと元のファイルとの差分を新しい分割画面で表示します。
-   テキストオブジェクト: ハンクのテキストオブジェクトを設定することもできます。

### lazygit.nvim

-   目的: Neovim内でLazyGit (Git用のTUI) を使用できるようにします。
-   インストール: LazyGit自体は別途インストールする必要があります（例: Homebrewで`brew install jesseduffield/lazygit/lazygit`）。
-   遅延ロード: 特定のコマンドやキーマップが実行されたときにプラグインがロードされます。
-   依存関係: `plenary`。
-   キーマップ: `leader LG` (`Space LG`): `lazygit`コマンドを実行してUIを開きます。
-   操作:
    -   `A`: 変更をステージングまたはアンステージングします。
    -   `C`: コミットメッセージを書き込みます。
    -   `Q`: UIを閉じます。

**参考元:**
[How I Setup Neovim To Make It AMAZING in 2024: The Ultimate Guide - Josean Martinez](https://www.youtube.com/watch?v=JcE_F1nLqCg)
このYouTubeのURLは、提供されたソース内の動画タイトルとチャンネル名に基づき、外部情報として検索して追記しています。ご自身で内容を別途ご確認ください。
