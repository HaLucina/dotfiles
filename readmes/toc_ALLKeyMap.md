## Neovim キーマップ完全設定ガイド

Neovim内で定義されているすべてのキーバインドです。Leaderキーは `Space` に設定されています。

### 1. 基本操作・高度な編集 (Core Layer)

標準的なVim操作を強化し、ホームポジションやAltキーを活用して編集効率を最大化しています。

| モード                | キー                 | 機能                                        | 設定ファイル                                                |
| :-------------------- | :------------------- | :------------------------------------------ | :---------------------------------------------------------- |
| Normal                | `<Leader>` + `<Esc>` | 検索ハイライトとコマンドラインの消去        | [keymaps.lua](../nvim/.config/nvim/lua/my/core/keymaps.lua) |
| Insert                | `jj`                 | インサートモードを抜ける (Escの代わり)      | [keymaps.lua](../nvim/.config/nvim/lua/my/core/keymaps.lua) |
| Normal / Visual       | `<S-h>`              | 行頭 (`0`) へ移動                           | [keymaps.lua](../nvim/.config/nvim/lua/my/core/keymaps.lua) |
| Normal / Visual       | `<S-l>`              | 行末 (`$`) へ移動                           | [keymaps.lua](../nvim/.config/nvim/lua/my/core/keymaps.lua) |
| Normal / Visual       | `<S-j>`              | 半ページ分スクロールダウン                  | [keymaps.lua](../nvim/.config/nvim/lua/my/core/keymaps.lua) |
| Normal / Visual       | `<S-k>`              | 半ページ分スクロールアップ                  | [keymaps.lua](../nvim/.config/nvim/lua/my/core/keymaps.lua) |
| Normal                | `j`                  | 表示行単位での移動 (`gj`)                   | [keymaps.lua](../nvim/.config/nvim/lua/my/core/keymaps.lua) |
| Normal                | `k`                  | 表示行単位での移動 (`gk`)                   | [keymaps.lua](../nvim/.config/nvim/lua/my/core/keymaps.lua) |
| Normal                | `o`                  | 下に空行を挿入してNormalモード維持          | [keymaps.lua](../nvim/.config/nvim/lua/my/core/keymaps.lua) |
| Normal                | `<S-o>`              | 上に空行を挿入してNormalモード維持          | [keymaps.lua](../nvim/.config/nvim/lua/my/core/keymaps.lua) |
| Normal / Visual       | `gf`                 | 垂直分割でファイルを開く (`vgF`)            | [keymaps.lua](../nvim/.config/nvim/lua/my/core/keymaps.lua) |
| Normal / Visual       | `c`                  | ヤンクなしで変更 (ブラックホールレジスタ)   | [keymaps.lua](../nvim/.config/nvim/lua/my/core/keymaps.lua) |
| Normal / Visual       | `x`                  | ヤンクなしで削除 (ブラックホールレジスタ)   | [keymaps.lua](../nvim/.config/nvim/lua/my/core/keymaps.lua) |
| Normal / Visual       | `s`                  | デフォルトの 's' コマンドを無効化           | [keymaps.lua](../nvim/.config/nvim/lua/my/core/keymaps.lua) |
| Normal / Visual       | `<S-s>`              | デフォルトの 'S' コマンドを無効化           | [keymaps.lua](../nvim/.config/nvim/lua/my/core/keymaps.lua) |
| Normal                | `so`                 | 現在の設定ファイルを再読み込み              | [keymaps.lua](../nvim/.config/nvim/lua/my/core/keymaps.lua) |
| Normal / Visual       | `sf`                 | カーソル下のテキストをハイライト            | [keymaps.lua](../nvim/.config/nvim/lua/my/core/keymaps.lua) |
| Normal / Visual       | `ss`                 | コマンドラインで置換コマンドを開始          | [keymaps.lua](../nvim/.config/nvim/lua/my/core/keymaps.lua) |
| Normal / Visual       | `p`                  | 改行コード(LF)を強制してペースト            | [keymaps.lua](../nvim/.config/nvim/lua/my/core/keymaps.lua) |
| Normal / Visual       | `<S-p>`              | 改行コード(LF)を強制して前方ペースト        | [keymaps.lua](../nvim/.config/nvim/lua/my/core/keymaps.lua) |
| Normal                | `<A-j>`              | 現在の行を1行下に移動                       | [keymaps.lua](../nvim/.config/nvim/lua/my/core/keymaps.lua) |
| Normal                | `<A-k>`              | 現在の行を1行上に移動                       | [keymaps.lua](../nvim/.config/nvim/lua/my/core/keymaps.lua) |
| Visual                | `<A-j>`              | 選択範囲を下に移動                          | [keymaps.lua](../nvim/.config/nvim/lua/my/core/keymaps.lua) |
| Visual                | `<A-k>`              | 選択範囲を上に移動                          | [keymaps.lua](../nvim/.config/nvim/lua/my/core/keymaps.lua) |
| Normal                | `<Leader>z`          | 半ページスクロールアップして中央表示 (`zz`) | [keymaps.lua](../nvim/.config/nvim/lua/my/core/keymaps.lua) |
| Command-line          | `<C-k>`              | 履歴を上に遡る                              | [keymaps.lua](../nvim/.config/nvim/lua/my/core/keymaps.lua) |
| Command-line          | `<C-j>`              | 履歴を下に遡る                              | [keymaps.lua](../nvim/.config/nvim/lua/my/core/keymaps.lua) |
| Command-line          | `<C-h>`              | カーソルを左へ移動                          | [keymaps.lua](../nvim/.config/nvim/lua/my/core/keymaps.lua) |
| Command-line          | `<C-l>`              | カーソルを右へ移動                          | [keymaps.lua](../nvim/.config/nvim/lua/my/core/keymaps.lua) |
| Command-line          | `<C-a>`              | カーソルを行頭へ移動                        | [keymaps.lua](../nvim/.config/nvim/lua/my/core/keymaps.lua) |
| Command-line          | `<C-e>`              | カーソルを行末へ移動                        | [keymaps.lua](../nvim/.config/nvim/lua/my/core/keymaps.lua) |
| Command-line / Insert | `<C-d>`              | 前方の1文字を削除 (Delete)                  | [keymaps.lua](../nvim/.config/nvim/lua/my/core/keymaps.lua) |
| Command-line / Insert | `<C-h>`              | 後方の1文字を削除 (Backspace)               | [keymaps.lua](../nvim/.config/nvim/lua/my/core/keymaps.lua) |

