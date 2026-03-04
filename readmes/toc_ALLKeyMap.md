提供されたすべてのソースコードを詳細に解析し、Neovimのキーバインド設定を一切の省略なしで網羅しました。ご指定の通り、「備考」欄を「設定ファイル」に変更し、各ファイルへのリンク形式でまとめています。

---

## ⌨️ Neovim キーマップ完全設定ガイド

Neovim内で定義されているすべてのキーバインドです。Leaderキーは **`Space`** に設定されています。

### 1. 基本操作・高度な編集 (Core Layer)
標準的なVim操作を強化し、ホームポジションでの効率を最大化しています。

| モード | キー | 機能 | 設定ファイル |
| :--- | :--- | :--- | :--- |
| Normal | **`<Leader>` + `<Esc>`** | 検索ハイライトとコマンドラインの消去 | [keymaps.lua](dotfiles/nvim/.config/nvim/lua/my/core/keymaps.lua) |
| Insert | **`jj`** | インサートモードを抜ける | [keymaps.lua](dotfiles/nvim/.config/nvim/lua/my/core/keymaps.lua) |
| N / V | **`H`** | 行頭 (`0`) へ移動 | [keymaps.lua](dotfiles/nvim/.config/nvim/lua/my/core/keymaps.lua) |
| N / V | **`L`** | 行末 (`$`) へ移動 | [keymaps.lua](dotfiles/nvim/.config/nvim/lua/my/core/keymaps.lua) |
| N / V | **`J`** | 半ページ分スクロールダウン | [keymaps.lua](dotfiles/nvim/.config/nvim/lua/my/core/keymaps.lua) |
| N / V | **`K`** | 半ページ分スクロールアップ | [keymaps.lua](dotfiles/nvim/.config/nvim/lua/my/core/keymaps.lua) |
| Normal | **`j`** | 表示行単位での移動 (`gj`) | [keymaps.lua](dotfiles/nvim/.config/nvim/lua/my/core/keymaps.lua) |
| Normal | **`k`** | 表示行単位での移動 (`gk`) | [keymaps.lua](dotfiles/nvim/.config/nvim/lua/my/core/keymaps.lua) |
| Normal | **`o`** | 下に空行を挿入してNormalモード維持 | [keymaps.lua](dotfiles/nvim/.config/nvim/lua/my/core/keymaps.lua) |
| Normal | **`O`** | 上に空行を挿入してNormalモード維持 | [keymaps.lua](dotfiles/nvim/.config/nvim/lua/my/core/keymaps.lua) |
| N / V | **`gf`** | 垂直分割でファイルを開く (`vgF`) | [keymaps.lua](dotfiles/nvim/.config/nvim/lua/my/core/keymaps.lua) |
| N / V | **`c`** | ヤンクなしで変更 (ブラックホールレジスタ) | [keymaps.lua](dotfiles/nvim/.config/nvim/lua/my/core/keymaps.lua) |
| N / V | **`x`** | ヤンクなしで削除 (ブラックホールレジスタ) | [keymaps.lua](dotfiles/nvim/.config/nvim/lua/my/core/keymaps.lua) |
| N / V | **`s`** | デフォルトの 's' コマンドを無効化 | [keymaps.lua](dotfiles/nvim/.config/nvim/lua/my/core/keymaps.lua) |
| N / V | **`S`** | デフォルトの 'S' コマンドを無効化 | [keymaps.lua](dotfiles/nvim/.config/nvim/lua/my/core/keymaps.lua) |
| Normal | **`so`** | 現在の設定ファイルを再読み込み | [keymaps.lua](dotfiles/nvim/.config/nvim/lua/my/core/keymaps.lua) |
| N / V | **`sf`** | カーソル下のテキストをハイライト | [keymaps.lua](dotfiles/nvim/.config/nvim/lua/my/core/keymaps.lua) |
| N / V | **`ss`** | コマンドラインで置換コマンドを開始 | [keymaps.lua](dotfiles/nvim/.config/nvim/lua/my/core/keymaps.lua) |
| N / V | **`p`** | 改行コード(LF)を強制してペースト | [keymaps.lua](dotfiles/nvim/.config/nvim/lua/my/core/keymaps.lua) |
| N / V | **`P`** | 改行コード(LF)を強制して前方ペースト | [keymaps.lua](dotfiles/nvim/.config/nvim/lua/my/core/keymaps.lua) |
| Normal | **`<C-j>`** | 現在の行を下に移動 | [keymaps.lua](dotfiles/nvim/.config/nvim/lua/my/core/keymaps.lua) |
| Normal | **`<C-k>`** | 現在の行を上に移動 | [keymaps.lua](dotfiles/nvim/.config/nvim/lua/my/core/keymaps.lua) |
| Visual | **`<C-j>`** | 選択範囲を下に移動 | [keymaps.lua](dotfiles/nvim/.config/nvim/lua/my/core/keymaps.lua) |
| Visual | **`<C-k>`** | 選択範囲を上に移動 | [keymaps.lua](dotfiles/nvim/.config/nvim/lua/my/core/keymaps.lua) |
| Normal | **`<Leader>z`** | 半ページスクロールアップして中央表示 | [keymaps.lua](dotfiles/nvim/.config/nvim/lua/my/core/keymaps.lua) |
| Cmdline | **`<C-k>`** | 履歴を上に遡る | [keymaps.lua](dotfiles/nvim/.config/nvim/lua/my/core/keymaps.lua) |
| Cmdline | **`<C-j>`** | 履歴を下に遡る | [keymaps.lua](dotfiles/nvim/.config/nvim/lua/my/core/keymaps.lua) |
| Cmdline | **`<C-h>`** | カーソルを左へ移動 | [keymaps.lua](dotfiles/nvim/.config/nvim/lua/my/core/keymaps.lua) |
| Cmdline | **`<C-l>`** | カーソルを右へ移動 | [keymaps.lua](dotfiles/nvim/.config/nvim/lua/my/core/keymaps.lua) |
| Cmdline | **`<C-a>`** | カーソルを行頭へ移動 | [keymaps.lua](dotfiles/nvim/.config/nvim/lua/my/core/keymaps.lua) |
| Cmdline | **`<C-e>`** | カーソルを行末へ移動 | [keymaps.lua](dotfiles/nvim/.config/nvim/lua/my/core/keymaps.lua) |
| C / I | **`<C-d>`** | 前方の1文字を削除 (Delete) | [keymaps.lua](dotfiles/nvim/.config/nvim/lua/my/core/keymaps.lua) |
| C / I | **`<C-h>`** | 後方の1文字を削除 (Backspace) | [keymaps.lua](dotfiles/nvim/.config/nvim/lua/my/core/keymaps.lua) |

