ソースコードとREADMEを双方向に繋ぐ仕組みの導入手順を、3つのフェーズに整理してまとめました。

---

## Phase 1: 基本の仕組みづくり（手動ベース）

まずは、コードからREADMEへジャンプできる土台を作ります。

### 1. リンクの命名規則（アンカー）の作成

README内の特定の場所に飛ぶために、HTMLのアンカータグを埋め込みます。

- **README側:**
  ```markdown
  ## Why use f.push_key_is? <a name="why-push-key"></a>

  ...ここに詳細な理由を書く...
  ```
- **ソースコード側:**
  ```lua
  -- [Why?](readmes/toc_nvim.md#why-push-key)
  f.push_key_is(...)
  ```

### 2. Neovimからジャンプするための設定

コメント内のファイルパスの上で `gx` を押すと、そのファイル（およびアンカー位置）を開く設定を `init.lua` に追加します。

```lua
vim.keymap.set("n", "gx", function()
  local file = vim.fn.expand("<cfile>")
  if file:match("^https?://") then
    vim.ui.open(file) -- URLならブラウザで開く
  else
    vim.cmd("edit " .. file) -- ローカルファイルならNeovimで開く
  end
end, { desc = "Open link under cursor" })
```

---

## Phase 2: 運用を楽にする（自動化・効率化）

毎回手動でパスを書くのは大変なので、自動化ツールを導入します。

### 3. スニペットで入力を高速化 (LuaSnip)

「特定のキーワード（`why`）」を打つだけで、リンクの型を自動入力します。

```lua
-- LuaSnipの設定に追加
ls.add_snippets("lua", {
  s("why", {
    t("-- [Why?](readmes/toc_nvim.md#"),
    i(1, "anchor_name"), -- ここにカーソルが止まる
    t(")"),
  }),
})
```

### 4. Comment.nvim との連携 (post_hook)

`Comment.nvim` でコメント化した瞬間に、READMEに貼り付けるためのリンクをクリップボードに自動コピーします。

```lua
require('Comment').setup({
    post_hook = function(ctx)
        local line_start = ctx.range.srow
        local line_content = vim.api.nvim_buf_get_lines(0, line_start - 1, line_start, false)[1]

        if line_content:match("WHY") then
            local file_path = vim.fn.expand("%:.")
            local link = string.format("[%s:%d](%s#L%d)", file_path, line_start, file_path, line_start)
            vim.fn.setreg('+', link) -- クリップボードへ
            print("README用のリンクをコピーしました！")
        end
    end,
})
```

---

## Phase 3: READMEからコードへの逆引き

### 5. Telescope でコードを検索

READMEを読んでいる時に、「このコードはどこだっけ？」となったら、単語検索でコードへ戻ります。

```lua
-- leader + fw でカーソル下の単語をプロジェクト全検索
vim.keymap.set("n", "<leader>fw", function()
  require('telescope.builtin').grep_string({ search = vim.fn.expand("<cword>") })
end)
```

---

### 導入後のワークフロー

1.  **書く:** コードに `-- WHY ...` と書き、`gcc` でコメントアウト。
2.  **貼る:** 自動コピーされたリンクをREADMEにペースト。
3.  **飛ぶ:**
    - コードからREADMEへ：`gx`
    - READMEからコードへ：`<leader>fw`

---

https://eiji.page/blog/neovim-mini-align/
上記を参考にmini-alignの説明をreadme/toc_neovimに作る

---

wezterm参考