### 2. ウィンドウ・タブ管理 (Window & Tab)

`s` (Split/Size/Screen) を起点とした直感的な管理操作です。

| モード | キー     | 機能                             | 設定ファイル                                                               |
| :----- | :------- | :------------------------------- | :------------------------------------------------------------------------- |
| Normal | `sv`     | ウィンドウを垂直分割             | [keymaps.lua](../nvim/.config/nvim/lua/my/core/keymaps.lua)                |
| Normal | `sh`     | ウィンドウを水平分割             | [keymaps.lua](../nvim/.config/nvim/lua/my/core/keymaps.lua)                |
| Normal | `se`     | すべてのウィンドウサイズを均等化 | [keymaps.lua](../nvim/.config/nvim/lua/my/core/keymaps.lua)                |
| Normal | `sc`     | 現在のウィンドウを閉じる         | [keymaps.lua](../nvim/.config/nvim/lua/my/core/keymaps.lua)                |
| Normal | `st`     | 新しい空のタブを開く             | [keymaps.lua](../nvim/.config/nvim/lua/my/core/keymaps.lua)                |
| Normal | `sw`     | 現在のタブを閉じる               | [keymaps.lua](../nvim/.config/nvim/lua/my/core/keymaps.lua)                |
| Normal | `sn`     | 次のタブへ移動                   | [keymaps.lua](../nvim/.config/nvim/lua/my/core/keymaps.lua)                |
| Normal | `sp`     | 前のタブへ移動                   | [keymaps.lua](../nvim/.config/nvim/lua/my/core/keymaps.lua)                |
| Normal | `s<S-n>` | 現在のファイルを新しいタブで開く | [keymaps.lua](../nvim/.config/nvim/lua/my/core/keymaps.lua)                |
| Normal | `sm`     | 分割ウィンドウの最大化切り替え   | [vim-maximizer.lua](../nvim/.config/nvim/lua/my/plugins/vim-maximizer.lua) |

### 3. ナビゲーション・ファイル検索 (Fuzzy Find & Explorer)

| モード                             | キー    | 機能                                             | 設定ファイル                                                       |
| :--------------------------------- | :------ | :----------------------------------------------- | :----------------------------------------------------------------- |
| Normal                             | `y`     | フローティングウィンドウでエクスプローラーを開く | [yazi.lua](../nvim/.config/nvim/lua/my/plugins/yazi.lua)           |
| Normal                             | `ff`    | プロジェクト内のファイルを検索                   | [telescope.lua](../nvim/.config/nvim/lua/my/plugins/telescope.lua) |
| Normal                             | `fr`    | 最近開いたファイル(oldfiles)を検索               | [telescope.lua](../nvim/.config/nvim/lua/my/plugins/telescope.lua) |
| Normal                             | `fs`    | プロジェクト内全文検索 (live_grep)               | [telescope.lua](../nvim/.config/nvim/lua/my/plugins/telescope.lua) |
| Normal                             | `fc`    | カーソル下の単語をプロジェクト内検索             | [telescope.lua](../nvim/.config/nvim/lua/my/plugins/telescope.lua) |
| Normal                             | `ft`    | TODOコメントを検索                               | [telescope.lua](../nvim/.config/nvim/lua/my/plugins/telescope.lua) |
| Insert                             | `<C-k>` | Telescope: 前の候補を選択                        | [telescope.lua](../nvim/.config/nvim/lua/my/plugins/telescope.lua) |
| Insert                             | `<C-j>` | Telescope: 次の候補を選択                        | [telescope.lua](../nvim/.config/nvim/lua/my/plugins/telescope.lua) |
| Insert                             | `<C-q>` | Telescope: 候補をQuickfixへ送って開く            | [telescope.lua](../nvim/.config/nvim/lua/my/plugins/telescope.lua) |
| Normal / Visual / Operator-pending | `m`     | Flashジャンプ                                    | [flash.lua](../nvim/.config/nvim/lua/my/plugins/flash.lua)         |
| Normal / Visual / Operator-pending | `<S-m>` | Flash Treesitterジャンプ                         | [flash.lua](../nvim/.config/nvim/lua/my/plugins/flash.lua)         |
| Operator-pending                   | `r`     | Remote Flashジャンプ                             | [flash.lua](../nvim/.config/nvim/lua/my/plugins/flash.lua)         |
| Operator-pending / Visual          | `<S-r>` | Flash Treesitter 検索                            | [flash.lua](../nvim/.config/nvim/lua/my/plugins/flash.lua)         |
| Command-line                       | `<C-s>` | Flash検索のトグル                                | [flash.lua](../nvim/.config/nvim/lua/my/plugins/flash.lua)         |

