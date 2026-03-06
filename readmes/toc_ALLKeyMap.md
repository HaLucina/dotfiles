## Neovim キーマップ完全設定ガイド

Neovim内で定義されているすべてのキーバインドです。Leaderキーは `Space` に設定されています。

### 1. 基本操作・高度な編集 (Core Layer)
標準的なVim操作を強化し、ホームポジションやAltキーを活用して編集効率を最大化しています。

| モード | キー | 機能 | 設定ファイル |
| :--- | :--- | :--- | :--- |
| Normal | `<Leader>` + `<Esc>` | 検索ハイライトとコマンドラインの消去 | [keymaps.lua](dotfiles/nvim/.config/nvim/lua/my/core/keymaps.lua) |
| Insert | `jj` | インサートモードを抜ける (Escの代わり) | [keymaps.lua](dotfiles/nvim/.config/nvim/lua/my/core/keymaps.lua) |
| Normal / Visual | `<S-h>` | 行頭 (`0`) へ移動 | [keymaps.lua](dotfiles/nvim/.config/nvim/lua/my/core/keymaps.lua) |
| Normal / Visual | `<S-l>` | 行末 (`$`) へ移動 | [keymaps.lua](dotfiles/nvim/.config/nvim/lua/my/core/keymaps.lua) |
| Normal / Visual | `<S-j>` | 半ページ分スクロールダウン | [keymaps.lua](dotfiles/nvim/.config/nvim/lua/my/core/keymaps.lua) |
| Normal / Visual | `<S-k>` | 半ページ分スクロールアップ | [keymaps.lua](dotfiles/nvim/.config/nvim/lua/my/core/keymaps.lua) |
| Normal | `j` | 表示行単位での移動 (`gj`) | [keymaps.lua](dotfiles/nvim/.config/nvim/lua/my/core/keymaps.lua) |
| Normal | `k` | 表示行単位での移動 (`gk`) | [keymaps.lua](dotfiles/nvim/.config/nvim/lua/my/core/keymaps.lua) |
| Normal | `o` | 下に空行を挿入してNormalモード維持 | [keymaps.lua](dotfiles/nvim/.config/nvim/lua/my/core/keymaps.lua) |
| Normal | `<S-o>` | 上に空行を挿入してNormalモード維持 | [keymaps.lua](dotfiles/nvim/.config/nvim/lua/my/core/keymaps.lua) |
| Normal / Visual | `gf` | 垂直分割でファイルを開く (`vgF`) | [keymaps.lua](dotfiles/nvim/.config/nvim/lua/my/core/keymaps.lua) |
| Normal / Visual | `c` | ヤンクなしで変更 (ブラックホールレジスタ) | [keymaps.lua](dotfiles/nvim/.config/nvim/lua/my/core/keymaps.lua) |
| Normal / Visual | `x` | ヤンクなしで削除 (ブラックホールレジスタ) | [keymaps.lua](dotfiles/nvim/.config/nvim/lua/my/core/keymaps.lua) |
| Normal / Visual | `s` | デフォルトの 's' コマンドを無効化 | [keymaps.lua](dotfiles/nvim/.config/nvim/lua/my/core/keymaps.lua) |
| Normal / Visual | `<S-s>` | デフォルトの 'S' コマンドを無効化 | [keymaps.lua](dotfiles/nvim/.config/nvim/lua/my/core/keymaps.lua) |
| Normal | `so` | 現在の設定ファイルを再読み込み | [keymaps.lua](dotfiles/nvim/.config/nvim/lua/my/core/keymaps.lua) |
| Normal / Visual | `sf` | カーソル下のテキストをハイライト | [keymaps.lua](dotfiles/nvim/.config/nvim/lua/my/core/keymaps.lua) |
| Normal / Visual | `ss` | コマンドラインで置換コマンドを開始 | [keymaps.lua](dotfiles/nvim/.config/nvim/lua/my/core/keymaps.lua) |
| Normal / Visual | `p` | 改行コード(LF)を強制してペースト | [keymaps.lua](dotfiles/nvim/.config/nvim/lua/my/core/keymaps.lua) |
| Normal / Visual | `<S-p>` | 改行コード(LF)を強制して前方ペースト | [keymaps.lua](dotfiles/nvim/.config/nvim/lua/my/core/keymaps.lua) |
| Normal | `<A-j>` | 現在の行を1行下に移動 | [keymaps.lua](dotfiles/nvim/.config/nvim/lua/my/core/keymaps.lua) |
| Normal | `<A-k>` | 現在の行を1行上に移動 | [keymaps.lua](dotfiles/nvim/.config/nvim/lua/my/core/keymaps.lua) |
| Visual | `<A-j>` | 選択範囲を下に移動 | [keymaps.lua](dotfiles/nvim/.config/nvim/lua/my/core/keymaps.lua) |
| Visual | `<A-k>` | 選択範囲を上に移動 | [keymaps.lua](dotfiles/nvim/.config/nvim/lua/my/core/keymaps.lua) |
| Normal | `<Leader>z` | 半ページスクロールアップして中央表示 (`zz`) | [keymaps.lua](dotfiles/nvim/.config/nvim/lua/my/core/keymaps.lua) |
| Command-line | `<C-k>` | 履歴を上に遡る | [keymaps.lua](dotfiles/nvim/.config/nvim/lua/my/core/keymaps.lua) |
| Command-line | `<C-j>` | 履歴を下に遡る | [keymaps.lua](dotfiles/nvim/.config/nvim/lua/my/core/keymaps.lua) |
| Command-line | `<C-h>` | カーソルを左へ移動 | [keymaps.lua](dotfiles/nvim/.config/nvim/lua/my/core/keymaps.lua) |
| Command-line | `<C-l>` | カーソルを右へ移動 | [keymaps.lua](dotfiles/nvim/.config/nvim/lua/my/core/keymaps.lua) |
| Command-line | `<C-a>` | カーソルを行頭へ移動 | [keymaps.lua](dotfiles/nvim/.config/nvim/lua/my/core/keymaps.lua) |
| Command-line | `<C-e>` | カーソルを行末へ移動 | [keymaps.lua](dotfiles/nvim/.config/nvim/lua/my/core/keymaps.lua) |
| Command-line / Insert | `<C-d>` | 前方の1文字を削除 (Delete) | [keymaps.lua](dotfiles/nvim/.config/nvim/lua/my/core/keymaps.lua) |
| Command-line / Insert | `<C-h>` | 後方の1文字を削除 (Backspace) | [keymaps.lua](dotfiles/nvim/.config/nvim/lua/my/core/keymaps.lua) |