### 2. ウィンドウ・タブ管理 (Window & Tab)
`s` (Split/Size/Screen) を起点とした直感的な管理操作です。

| キー | 機能 | 設定ファイル |
| :--- | :--- | :--- |
| **`sv`** | ウィンドウを垂直分割 | [keymaps.lua](dotfiles/nvim/.config/nvim/lua/my/core/keymaps.lua) |
| **`sh`** | ウィンドウを水平分割 | [keymaps.lua](dotfiles/nvim/.config/nvim/lua/my/core/keymaps.lua) |
| **`se`** | すべてのウィンドウサイズを均等化 | [keymaps.lua](dotfiles/nvim/.config/nvim/lua/my/core/keymaps.lua) |
| **`sc`** | 現在のウィンドウを閉じる | [keymaps.lua](dotfiles/nvim/.config/nvim/lua/my/core/keymaps.lua) |
| **`st`** | 新しい空のタブを開く | [keymaps.lua](dotfiles/nvim/.config/nvim/lua/my/core/keymaps.lua) |
| **`sw`** | 現在のタブを閉じる | [keymaps.lua](dotfiles/nvim/.config/nvim/lua/my/core/keymaps.lua) |
| **`sn`** | 次のタブへ移動 | [keymaps.lua](dotfiles/nvim/.config/nvim/lua/my/core/keymaps.lua) |
| **`sp`** | 前のタブへ移動 | [keymaps.lua](dotfiles/nvim/.config/nvim/lua/my/core/keymaps.lua) |
| **`sN`** | 現在のファイルを新しいタブで開く | [keymaps.lua](dotfiles/nvim/.config/nvim/lua/my/core/keymaps.lua) |
| **`sm`** | 分割ウィンドウの最大化切り替え | [vim-maximizer.lua](dotfiles/nvim/.config/nvim/lua/my/plugins/vim-maximizer.lua) |