### 4. Git 連携 (Git Integration)

| モード                    | キー     | 機能                                     | 設定ファイル                                                           |
| :------------------------ | :------- | :--------------------------------------- | :--------------------------------------------------------------------- |
| Normal                    | `lg`     | LazyGit を起動                           | [lazygit.lua](../nvim/.config/nvim/lua/my/plugins/lazygit.lua)         |
| Normal                    | `]h`     | 次のGit変更箇所(Hunk)へ移動              | [gitsigns.lua](../nvim/.config/nvim/lua/my/plugins/gitsigns.lua)       |
| Normal                    | `[h`     | 前のGit変更箇所(Hunk)へ移動              | [gitsigns.lua](../nvim/.config/nvim/lua/my/plugins/gitsigns.lua)       |
| Normal                    | `hs`     | 現在のHunkをステージする                 | [gitsigns.lua](../nvim/.config/nvim/lua/my/plugins/gitsigns.lua)       |
| Normal                    | `hr`     | 現在のHunkをリセットする                 | [gitsigns.lua](../nvim/.config/nvim/lua/my/plugins/gitsigns.lua)       |
| Visual                    | `hs`     | 選択範囲のHunkをステージする             | [gitsigns.lua](../nvim/.config/nvim/lua/my/plugins/gitsigns.lua)       |
| Visual                    | `hr`     | 選択範囲のHunkをリセットする             | [gitsigns.lua](../nvim/.config/nvim/lua/my/plugins/gitsigns.lua)       |
| Normal                    | `h<S-s>` | バッファ内の全変更をステージする         | [gitsigns.lua](../nvim/.config/nvim/lua/my/plugins/gitsigns.lua)       |
| Normal                    | `h<S-r>` | バッファ内の全変更をリセットする         | [gitsigns.lua](../nvim/.config/nvim/lua/my/plugins/gitsigns.lua)       |
| Normal                    | `hu`     | ステージしたHunkを取り消す               | [gitsigns.lua](../nvim/.config/nvim/lua/my/plugins/hu.lua) ※gitsigns内 |
| Normal                    | `hp`     | Hunkの変更内容をプレビュー表示           | [gitsigns.lua](../nvim/.config/nvim/lua/my/plugins/gitsigns.lua)       |
| Normal                    | `hb`     | 詳細なGit Blameを表示                    | [gitsigns.lua](../nvim/.config/nvim/lua/my/plugins/gitsigns.lua)       |
| Normal                    | `h<S-b>` | 行末のGit Blame表示をトグル              | [gitsigns.lua](../nvim/.config/nvim/lua/my/plugins/gitsigns.lua)       |
| Normal                    | `hd`     | 現在の差分(Diff)を表示                   | [gitsigns.lua](../nvim/.config/nvim/lua/my/plugins/gitsigns.lua)       |
| Normal                    | `h<S-d>` | 直前のコミットとの差分を表示             | [gitsigns.lua](../nvim/.config/nvim/lua/my/plugins/gitsigns.lua)       |
| Operator-pending / Visual | `ih`     | Git Hunkをテキストオブジェクトとして選択 | [gitsigns.lua](../nvim/.config/nvim/lua/my/plugins/gitsigns.lua)       |

### 5. コード診断・整形・ツール (Diagnostics & Formatting)

| モード          | キー        | 機能                                  | 設定ファイル                                                               |
| :-------------- | :---------- | :------------------------------------ | :------------------------------------------------------------------------- |
| Normal          | `xw`        | ワークスペースの診断情報を表示        | [trouble.lua](../nvim/.config/nvim/lua/my/plugins/trouble.lua)             |
| Normal          | `xd`        | 現在のバッファの診断情報を表示        | [trouble.lua](../nvim/.config/nvim/lua/my/plugins/trouble.lua)             |
| Normal          | `xq`        | QuickfixリストをTroubleで表示         | [trouble.lua](../nvim/.config/nvim/lua/my/plugins/trouble.lua)             |
| Normal          | `xl`        | LocationリストをTroubleで表示         | [trouble.lua](../nvim/.config/nvim/lua/my/plugins/trouble.lua)             |
| Normal          | `xt`        | TODOリストをTroubleで表示             | [trouble.lua](../nvim/.config/nvim/lua/my/plugins/trouble.lua)             |
| Normal / Visual | `mp`        | ファイル全体または選択範囲の整形      | [formatting.lua](../nvim/.config/nvim/lua/my/plugins/formatting.lua)       |
| Normal          | `]t`        | 次のTODOへジャンプ                    | [todo-comments.lua](../nvim/.config/nvim/lua/my/plugins/todo-comments.lua) |
| Normal          | `[t`        | 前のTODOへジャンプ                    | [todo-comments.lua](../nvim/.config/nvim/lua/my/plugins/todo-comments.lua) |
| Normal / Visual | `<C-Space>` | Treesitter: 選択開始 / 選択範囲の拡大 | [treesitter.lua](../nvim/.config/nvim/lua/my/plugins/treesitter.lua)       |
| Visual          | `<BS>`      | Treesitter: 選択範囲の縮小            | [treesitter.lua](../nvim/.config/nvim/lua/my/plugins/treesitter.lua)       |

### 6. 入力補完 (Autocompletion)