### 2. ウィンドウ・タブ管理 (Window & Tab)
`s` (Split/Size/Screen) を起点とした直感的な管理操作です。

| モード | キー | 機能 | 設定ファイル |
| :--- | :--- | :--- | :--- |
| Normal | `sv` | ウィンドウを垂直分割 | [keymaps.lua](dotfiles/nvim/.config/nvim/lua/my/core/keymaps.lua) |
| Normal | `sh` | ウィンドウを水平分割 | [keymaps.lua](dotfiles/nvim/.config/nvim/lua/my/core/keymaps.lua) |
| Normal | `se` | すべてのウィンドウサイズを均等化 | [keymaps.lua](dotfiles/nvim/.config/nvim/lua/my/core/keymaps.lua) |
| Normal | `sc` | 現在のウィンドウを閉じる | [keymaps.lua](dotfiles/nvim/.config/nvim/lua/my/core/keymaps.lua) |
| Normal | `st` | 新しい空のタブを開く | [keymaps.lua](dotfiles/nvim/.config/nvim/lua/my/core/keymaps.lua) |
| Normal | `sw` | 現在のタブを閉じる | [keymaps.lua](dotfiles/nvim/.config/nvim/lua/my/core/keymaps.lua) |
| Normal | `sn` | 次のタブへ移動 | [keymaps.lua](dotfiles/nvim/.config/nvim/lua/my/core/keymaps.lua) |
| Normal | `sp` | 前のタブへ移動 | [keymaps.lua](dotfiles/nvim/.config/nvim/lua/my/core/keymaps.lua) |
| Normal | `s<S-n>` | 現在のファイルを新しいタブで開く | [keymaps.lua](dotfiles/nvim/.config/nvim/lua/my/core/keymaps.lua) |
| Normal | `sm` | 分割ウィンドウの最大化切り替え | [vim-maximizer.lua](dotfiles/nvim/.config/nvim/lua/my/plugins/vim-maximizer.lua) |