### 3. ナビゲーション・ファイル検索 (Fuzzy Find & Explorer)
プロジェクト内の移動を高速化するプラグイン群の設定です。

| モード | キー | 機能 | 設定ファイル |
| :--- | :--- | :--- | :--- |
| Normal | **`ee`** | ファイルエクスプローラーの切り替え | [nvim-tree.lua](dotfiles/nvim/.config/nvim/lua/my/plugins/nvim-tree.lua) |
| Normal | **`ef`** | 現在のファイルをエクスプローラーで表示 | [nvim-tree.lua](dotfiles/nvim/.config/nvim/lua/my/plugins/nvim-tree.lua) |
| Normal | **`ec`** | エクスプローラーの全ノードを閉じる | [nvim-tree.lua](dotfiles/nvim/.config/nvim/lua/my/plugins/nvim-tree.lua) |
| Normal | **`er`** | エクスプローラーの表示内容を更新 | [nvim-tree.lua](dotfiles/nvim/.config/nvim/lua/my/plugins/nvim-tree.lua) |
| Normal | **`ff`** | プロジェクト内のファイルを検索 | [telescope.lua](dotfiles/nvim/.config/nvim/lua/my/plugins/telescope.lua) |
| Normal | **`fr`** | 最近開いたファイル(oldfiles)を検索 | [telescope.lua](dotfiles/nvim/.config/nvim/lua/my/plugins/telescope.lua) |
| Normal | **`fs`** | プロジェクト内全文検索 (live_grep) | [telescope.lua](dotfiles/nvim/.config/nvim/lua/my/plugins/telescope.lua) |
| Normal | **`fc`** | カーソル下の単語をプロジェクト内検索 | [telescope.lua](dotfiles/nvim/.config/nvim/lua/my/plugins/telescope.lua) |
| Normal | **`ft`** | TODOコメントを検索 | [telescope.lua](dotfiles/nvim/.config/nvim/lua/my/plugins/telescope.lua) |
| Insert | **`<C-k>`** | Telescope: 前の候補を選択 | [telescope.lua](dotfiles/nvim/.config/nvim/lua/my/plugins/telescope.lua) |
| Insert | **`<C-j>`** | Telescope: 次の候補を選択 | [telescope.lua](dotfiles/nvim/.config/nvim/lua/my/plugins/telescope.lua) |
| Insert | **`<C-q>`** | Telescope: 選択候補をQuickfixへ送る | [telescope.lua](dotfiles/nvim/.config/nvim/lua/my/plugins/telescope.lua) |
| N / X / O | **`m`** | Flashジャンプ | [flash.lua](dotfiles/nvim/.config/nvim/lua/my/plugins/flash.lua) |
| N / X / O | **`M`** | Flash Treesitterジャンプ | [flash.lua](dotfiles/nvim/.config/nvim/lua/my/plugins/flash.lua) |
| Operator | **`r`** | Remote Flashジャンプ | [flash.lua](dotfiles/nvim/.config/nvim/lua/my/plugins/flash.lua) |
| O / X | **`R`** | Treesitter 検索 | [flash.lua](dotfiles/nvim/.config/nvim/lua/my/plugins/flash.lua) |
| Cmdline | **`<C-s>`** | Flash検索のトグル | [flash.lua](dotfiles/nvim/.config/nvim/lua/my/plugins/flash.lua) |

### 4. Git 連携 (Git Integration)
Git操作をエディタから離れずに行うためのバインドです。