| モード | キー        | 機能                             | 設定ファイル                                                     |
| :----- | :---------- | :------------------------------- | :--------------------------------------------------------------- |
| Insert | `<C-Space>` | 補完候補を表示                   | [nvim-cmp.lua](../nvim/.config/nvim/lua/my/plugins/nvim-cmp.lua) |
| Insert | `<C-k>`     | 前の候補を選択                   | [nvim-cmp.lua](../nvim/.config/nvim/lua/my/plugins/nvim-cmp.lua) |
| Insert | `<C-j>`     | 次の候補を選択                   | [nvim-cmp.lua](../nvim/.config/nvim/lua/my/plugins/nvim-cmp.lua) |
| Insert | `<C-b>`     | 補完ドキュメントを上にスクロール | [nvim-cmp.lua](../nvim/.config/nvim/lua/my/plugins/nvim-cmp.lua) |
| Insert | `<C-f>`     | 補完ドキュメントを下にスクロール | [nvim-cmp.lua](../nvim/.config/nvim/lua/my/plugins/nvim-cmp.lua) |
| Insert | `<C-e>`     | 補完ウィンドウを閉じる           | [nvim-cmp.lua](../nvim/.config/nvim/lua/my/plugins/nvim-cmp.lua) |
| Insert | `<CR>`      | 選択中の候補を確定 (Enter)       | [nvim-cmp.lua](../nvim/.config/nvim/lua/my/plugins/nvim-cmp.lua) |

### 7. ユーティリティ (Utility)

| モード | キー | 機能                                   | 設定ファイル                                                             |
| :----- | :--- | :------------------------------------- | :----------------------------------------------------------------------- |
| Normal | `wr` | カレントディレクトリのセッションを復元 | [auto-session.lua](../nvim/.config/nvim/lua/my/plugins/auto-session.lua) |
| Normal | `ws` | セッションをルートディレクトリに保存   | [auto-session.lua](../nvim/.config/nvim/lua/my/plugins/auto-session.lua) |
| Normal | `?`  | 全体的なキーマップガイドを表示         | [which-key.lua](../nvim/.config/nvim/lua/my/plugins/which-key.lua)       |
| Normal | `e`  | nvim-tree コマンドの表示               | [which-key.lua](../nvim/.config/nvim/lua/my/plugins/which-key.lua)       |
| Normal | `h`  | gitsigns コマンドの表示                | [which-key.lua](../nvim/.config/nvim/lua/my/plugins/which-key.lua)       |
| Normal | `f`  | telescope コマンドの表示               | [which-key.lua](../nvim/.config/nvim/lua/my/plugins/which-key.lua)       |
| Normal | `w`  | auto-session コマンドの表示            | [which-key.lua](../nvim/.config/nvim/lua/my/plugins/which-key.lua)       |
| Normal | `x`  | trouble コマンドの表示                 | [which-key.lua](../nvim/.config/nvim/lua/my/plugins/which-key.lua)       |

ご指摘の通り、ソースコード（`keymap.toml`）内の **`<` および `>` で囲まれた特殊キー（`<Esc>`、`<Enter>`、`<Up>` など）が、システム側でHTMLタグと誤認され、除去（空欄化）されていた**ことが原因でした。

提供された全373行のソースコード（Snippet〜 および〜）を精査し、欠落していたすべてのキー記号を復元しました。**一切の省略なし**で、すべてのモードとキー設定を日本語の機能説明とともに書き出します。

---

##### 8. Yazi キーマップ (Yazi File Manager)

Yazi ファイルマネージャーの各モードにおける完全なキーバインド設定です。