- [tmuxのようにWezTermを扱う](https://zenn.dev/khasegawa/articles/a11ebfbabeabaa)
- [WezTermのworkspace管理の活用法](https://zenn.dev/neko_basu/articles/wezterm_workspace)

---

# 🛠️ HaLucina's Dotfiles

私のFedora環境を構築するための構成ファイル群です。
ASUS ROG Flow Z13に最適化されており、将来的にFramework Laptopへの移行も見据えています。

## 🌌 Philosophies

- **Privacy First:** Proton, Vivaldi, ONLYOFFICEなどを中心とした環境構築。
- **High Performance:** 動画編集(DaVinci Resolve)や開発に最適化。
- **Minimalist Aesthetics:** StarshipとWezTermによる、シンプルかつ機能的なプロンプト。

## 📑 Table of Contents (Directory Specific)

各コンポーネントの詳細な設定と説明については、以下のリンクを参照してください。

- [General Settings](./readmes/toc_general.md)
- [Editor (Neovim)](./readmes/toc_nvim.md)
- [Terminal (WezTerm/Starship)](./readmes/toc_terminal.md)
- [System (Keyd/Scripts)](./readmes/toc_system.md)

---

👉 **[Full Command List (AllKeyMap)](./readmes/toc_AllKeyMap.md)**
_このdotfilesで使用可能なすべてのカスタムコマンドとエイリアスの網羅リストです。_

## 🚀 Installation

```bash
git clone [https://github.com/HaLucina/dotfiles.git](https://github.com/HaLucina/dotfiles.git) ~/dotfiles
cd ~/dotfiles
./install.sh
```

ソースに基づき、パス内の `josean` を `my` に置換した上で、これまで挙げたものに加えて**ソースに含まれるすべてのプラグインを網羅した完全版**を作成します。

---

### 1. プラグイン管理・基盤

- **lazy.nvim**
  - **格納場所**: `lua/my/lazy.lua`
  - **機能と目的**: Neovimのプラグインマネージャー。すべてのプラグインのインストール、更新、および個別設定の管理を一括して行う。
  - **操作方法**: `:lazy` コマンドでUIを表示する。UI内では `I` でプラグインのインストール、`U` で更新、`Q` でUIを閉じる。
- **plenary.nvim**
  - **格納場所**: `lua/my/plugins/init.lua`
  - **機能と目的**: 多くのLuaプラグイン（Telescope, todo-comments, lazygitなど）が共通で利用するユーティリティライブラリ。

### 2. UI・外観改善

- **tokyonight**
  - **格納場所**: `lua/my/plugins/color-scheme.lua`
  - **機能と目的**: Neovimのメインカラースキーム。モダンで視認性の高いダークテーマを提供する。
- **nvim-tree.lua**
  - **格納場所**: `lua/my/plugins/nvim-tree.lua`
  - **機能と目的**: 高機能なファイルエクスプローラー。アイコン表示、相対行番号、Gitステータスの反映、ウィンドウ分割との連携が可能。
  - **操作方法**:
    - `Space e`: エクスプローラーの開閉（トグル）
    - `Space ef`: 現在開いているファイルの場所を起点にエクスプローラーを開く
    - `Space ec`: 展開されているすべてのフォルダを折りたたむ
    - `Space er`: エクスプローラーをリロードする
- **lualine.nvim**
  - **格納場所**: `lua/my/plugins/lualine.lua`
  - **機能と目的**: ステータスライン（画面最下部）の見た目を改善する。モード別の色変化や、プラグインの更新情報の表示などが可能。
- **bufferline.nvim**
  - **格納場所**: `lua/my/plugins/bufferline.lua`
  - **機能と目的**: 画面上部のタブバーの見た目を改善し、セパレーターの形状変更やアイコン表示を行う。
- **alpha.nvim**
  - **格納場所**: `lua/my/plugins/alpha.lua`
  - **機能と目的**: Neovim起動時に表示されるダッシュボード（グリーター）。最近開いたファイルへのアクセスや設定へのジャンプなどを提供する。
  - **操作方法**: ダッシュボード表示時に `q` でNeovimを終了する。
- **dressing.nvim**
  - **格納場所**: `lua/my/plugins/dressing.lua`
  - **機能と目的**: ファイル名変更時の入力ボックスや、LSPのコードアクション選択画面などのUIをモダンにする。
- **indent-blankline.nvim**
  - **格納場所**: `lua/my/plugins/indent-blankline.lua`
  - **機能と目的**: コードにインデントガイド（垂直線）を表示し、現在のスコープを視覚的に強調する。

### 3. 検索・ナビゲーション

- **telescope.nvim**
  - **格納場所**: `lua/my/plugins/telescope.lua`
  - **機能と目的**: 高性能なファジーファインダー。ファイル名、プロジェクト内の文字列、最近の履歴、TODOなどを高速に検索できる。
  - **操作方法**:
    - `Space ff`: プロジェクト内のファイル検索
    - `Space fs`: 全ファイル内の文字列検索
    - `Space fr`: 最近開いたファイルの履歴から検索
    - `Space fc`: カーソル下の単語を検索
    - `Space ft`: プロジェクト内のTODOコメントを検索
    - `Ctrl + j/k`: 候補の選択移動、`Enter`: ファイルを開く、`Ctrl + q`: QuickFixリストに送る
- **vim-tmux-navigator**
  - **格納場所**: `lua/my/plugins/init.lua`
  - **機能と目的**: Neovimの分割ウィンドウと、ターミナルマルチプレクサ `tmux` のペイン間を区別なく移動可能にする。
  - **操作方法**: `Ctrl + h/j/k/l` を使用して、上下左右のウィンドウ/ペインへ移動する。
- **which-key.nvim**
  - **格納場所**: `lua/my/plugins/which-key.lua`
  - **機能と目的**: リーダーキー（Space）などを押した後に、次に押せるキーとその説明をポップアップ表示する。
- **auto-session**
  - **格納場所**: `lua/my/plugins/auto-session.lua`
  - **機能と目的**: プロジェクトごとの編集状態（開いているファイルや分割）を自動保存・復元する。
  - **操作方法**: `Space ws` で現在のセッションを手動保存、`Space wr` で最新のセッションを復元する。

### 4. コーディング支援

- **nvim-treesitter**
  - **格納場所**: `lua/my/plugins/treesitter.lua`
  - **機能と目的**: 高度な構文解析により、正確なシンタックスハイライト、インデント、および増分選択機能を提供する。
  - **操作方法**: `Ctrl + Space` でノード単位の増分選択（押し続けると選択範囲が拡大する）。
- **nvim-cmp**
  - **格納場所**: `lua/my/plugins/nvim-cmp.lua`
  - **機能と目的**: 強力な自動補完エンジン。LSP、スニペット、バッファ、パスなどの情報を統合して候補を表示する。
  - **操作方法**: `Ctrl + j/k` で候補移動、`Enter` で確定、`Ctrl + Space` で手動表示、`Ctrl + e` で中止。
- **comment.nvim**
  - **格納場所**: `lua/my/plugins/comment.lua`
  - **機能と目的**: 行や選択範囲のコメントアウト/解除を簡単に行う。
  - **操作方法**: `gcc` で現在の行をコメント、`gc` + モーション（例：`gcG` で末尾まで）で範囲をコメントする。
- **nvim-surround**
  - **格納場所**: `lua/my/plugins/surround.lua`
  - **機能と目的**: 括弧、引用符、HTMLタグなどの周囲の記号を追加・削除・変更する。
  - **操作方法**: `ys` + モーション + 記号で追加、`ds` + 記号で削除、`cs` + 旧記号 + 新記号で変更。
- **nvim-autopairs**
  - **格納場所**: `lua/my/plugins/autopairs.lua`
  - **機能と目的**: 括弧や引用符を入力した際に、自動的に対応する閉じ記号を補完する。
- **substitute.nvim**
  - **格納場所**: `lua/my/plugins/substitute.lua`
  - **機能と目的**: ヤンク（コピー）した内容で、指定した範囲を素早く置換する。
  - **操作方法**: `s` + モーションで置換（例：`siw` で単語置換）、`S` で行末まで置換。
- **todo-comments.nvim**
  - **格納場所**: `lua/my/plugins/todo-comments.lua`
  - **機能と目的**: `TODO`, `HACK`, `BUG` などのコメントキーワードをハイライトし、一覧表示やジャンプを可能にする。
  - **操作方法**: `]t`/`[t` で次/前のTODOコメントへジャンプする。

### 5. LSP・診断・ツール

- **mason.nvim**
  - **格納場所**: `lua/my/plugins/lsp/mason.lua`
  - **機能と目的**: 言語サーバー（LSP）、フォーマッター、リンターを一括管理・インストールする。
  - **操作方法**: `:Mason` でUIを開き、`2`/`4`/`5`キーでカテゴリーを切り替えて `i` でインストールできる。
- **nvim-lspconfig**
  - **格納場所**: `lua/my/plugins/lsp/lspconfig.lua`
  - **機能と目的**: Neovimと各言語サーバーを接続・設定する中心的なプラグイン。
  - **操作方法**:
    - `gr`: 参照（利用箇所）をTelescopeで一覧表示
    - `gd`: 定義（宣言元）へジャンプ
    - `K`: 型情報などのドキュメントをホバー表示
    - `Space ca`: コードアクション（修正候補）を表示
    - `Space rn`: 変数や関数名をプロジェクト全体でリネーム
- **trouble.nvim**
  - **格納場所**: `lua/my/plugins/trouble.lua`
  - **機能と目的**: エラーや警告、TODOなどを画面下部に一覧表示し、プロジェクト全体の不具合を把握しやすくする。
  - **操作方法**: `Space xx` で表示、`Space xw` でプロジェクト全体の診断、`Space xt` でTODO一覧を表示する。
- **conform.nvim**
  - **格納場所**: `lua/my/plugins/formatting.lua`
  - **機能と目的**: コードの自動整形（フォーマット）を管理。保存時の自動整形にも対応。
  - **操作方法**: `Space mp` で現在または選択範囲のコードを整形する。
- **nvim-lint**
  - **格納場所**: `lua/my/plugins/linting.lua`
  - **機能と目的**: コードの静的解析（リンティング）を行い、構文エラーやスタイル違反を通知する。
  - **操作方法**: `Space l` で手動実行が可能。
- **vim-maximizer**
  - **格納場所**: `lua/my/plugins/vim-maximizer.lua`
  - **機能と目的**: ウィンドウを分割している状態で、特定のウィンドウを一時的に最大化（全画面表示）する。
  - **操作方法**: `Space sm` で最大化のトグルを切り替える。
- **mason-tool-installer.nvim**
  - **格納場所**: `lua/my/plugins/lsp/mason.lua`
  - **機能と目的**: Masonで管理しているツール（フォーマッターやリンター）を自動で一括インストールする。

### 6. Git連携

- **gitsigns.nvim**
  - **格納場所**: `lua/my/plugins/git-signs.lua`
  - **機能と目的**: エディタの端にGitの変更（追加、削除、変更）をサイン表示する。差分確認や変更の取り消しも行える。
  - **操作方法**:
    - `]h`/`[h`: 次/前の変更箇所（ハンク）へ移動
    - `Space hs`: 変更をステージング
    - `Space hr`: 変更を元に戻す
    - `Space hb`: 現在の行の変更者を表示（Git Blame）
    - `Space hd`: オリジナルとの差分を左右分割で表示
- **lazygit.nvim**
  - **格納場所**: `lua/my/plugins/lazygit.lua`
  - **機能と目的**: Neovim内で強力なGit用TUIツール `LazyGit` を呼び出す。
  - **操作方法**: `Space lg` でLazyGitのUIを開き、`a` でステージ、`c` でコミット、`q` で終了する。