| モード | キー | 機能 | 設定ファイル |
| :--- | :--- | :--- | :--- |
| Normal | **`lg`** | LazyGit を起動 | [lazygit.lua](dotfiles/nvim/.config/nvim/lua/my/plugins/lazygit.lua) |
| Normal | **`]h`** | 次のGit変更箇所(Hunk)へ移動 | [gitsigns.lua](dotfiles/nvim/.config/nvim/lua/my/plugins/gitsigns.lua) |
| Normal | **`[h`** | 前のGit変更箇所(Hunk)へ移動 | [gitsigns.lua](dotfiles/nvim/.config/nvim/lua/my/plugins/gitsigns.lua) |
| Normal | **`hs`** | 現在のHunkをステージする | [gitsigns.lua](dotfiles/nvim/.config/nvim/lua/my/plugins/gitsigns.lua) |
| Normal | **`hr`** | 現在のHunkをリセットする | [gitsigns.lua](dotfiles/nvim/.config/nvim/lua/my/plugins/gitsigns.lua) |
| Visual | **`hs`** | 選択範囲のHunkをステージする | [gitsigns.lua](dotfiles/nvim/.config/nvim/lua/my/plugins/gitsigns.lua) |
| Visual | **`hr`** | 選択範囲のHunkをリセットする | [gitsigns.lua](dotfiles/nvim/.config/nvim/lua/my/plugins/gitsigns.lua) |
| Normal | **`hS`** | バッファ内の全変更をステージする | [gitsigns.lua](dotfiles/nvim/.config/nvim/lua/my/plugins/gitsigns.lua) |
| Normal | **`hR`** | バッファ内の全変更をリセットする | [gitsigns.lua](dotfiles/nvim/.config/nvim/lua/my/plugins/gitsigns.lua) |
| Normal | **`hu`** | ステージしたHunkを取り消す | [gitsigns.lua](dotfiles/nvim/.config/nvim/lua/my/plugins/gitsigns.lua) |
| Normal | **`hp`** | Hunkの変更内容をプレビュー表示 | [gitsigns.lua](dotfiles/nvim/.config/nvim/lua/my/plugins/gitsigns.lua) |
| Normal | **`hb`** | 詳細なGit Blameを表示 | [gitsigns.lua](dotfiles/nvim/.config/nvim/lua/my/plugins/gitsigns.lua) |
| Normal | **`hB`** | 行末のGit Blame表示をトグル | [gitsigns.lua](dotfiles/nvim/.config/nvim/lua/my/plugins/gitsigns.lua) |
| Normal | **`hd`** | 現在の差分(Diff)を表示 | [gitsigns.lua](dotfiles/nvim/.config/nvim/lua/my/plugins/gitsigns.lua) |
| Normal | **`hD`** | 直前のコミットとの差分を表示 | [gitsigns.lua](dotfiles/nvim/.config/nvim/lua/my/plugins/gitsigns.lua) |
| O / X | **`ih`** | Git Hunkをテキストオブジェクトとして選択 | [gitsigns.lua](dotfiles/nvim/.config/nvim/lua/my/plugins/gitsigns.lua) |

### 5. コード診断・整形・ツール (Diagnostics & Formatting)
コードの品質維持と可視化に関する設定です。

| モード | キー | 機能 | 設定ファイル |
| :--- | :--- | :--- | :--- |
| Normal | **`xw`** | ワークスペースの診断情報を表示 | [trouble.lua](dotfiles/nvim/.config/nvim/lua/my/plugins/trouble.lua) |
| Normal | **`xd`** | 現在のバッファの診断情報を表示 | [trouble.lua](dotfiles/nvim/.config/nvim/lua/my/plugins/trouble.lua) |
| Normal | **`xq`** | QuickfixリストをTroubleで表示 | [trouble.lua](dotfiles/nvim/.config/nvim/lua/my/plugins/trouble.lua) |
| Normal | **`xl`** | LocationリストをTroubleで表示 | [trouble.lua](dotfiles/nvim/.config/nvim/lua/my/plugins/trouble.lua) |
| Normal | **`xt`** | TODOコメントをTroubleで一覧表示 | [trouble.lua](dotfiles/nvim/.config/nvim/lua/my/plugins/trouble.lua) |
| N / V | **`mp`** | ファイル全体または選択範囲の整形 | [formatting.lua](dotfiles/nvim/.config/nvim/lua/my/plugins/formatting.lua) |
| Normal | **`]t`** | 次のTODOへジャンプ | [todo-comments.lua](dotfiles/nvim/.config/nvim/lua/my/plugins/todo-comments.lua) |
| Normal | **`[t`** | 前のTODOへジャンプ | [todo-comments.lua](dotfiles/nvim/.config/nvim/lua/my/plugins/todo-comments.lua) |
| Normal | **`<C-space>`** | Treesitter 選択範囲の開始 / 拡大 | [treesitter.lua](dotfiles/nvim/.config/nvim/lua/my/plugins/treesitter.lua) |
| Visual | **`<BS>`** | Treesitter 選択範囲の縮小 | [treesitter.lua](dotfiles/nvim/.config/nvim/lua/my/plugins/treesitter.lua) |