| モード                     | キー                      | 機能                                                   | 設定ファイル |
| -------------------------- | ------------------------- | ------------------------------------------------------ | ------------ |
| **マネージャー (Manager)** | `<Esc>`                   | ヴィジュアルモード終了、選択解除、または検索キャンセル | keymap.toml  |
| マネージャー               | `<C-[>`                   | ヴィジュアルモード終了、選択解除、または検索キャンセル | keymap.toml  |
| マネージャー               | `q`                       | プロセスを終了                                         | keymap.toml  |
| マネージャー               | `Q`                       | カレントディレクトリを出力せずに終了                   | keymap.toml  |
| マネージャー               | `<C-c>`                   | 現在のタブを閉じる（最後のタブなら終了）               | keymap.toml  |
| マネージャー               | `<C-z>`                   | プロセスを中断（サスペンド）                           | keymap.toml  |
| マネージャー               | `k`                       | 前のファイルへ移動                                     | keymap.toml  |
| マネージャー               | `j`                       | 次のファイルへ移動                                     | keymap.toml  |
| マネージャー               | `<Up>`                    | 前のファイルへ移動                                     | keymap.toml  |
| マネージャー               | `<Down>`                  | 次のファイルへ移動                                     | keymap.toml  |
| マネージャー               | `<C-u>`                   | カーソルを半ページ上に移動                             | keymap.toml  |
| マネージャー               | `<C-d>`                   | カーソルを半ページ下に移動                             | keymap.toml  |
| マネージャー               | `<C-b>`                   | カーソルを1ページ上に移動                              | keymap.toml  |
| マネージャー               | `<C-f>`                   | カーソルを1ページ下に移動                              | keymap.toml  |
| マネージャー               | `<PageUp>`                | カーソルを1ページ上に移動                              | keymap.toml  |
| マネージャー               | `<PageDown>`              | カーソルを1ページ下に移動                              | keymap.toml  |
| マネージャー               | `g g`                     | リストの最上部へ移動                                   | keymap.toml  |
| マネージャー               | `G`                       | リストの最下部へ移動                                   | keymap.toml  |
| マネージャー               | `h`                       | 親ディレクトリに戻る                                   | keymap.toml  |
| マネージャー               | `l`                       | 子ディレクトリに入る                                   | keymap.toml  |
| マネージャー               | `<Left>`                  | 親ディレクトリに戻る                                   | keymap.toml  |
| マネージャー               | `<Right>`                 | 子ディレクトリに入る                                   | keymap.toml  |
| マネージャー               | `H`                       | 履歴の前のディレクトリに戻る                           | keymap.toml  |
| マネージャー               | `L`                       | 履歴の次のディレクトリに進む                           | keymap.toml  |
| マネージャー               | `<Space>`                 | 現在の選択状態を反転して1行下へ移動                    | keymap.toml  |
| マネージャー               | `<C-a>`                   | すべてのファイルを選択                                 | keymap.toml  |
| マネージャー               | `<C-r>`                   | すべてのファイルの選択を反転                           | keymap.toml  |
| マネージャー               | `v`                       | ヴィジュアルモード（選択モード）に入る                 | keymap.toml  |
| マネージャー               | `V`                       | ヴィジュアルモード（解除モード）に入る                 | keymap.toml  |
| マネージャー               | `K`                       | プレビューを5ユニット分上にスクロール                  | keymap.toml  |
| マネージャー               | `J`                       | プレビューを5ユニット分下にスクロール                  | keymap.toml  |
| マネージャー               | `i`                       | ホバー中のファイルをスポット表示                       | keymap.toml  |
| マネージャー               | `o`                       | 選択したファイルを開く                                 | keymap.toml  |
| マネージャー               | `O`                       | 選択したファイルを対話的に開く                         | keymap.toml  |
| マネージャー               | `<Enter>`                 | 選択したファイルを開く                                 | keymap.toml  |
| マネージャー               | `<S-Enter>`               | 選択したファイルを対話的に開く                         | keymap.toml  |
| マネージャー               | `y`                       | 選択したファイルをヤンク（コピー）                     | keymap.toml  |
| マネージャー               | `x`                       | 選択したファイルをヤンク（カット）                     | keymap.toml  |
| マネージャー               | `p`                       | ヤンクしたファイルを貼り付け                           | keymap.toml  |
| マネージャー               | `P`                       | ヤンクしたファイルを貼り付け（存在すれば上書き）       | keymap.toml  |
| マネージャー               | `-`                       | ヤンクしたファイルの絶対パスでシンボリックリンク作成   | keymap.toml  |
| マネージャー               | `_`                       | ヤンクしたファイルの相対パスでシンボリックリンク作成   | keymap.toml  |
| マネージャー               | `<C-l>`                   | ヤンクしたファイルのハードリンクを作成                 | keymap.toml  |
| マネージャー               | `Y`                       | ヤンク状態を解除                                       | keymap.toml  |
| マネージャー               | `X`                       | ヤンク状態を解除                                       | keymap.toml  |
| マネージャー               | `d`                       | 選択したファイルをゴミ箱へ移動                         | keymap.toml  |
| マネージャー               | `D`                       | 選択したファイルを完全に削除                           | keymap.toml  |
| マネージャー               | `a`                       | ファイル/ディレクトリ作成（末尾 / でディレクトリ）     | keymap.toml  |
| マネージャー               | `r`                       | 選択したファイルのリネーム（拡張子の前を選択）         | keymap.toml  |
| マネージャー               | `;`                       | シェルコマンドを実行（対話的）                         | keymap.toml  |
| マネージャー               | `:`                       | シェルコマンドを実行（終了までブロック）               | keymap.toml  |
| マネージャー               | `.`                       | 隠しファイルの表示/非表示を切り替え                    | keymap.toml  |
| マネージャー               | `s`                       | fdを使用して名前でファイルを検索                       | keymap.toml  |
| マネージャー               | `S`                       | ripgrepを使用して内容で検索                            | keymap.toml  |
| マネージャー               | `<Esc>`                   | 実行中の検索をキャンセル                               | keymap.toml  |
| マネージャー               | `z`                       | fzfを使用してファイル/ディレクトリにジャンプ           | keymap.toml  |
| マネージャー               | `Z`                       | zoxideを使用してディレクトリにジャンプ                 | keymap.toml  |
| マネージャー               | `m s`                     | ラインモードを「サイズ」に切り替え                     | keymap.toml  |
| マネージャー               | `m p`                     | ラインモードを「権限」に切り替え                       | keymap.toml  |
| マネージャー               | `m b`                     | ラインモードを「作成日時」に切り替え                   | keymap.toml  |
| マネージャー               | `m m`                     | ラインモードを「更新日時」に切り替え                   | keymap.toml  |
| マネージャー               | `m o`                     | ラインモードを「所有者」に切り替え                     | keymap.toml  |
| マネージャー               | `m n`                     | ラインモードを「なし」に切り替え                       | keymap.toml  |
| マネージャー               | `c c`                     | 現在のファイルパスをコピー                             | keymap.toml  |
| マネージャー               | `c d`                     | 現在の親ディレクトリパスをコピー                       | keymap.toml  |
| マネージャー               | `c f`                     | ファイル名をコピー                                     | keymap.toml  |
| マネージャー               | `c n`                     | 拡張子を除いたファイル名をコピー                       | keymap.toml  |
| マネージャー               | `f`                       | スマートフィルタリングを実行                           | keymap.toml  |
| マネージャー               | `/`                       | スマート検索（次を検索）                               | keymap.toml  |
| マネージャー               | `?`                       | スマート検索（前を検索）                               | keymap.toml  |
| マネージャー               | `n`                       | 次の検索結果へ移動                                     | keymap.toml  |
| マネージャー               | `N`                       | 前の検索結果へ移動                                     | keymap.toml  |
| マネージャー               | `, m`                     | 更新日時順でソート（ラインモード更新日時）             | keymap.toml  |
| マネージャー               | `, M`                     | 更新日時順でソート（逆順）                             | keymap.toml  |
| マネージャー               | `, b`                     | 作成日時順でソート（ラインモード作成日時）             | keymap.toml  |
| マネージャー               | `, B`                     | 作成日時順でソート（逆順）                             | keymap.toml  |
| マネージャー               | `, e`                     | 拡張子順でソート                                       | keymap.toml  |
| マネージャー               | `, E`                     | 拡張子順でソート（逆順）                               | keymap.toml  |
| マネージャー               | `, a`                     | アルファベット順でソート                               | keymap.toml  |
| マネージャー               | `, A`                     | アルファベット順でソート（逆順）                       | keymap.toml  |
| マネージャー               | `, n`                     | 自然順（数値考慮）でソート                             | keymap.toml  |
| マネージャー               | `, N`                     | 自然順でソート（逆順）                                 | keymap.toml  |
| マネージャー               | `, s`                     | サイズ順でソート（ラインモードサイズ）                 | keymap.toml  |
| マネージャー               | `, S`                     | サイズ順でソート（逆順）                               | keymap.toml  |
| マネージャー               | `, r`                     | ランダムにソート                                       | keymap.toml  |
| マネージャー               | `g h`                     | ホームディレクトリへ移動                               | keymap.toml  |
| マネージャー               | `g c`                     | ~/.config へ移動                                       | keymap.toml  |
| マネージャー               | `g d`                     | ~/Downloads へ移動                                     | keymap.toml  |
| マネージャー               | `g <Enter>`               | 対話的にジャンプ先を入力                               | keymap.toml  |
| マネージャー               | `g f`                     | ホバー中のシンボリックリンク先を追跡                   | keymap.toml  |
| マネージャー               | `t`                       | 現在のディレクトリで新しいタブを作成                   | keymap.toml  |
| マネージャー               | `1` 〜 `9`                | 指定番号のタブに切り替え                               | keymap.toml  |
| マネージャー               | `[` / `]`                 | 前後のタブに切り替え                                   | keymap.toml  |
| マネージャー               | `{` / `}`                 | 現在のタブを左右に入れ替え                             | keymap.toml  |
| マネージャー               | `w`                       | タスクマネージャーを表示                               | keymap.toml  |
| マネージャー               | `~`                       | ヘルプを表示                                           | keymap.toml  |
| マネージャー               | `<F1>`                    | ヘルプを表示                                           | keymap.toml  |
| **タスク (Tasks)**         | `<Esc>`                   | タスクマネージャーを閉じる                             | keymap.toml  |
| タスク                     | `<C-[>`                   | タスクマネージャーを閉じる                             | keymap.toml  |
| タスク                     | `<C-c>`                   | タスクマネージャーを閉じる                             | keymap.toml  |
| タスク                     | `w`                       | タスクマネージャーを閉じる                             | keymap.toml  |
| タスク                     | `k` / `j`                 | 前後のタスクを選択                                     | keymap.toml  |
| タスク                     | `<Up>` / `<Down>`         | 前後のタスクを選択                                     | keymap.toml  |
| タスク                     | `<Enter>`                 | 選択中のタスクを詳細表示（インスペクト）               | keymap.toml  |
| タスク                     | `x`                       | 選択中のタスクをキャンセル                             | keymap.toml  |
| タスク                     | `~` / `<F1>`              | ヘルプを表示                                           | keymap.toml  |
| **スポット (Spot)**        | `<Esc>` / `<C-[>`         | スポット表示を閉じる                                   | keymap.toml  |
| スポット                   | `<C-c>` / `q`             | スポット表示を閉じる                                   | keymap.toml  |
| スポット                   | `k` / `j`                 | 前後の行へ移動                                         | keymap.toml  |
| スポット                   | `<Up>` / `<Down>`         | 前後の行へ移動                                         | keymap.toml  |
| スポット                   | `h` / `l`                 | 前後のファイルへ切り替え                               | keymap.toml  |
| スポット                   | `<Left>` / `<Right>`      | 前後のファイルへ切り替え                               | keymap.toml  |
| スポット                   | `c c`                     | 選択したセルをコピー                                   | keymap.toml  |
| スポット                   | `~` / `<F1>`              | ヘルプを表示                                           | keymap.toml  |
| **ピック (Pick)**          | `<Esc>` / `<C-[>`         | 選択をキャンセルして閉じる                             | keymap.toml  |
| ピック                     | `<C-c>`                   | 選択をキャンセルして閉じる                             | keymap.toml  |
| ピック                     | `<Enter>`                 | 選択を確定して送信                                     | keymap.toml  |
| ピック                     | `k` / `j`                 | 前後のオプションを選択                                 | keymap.toml  |
| ピック                     | `<Up>` / `<Down>`         | 前後のオプションを選択                                 | keymap.toml  |
| ピック                     | `~` / `<F1>`              | ヘルプを表示                                           | keymap.toml  |
| **入力 (Input)**           | `<Esc>`                   | ノーマルモードに戻る、または入力をキャンセル           | keymap.toml  |
| 入力                       | `<Enter>`                 | 入力を確定して送信                                     | keymap.toml  |
| 入力                       | `<C-c>`                   | 入力をキャンセルして閉じる                             | keymap.toml  |
| 入力                       | `<C-[>`                   | ノーマルモードに戻る、または入力をキャンセル           | keymap.toml  |
| 入力                       | `i` / `I`                 | 挿入モードに入る（I は行頭移動後）                     | keymap.toml  |
| 入力                       | `a` / `A`                 | 追加モードに入る（A は行末移動後）                     | keymap.toml  |
| 入力                       | `v`                       | ヴィジュアルモードに入る                               | keymap.toml  |
| 入力                       | `r`                       | 1文字置換を実行                                        | keymap.toml  |
| 入力                       | `V`                       | 行頭から行末までを選択                                 | keymap.toml  |
| 入力                       | `h` / `l`                 | 1文字左右へ移動                                        | keymap.toml  |
| 入力                       | `<Left>` / `<Right>`      | 1文字左右へ移動                                        | keymap.toml  |
| 入力                       | `b` / `B`                 | 単語/WORD単位で左に移動                                | keymap.toml  |
| 入力                       | `w` / `W`                 | 単語/WORD単位で右に移動                                | keymap.toml  |
| 入力                       | `e` / `E`                 | 単語/WORDの末尾に移動                                  | keymap.toml  |
| 入力                       | `<A-b>` / `<A-f>`         | 単語単位で左/右に移動                                  | keymap.toml  |
| 入力                       | `0` / `$`                 | 行頭/行末(EOL)へ移動                                   | keymap.toml  |
| 入力                       | `_` / `^`                 | 最初の非空白文字へ移動                                 | keymap.toml  |
| 入力                       | `<Home>` / `<End>`        | 行頭/行末へ移動                                        | keymap.toml  |
| 入力                       | `<Backspace>`             | カーソルの前の文字を削除                               | keymap.toml  |
| 入力                       | `<Delete>`                | カーソル位置の文字を削除                               | keymap.toml  |
| 入力                       | `<C-u>` / `<C-k>`         | 行頭まで削除 / 行末まで削除                            | keymap.toml  |
| 入力                       | `<C-w>` / `<A-Backspace>` | 前の単語を削除                                         | keymap.toml  |
| 入力                       | `d` / `D`                 | 選択範囲をカット / 行末までカット                      | keymap.toml  |
| 入力                       | `c` / `C`                 | 選択範囲をカットして挿入 / 行末までカットして挿入      | keymap.toml  |
| 入力                       | `s` / `S`                 | 現在の文字をカットして挿入 / 行全体をカットして挿入    | keymap.toml  |
| 入力                       | `x`                       | 現在の文字をカット                                     | keymap.toml  |
| 入力                       | `y`                       | 選択した文字をコピー                                   | keymap.toml  |
| 入力                       | `p` / `P`                 | カーソルの後/前に貼り付け                              | keymap.toml  |
| 入力                       | `u` / `U`                 | アンドゥ（または小文字化）/ 大文字化                   | keymap.toml  |
| 入力                       | `<C-r>`                   | やり直し（リドゥ）                                     | keymap.toml  |
| 入力                       | `~` / `<F1>`              | ヘルプを表示                                           | keymap.toml  |
| **確認 (Confirm)**         | `<Esc>` / `<C-[>`         | 確認をキャンセル                                       | keymap.toml  |
| 確認                       | `<C-c>`                   | 確認をキャンセル                                       | keymap.toml  |
| 確認                       | `<Enter>`                 | 確認を確定                                             | keymap.toml  |
| 確認                       | `n` / `y`                 | キャンセル / 確定                                      | keymap.toml  |
| 確認                       | `k` / `j`                 | 前後の行へ移動                                         | keymap.toml  |
| 確認                       | `<Up>` / `<Down>`         | 前後の行へ移動                                         | keymap.toml  |
| 確認                       | `~` / `<F1>`              | ヘルプを表示                                           | keymap.toml  |
| **補完 (Completion)**      | `<Esc>` / `<C-c>`         | 補完をキャンセル                                       | keymap.toml  |
| 補完                       | `<Enter>`                 | 補完を確定                                             | keymap.toml  |
| 補完                       | `<Tab>`                   | 候補を適用して入力を確定                               | keymap.toml  |
| 補完                       | `k` / `j`                 | 前後の候補を選択                                       | keymap.toml  |
| 補完                       | `<Up>` / `<Down>`         | 前後の候補を選択                                       | keymap.toml  |
| 補完                       | `<C-k>` / `<C-j>`         | 前後の候補を選択                                       | keymap.toml  |
| 補完                       | `<S-Tab>`                 | 前の候補を選択                                         | keymap.toml  |
| 補完                       | `~` / `<F1>`              | ヘルプを表示                                           | keymap.toml  |
| **ヘルプ (Help)**          | `<Esc>` / `<C-[>`         | フィルタ解除またはヘルプを閉じる                       | keymap.toml  |
| ヘルプ                     | `q`                       | ヘルプを閉じる                                         | keymap.toml  |
| ヘルプ                     | `k` / `j`                 | 前後の行へ移動                                         | keymap.toml  |
| ヘルプ                     | `<Up>` / `<Down>`         | 前後の行へ移動                                         | keymap.toml  |
| ヘルプ                     | `f`                       | ヘルプ項目をフィルタリング                             | keymap.toml  |