### 3. ナビゲーション・ファイル検索 (Fuzzy Find & Explorer)

| モード | キー | 機能 | 設定ファイル |
| :--- | :--- | :--- | :--- |
| Normal | `ee` | ファイルエクスプローラーの切り替え | [nvim-tree.lua](dotfiles/nvim/.config/nvim/lua/my/plugins/nvim-tree.lua) |
| Normal | `ef` | 現在のファイルをエクスプローラーで表示 | [nvim-tree.lua](dotfiles/nvim/.config/nvim/lua/my/plugins/nvim-tree.lua) |
| Normal | `ec` | エクスプローラーの全ノードを閉じる | [nvim-tree.lua](dotfiles/nvim/.config/nvim/lua/my/plugins/nvim-tree.lua) |
| Normal | `er` | エクスプローラーの表示内容を更新 | [nvim-tree.lua](dotfiles/nvim/.config/nvim/lua/my/plugins/nvim-tree.lua) |
| Normal | `ff` | プロジェクト内のファイルを検索 | [telescope.lua](dotfiles/nvim/.config/nvim/lua/my/plugins/telescope.lua) |
| Normal | `fr` | 最近開いたファイル(oldfiles)を検索 | [telescope.lua](dotfiles/nvim/.config/nvim/lua/my/plugins/telescope.lua) |
| Normal | `fs` | プロジェクト内全文検索 (live_grep) | [telescope.lua](dotfiles/nvim/.config/nvim/lua/my/plugins/telescope.lua) |
| Normal | `fc` | カーソル下の単語をプロジェクト内検索 | [telescope.lua](dotfiles/nvim/.config/nvim/lua/my/plugins/telescope.lua) |
| Normal | `ft` | TODOコメントを検索 | [telescope.lua](dotfiles/nvim/.config/nvim/lua/my/plugins/telescope.lua) |
| Insert | `<C-k>` | Telescope: 前の候補を選択 | [telescope.lua](dotfiles/nvim/.config/nvim/lua/my/plugins/telescope.lua) |
| Insert | `<C-j>` | Telescope: 次の候補を選択 | [telescope.lua](dotfiles/nvim/.config/nvim/lua/my/plugins/telescope.lua) |
| Insert | `<C-q>` | Telescope: 候補をQuickfixへ送って開く | [telescope.lua](dotfiles/nvim/.config/nvim/lua/my/plugins/telescope.lua) |
| Normal / Visual / Operator-pending | `m` | Flashジャンプ | [flash.lua](dotfiles/nvim/.config/nvim/lua/my/plugins/flash.lua) |
| Normal / Visual / Operator-pending | `<S-m>` | Flash Treesitterジャンプ | [flash.lua](dotfiles/nvim/.config/nvim/lua/my/plugins/flash.lua) |
| Operator-pending | `r` | Remote Flashジャンプ | [flash.lua](dotfiles/nvim/.config/nvim/lua/my/plugins/flash.lua) |
| Operator-pending / Visual | `<S-r>` | Flash Treesitter 検索 | [flash.lua](dotfiles/nvim/.config/nvim/lua/my/plugins/flash.lua) |
| Command-line | `<C-s>` | Flash検索のトグル | [flash.lua](dotfiles/nvim/.config/nvim/lua/my/plugins/flash.lua) |

### 4. Git 連携 (Git Integration)