### 6. 入力補完・スニペット (Autocompletion)
`nvim-cmp` による入力支援のバインドです。すべて **Insertモード** で動作します。

| キー | 機能 | 設定ファイル |
| :--- | :--- | :--- |
| **`<C-Space>`** | 補完候補を表示 | [nvim-cmp.lua](dotfiles/nvim/.config/nvim/lua/my/plugins/nvim-cmp.lua) |
| **`<C-k>`** | 前の候補を選択 | [nvim-cmp.lua](dotfiles/nvim/.config/nvim/lua/my/plugins/nvim-cmp.lua) |
| **`<C-j>`** | 次の候補を選択 | [nvim-cmp.lua](dotfiles/nvim/.config/nvim/lua/my/plugins/nvim-cmp.lua) |
| **`<C-b>`** | 補完ドキュメントを上にスクロール | [nvim-cmp.lua](dotfiles/nvim/.config/nvim/lua/my/plugins/nvim-cmp.lua) |
| **`<C-f>`** | 補完ドキュメントを下にスクロール | [nvim-cmp.lua](dotfiles/nvim/.config/nvim/lua/my/plugins/nvim-cmp.lua) |
| **`<C-e>`** | 補完ウィンドウを閉じる | [nvim-cmp.lua](dotfiles/nvim/.config/nvim/lua/my/plugins/nvim-cmp.lua) |
| **`<CR>`** | 選択中の候補を確定 | [nvim-cmp.lua](dotfiles/nvim/.config/nvim/lua/my/plugins/nvim-cmp.lua) |

### 7. セッション・UI管理 (Utility)
ワークスペースの状態保存やキーガイドなどの便利機能です。

| キー | 機能 | 設定ファイル |
| :--- | :--- | :--- |
| **`wr`** | 現在のディレクトリのセッションを復元 | [auto-session.lua](dotfiles/nvim/.config/nvim/lua/my/plugins/auto-session.lua) |
| **`ws`** | セッションをルートディレクトリに保存 | [auto-session.lua](dotfiles/nvim/.config/nvim/lua/my/plugins/auto-session.lua) |
| **`?`** | バッファローカルなキーマップを表示 | [which-key.lua](dotfiles/nvim/.config/nvim/lua/my/plugins/which-key.lua) |
| **`e`** | ファイルエクスプローラーを起動 | [which-key.lua](dotfiles/nvim/.config/nvim/lua/my/plugins/which-key.lua) |
| **`h`** | Git関連のコマンドを表示 | [which-key.lua](dotfiles/nvim/.config/nvim/lua/my/plugins/which-key.lua) |
| **`f`** | ファジーファインダーを起動 | [which-key.lua](dotfiles/nvim/.config/nvim/lua/my/plugins/which-key.lua) |
| **`w`** | セッション管理コマンドを表示 | [which-key.lua](dotfiles/nvim/.config/nvim/lua/my/plugins/which-key.lua) |
| **`x`** | 診断(Trouble)コマンドを表示 | [which-key.lua](dotfiles/nvim/.config/nvim/lua/my/plugins/which-key.lua) |

---

### まとめ：この設定が目指しているもの
このdotfilesのNeovim設定は、**「思考のスピードでコードを操る」**ための究極のレイアウトです。`keymaps.lua` による基礎力の強化から、`Telescope` や `Flash` による圧倒的な移動性能、そして `Gitsigns` や `Trouble` による統合開発環境（IDE）レベルの情報視覚化までが、**Spaceキー（Leader）**を中心とした秩序ある配置に収められています,,。