---

## Weztermキー操作

##### 1. コピーモード (Copy Mode)
`LEADER` + `[` で起動する、バッファを閲覧・選択するためのモードです。

| モード | キー | 機能 | 設定ファイル |
| :--- | :--- | :--- | :--- |
| Normal | `<Leader>` + `[` | コピーモードを起動 | wezterm.lua |
| Copy Mode | `h` | 左へ移動 (MoveLeft) | wezterm.lua |
| Copy Mode | `j` | 下へ移動 (MoveDown) | wezterm.lua |
| Copy Mode | `k` | 上へ移動 (MoveUp) | wezterm.lua |
| Copy Mode | `l` | 右へ移動 (MoveRight) | wezterm.lua |
| Copy Mode | `<S-h>` (H) | 行頭のコンテンツへ移動 (MoveToStartOfLineContent) | wezterm.lua |
| Copy Mode | `<S-l>` (L) | 行末のコンテンツへ移動 (MoveToEndOfLineContent) | wezterm.lua |
| Copy Mode | `0` | 行頭へ移動 (MoveToStartOfLine) | wezterm.lua |
| Copy Mode | `v` | セル選択モードを開始 (SetSelectionMode = "Cell") | wezterm.lua |
| Copy Mode | `<C-v>` | ブロック選択モードを開始 (SetSelectionMode = "Block") | wezterm.lua |
| Copy Mode | `<S-v>` (V) | 行選択モードを開始 (SetSelectionMode = "Line") | wezterm.lua |
| Copy Mode | `y` | クリップボードにコピー (CopyTo = "Clipboard") | wezterm.lua |
| Copy Mode | `q` | コピーモードを閉じる (Close) | wezterm.lua |
| Copy Mode | `<Esc>` | コピーモードを閉じる (Close) | wezterm.lua |
| Copy Mode | `<Enter>` | クリップボードとプライマリにコピーして閉じる | wezterm.lua |