| モード | キー | 機能 | 設定ファイル |
| :--- | :--- | :--- | :--- |
| Normal | `lg` | LazyGit を起動 | [lazygit.lua](dotfiles/nvim/.config/nvim/lua/my/plugins/lazygit.lua) |
| Normal | `]h` | 次のGit変更箇所(Hunk)へ移動 | [gitsigns.lua](dotfiles/nvim/.config/nvim/lua/my/plugins/gitsigns.lua) |
| Normal | `[h` | 前のGit変更箇所(Hunk)へ移動 | [gitsigns.lua](dotfiles/nvim/.config/nvim/lua/my/plugins/gitsigns.lua) |
| Normal | `hs` | 現在のHunkをステージする | [gitsigns.lua](dotfiles/nvim/.config/nvim/lua/my/plugins/gitsigns.lua) |
| Normal | `hr` | 現在のHunkをリセットする | [gitsigns.lua](dotfiles/nvim/.config/nvim/lua/my/plugins/gitsigns.lua) |
| Visual | `hs` | 選択範囲のHunkをステージする | [gitsigns.lua](dotfiles/nvim/.config/nvim/lua/my/plugins/gitsigns.lua) |
| Visual | `hr` | 選択範囲のHunkをリセットする | [gitsigns.lua](dotfiles/nvim/.config/nvim/lua/my/plugins/gitsigns.lua) |
| Normal | `h<S-s>` | バッファ内の全変更をステージする | [gitsigns.lua](dotfiles/nvim/.config/nvim/lua/my/plugins/gitsigns.lua) |
| Normal | `h<S-r>` | バッファ内の全変更をリセットする | [gitsigns.lua](dotfiles/nvim/.config/nvim/lua/my/plugins/gitsigns.lua) |
| Normal | `hu` | ステージしたHunkを取り消す | [gitsigns.lua](dotfiles/nvim/.config/nvim/lua/my/plugins/hu.lua) ※gitsigns内 |
| Normal | `hp` | Hunkの変更内容をプレビュー表示 | [gitsigns.lua](dotfiles/nvim/.config/nvim/lua/my/plugins/gitsigns.lua) |
| Normal | `hb` | 詳細なGit Blameを表示 | [gitsigns.lua](dotfiles/nvim/.config/nvim/lua/my/plugins/gitsigns.lua) |
| Normal | `h<S-b>` | 行末のGit Blame表示をトグル | [gitsigns.lua](dotfiles/nvim/.config/nvim/lua/my/plugins/gitsigns.lua) |
| Normal | `hd` | 現在の差分(Diff)を表示 | [gitsigns.lua](dotfiles/nvim/.config/nvim/lua/my/plugins/gitsigns.lua) |
| Normal | `h<S-d>` | 直前のコミットとの差分を表示 | [gitsigns.lua](dotfiles/nvim/.config/nvim/lua/my/plugins/gitsigns.lua) |
| Operator-pending / Visual | `ih` | Git Hunkをテキストオブジェクトとして選択 | [gitsigns.lua](dotfiles/nvim/.config/nvim/lua/my/plugins/gitsigns.lua) |

### 5. コード診断・整形・ツール (Diagnostics & Formatting)

| モード | キー | 機能 | 設定ファイル |
| :--- | :--- | :--- | :--- |
| Normal | `xw` | ワークスペースの診断情報を表示 | [trouble.lua](dotfiles/nvim/.config/nvim/lua/my/plugins/trouble.lua) |
| Normal | `xd` | 現在のバッファの診断情報を表示 | [trouble.lua](dotfiles/nvim/.config/nvim/lua/my/plugins/trouble.lua) |
| Normal | `xq` | QuickfixリストをTroubleで表示 | [trouble.lua](dotfiles/nvim/.config/nvim/lua/my/plugins/trouble.lua) |
| Normal | `xl` | LocationリストをTroubleで表示 | [trouble.lua](dotfiles/nvim/.config/nvim/lua/my/plugins/trouble.lua) |
| Normal | `xt` | TODOリストをTroubleで表示 | [trouble.lua](dotfiles/nvim/.config/nvim/lua/my/plugins/trouble.lua) |
| Normal / Visual | `mp` | ファイル全体または選択範囲の整形 | [formatting.lua](dotfiles/nvim/.config/nvim/lua/my/plugins/formatting.lua) |
| Normal | `]t` | 次のTODOへジャンプ | [todo-comments.lua](dotfiles/nvim/.config/nvim/lua/my/plugins/todo-comments.lua) |
| Normal | `[t` | 前のTODOへジャンプ | [todo-comments.lua](dotfiles/nvim/.config/nvim/lua/my/plugins/todo-comments.lua) |
| Normal / Visual | `<C-Space>` | Treesitter: 選択開始 / 選択範囲の拡大 | [treesitter.lua](dotfiles/nvim/.config/nvim/lua/my/plugins/treesitter.lua) |
| Visual | `<BS>` | Treesitter: 選択範囲の縮小 | [treesitter.lua](dotfiles/nvim/.config/nvim/lua/my/plugins/treesitter.lua) |