##### 2. ワークスペース管理 (Workspace)
複数の作業状態を切り替えるための操作です。

| モード | キー | 機能 | 設定ファイル |
| :--- | :--- | :--- | :--- |
| Normal | `<Leader>` + `w` | ワークスペース選択ランチャーを表示 | wezterm.lua |
| Normal | `<Leader>` + `$` | 現在のワークスペース名を変更 | wezterm.lua |
| Normal | `<Leader>` + `<S-w>` (W) | 新しいワークスペースを作成 | wezterm.lua |

##### 3. タブ管理 (Tabs)
タブの作成、閉鎖、および切り替え操作です。

| モード | キー | 機能 | 設定ファイル |
| :--- | :--- | :--- | :--- |
| Normal | `<C-S-p>` | コマンドパレットを表示 (ActivateCommandPalette) | wezterm.lua |
| Normal | `<C-Tab>` | 次のタブへ移動 (ActivateTabRelative(1)) | wezterm.lua |
| Normal | `<C-S-Tab>` | 前のタブへ移動 (ActivateTabRelative(-1)) | wezterm.lua |
| Normal | `<C-S-t>` | 現在のドメインで新しいタブを作成 | wezterm.lua |
| Normal | `<C-S-w>` | 現在のタブを閉じる (確認あり) | wezterm.lua |
| Normal | `<A-1>` | 1番目のタブへ切り替え | wezterm.lua |
| Normal | `<A-2>` | 2番目のタブへ切り替え | wezterm.lua |
| Normal | `<A-3>` | 3番目のタブへ切り替え | wezterm.lua |
| Normal | `<A-9>` | 最後のタブへ切り替え | wezterm.lua |