### 6. 入力補完 (Autocompletion)

| モード | キー | 機能 | 設定ファイル |
| :--- | :--- | :--- | :--- |
| Insert | `<C-Space>` | 補完候補を表示 | [nvim-cmp.lua](dotfiles/nvim/.config/nvim/lua/my/plugins/nvim-cmp.lua) |
| Insert | `<C-k>` | 前の候補を選択 | [nvim-cmp.lua](dotfiles/nvim/.config/nvim/lua/my/plugins/nvim-cmp.lua) |
| Insert | `<C-j>` | 次の候補を選択 | [nvim-cmp.lua](dotfiles/nvim/.config/nvim/lua/my/plugins/nvim-cmp.lua) |
| Insert | `<C-b>` | 補完ドキュメントを上にスクロール | [nvim-cmp.lua](dotfiles/nvim/.config/nvim/lua/my/plugins/nvim-cmp.lua) |
| Insert | `<C-f>` | 補完ドキュメントを下にスクロール | [nvim-cmp.lua](dotfiles/nvim/.config/nvim/lua/my/plugins/nvim-cmp.lua) |
| Insert | `<C-e>` | 補完ウィンドウを閉じる | [nvim-cmp.lua](dotfiles/nvim/.config/nvim/lua/my/plugins/nvim-cmp.lua) |
| Insert | `<CR>` | 選択中の候補を確定 (Enter) | [nvim-cmp.lua](dotfiles/nvim/.config/nvim/lua/my/plugins/nvim-cmp.lua) |

### 7. ユーティリティ (Utility)

| モード | キー | 機能 | 設定ファイル |
| :--- | :--- | :--- | :--- |
| Normal | `wr` | カレントディレクトリのセッションを復元 | [auto-session.lua](dotfiles/nvim/.config/nvim/lua/my/plugins/auto-session.lua) |
| Normal | `ws` | セッションをルートディレクトリに保存 | [auto-session.lua](dotfiles/nvim/.config/nvim/lua/my/plugins/auto-session.lua) |
| Normal | `?` | 全体的なキーマップガイドを表示 | [which-key.lua](dotfiles/nvim/.config/nvim/lua/my/plugins/which-key.lua) |
| Normal | `e` | nvim-tree コマンドの表示 | [which-key.lua](dotfiles/nvim/.config/nvim/lua/my/plugins/which-key.lua) |
| Normal | `h` | gitsigns コマンドの表示 | [which-key.lua](dotfiles/nvim/.config/nvim/lua/my/plugins/which-key.lua) |
| Normal | `f` | telescope コマンドの表示 | [which-key.lua](dotfiles/nvim/.config/nvim/lua/my/plugins/which-key.lua) |
| Normal | `w` | auto-session コマンドの表示 | [which-key.lua](dotfiles/nvim/.config/nvim/lua/my/plugins/which-key.lua) |
| Normal | `x` | trouble コマンドの表示 | [which-key.lua](dotfiles/nvim/.config/nvim/lua/my/plugins/which-key.lua) |

### まとめ：この設定が目指しているもの
このdotfilesのNeovim設定は、「思考のスピードでコードを操る」ための究極のレイアウトです。`keymaps.lua` による基礎力の強化（Altキーによる直感的な行入れ替えなど）から、`Flash` による移動性能、`Gitsigns` や `Trouble` による情報視覚化までが、Spaceキー（Leader）を中心とした秩序ある配置に収められています。