##### 4. ペイン操作 (Panes)
画面分割と移動に関する操作です。

| モード | キー | 機能 | 設定ファイル |
| :--- | :--- | :--- | :--- |
| Normal | `<Leader>` + `-` | ウィンドウを上下に分割 (SplitVertical) | wezterm.lua |
| Normal | `<Leader>` + `\` | ウィンドウを左右に分割 (SplitHorizontal) | wezterm.lua |
| Normal | `<Leader>` + `x` | 現在のペインを閉じる (確認あり) | wezterm.lua |
| Normal | `<Leader>` + `z` | ペインのズーム状態を切り替え | wezterm.lua |
| Normal | `h` (Navigator) | 左のペイン/ウィンドウへ移動 (split_nav) | wezterm.lua |
| Normal | `j` (Navigator) | 下のペイン/ウィンドウへ移動 (split_nav) | wezterm.lua |
| Normal | `k` (Navigator) | 上のペイン/ウィンドウへ移動 (split_nav) | wezterm.lua |
| Normal | `l` (Navigator) | 右のペイン/ウィンドウへ移動 (split_nav) | wezterm.lua |

##### 5. クリップボード操作 (Clipboard)
| モード | キー | 機能 | 設定ファイル |
| :--- | :--- | :--- | :--- |
| Normal | `<C-S-c>` | クリップボードへコピー | wezterm.lua |
| Normal | `<C-S-v>` | クリップボードから貼り付け | wezterm.lua |

##### 6. システム・設定 (System)
| モード | キー | 機能 | 設定ファイル |
| :--- | :--- | :--- | :--- |
| Normal | `<C-S-r>` | 設定ファイルの再読み込み | wezterm.lua |
| Normal | `<C-S-+>` | フォントサイズを拡大 | wezterm.lua |
| Normal | `<C-->` | フォントサイズを縮小 | wezterm.lua |
| Normal | `<C-0>` | フォントサイズをリセット | wezterm.lua |
| Normal | `<A-Enter>` | フルスクリーン表示の切り替え | wezterm.lua |
