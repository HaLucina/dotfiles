## Neovim キーマップ

### 1. Core Layer<a name="why-push-key"></a>

## Why use f.push_key_is? <a name="keymap-lua"></a>
Neovim内で定義されているすべてのキーバインド。Leaderキーは `Space` に設定。

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

`s` (Split/Size/Screen) を起点とした直感的な管理操作。キーは's'で統一。

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
| Visual          | `<BS>`      | reesitter: 選択範囲の縮小             | [treesitter.lua](../nvim/.config/nvim/lua/my/plugins/treesitter.lua)       |

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

---

## 8. Yazi キーマップ (Yazi File Manager)

### 1. 独自に変更したキーマップ

| キー | 機能 | 備考 |
| :--- | :--- | :--- |
| `z` | fzfによるファイル検索を実行する | デフォルトのジャンプ機能を上書き |
| `Z` | fzfプラグインを起動する | デフォルトのzoxideジャンプを上書き |
| `D` | 完全削除を無効化 | 誤操作防止のため機能を空に設定 |
| `d` `d` | 選択したファイルをゴミ箱へ移動する | `remove`コマンドを割り当て |
| `y` `p` | ファイルの絶対パスをクリップボードにコピーする | Yazi標準の`copy path`を使用 |
| `y` `n` | ファイル名のみをコピーする | `copy filename`を使用 |
| `t` | 無効化 (新しいタブの作成) | `exec = ""` に設定 |
| `w` | 無効化 (タスクマネージャーの表示) | `exec = ""` に設定 |
| `[` / `]` | 無効化 (前後のタブへ移動) | `exec = ""` に設定 |
| `{` / `}` | 無効化 (タブ間の移動) | `exec = ""` に設定 |
| `1` 〜 `9` | 無効化 (数字キーによるタブ切り替え) | すべて `exec = ""` に設定 |

---

### 2. 対話的にする (Interactive)
対話的な操作を必要とするキーマップのまとめです。

| モード | キー | 機能 |
| :--- | :--- | :--- |
| マネージャー | `O` | 選択したファイルを対話的に開く |
| マネージャー | `<S-Enter>` | 選択したファイルを対話的に開く |
| マネージャー | `;` | シェルコマンドを実行（対話的） |
| マネージャー | `g` `<Enter>` | 対話的にジャンプ先を入力して移動 |

---

### 3. デフォルトのキーマップ (カテゴリ別)
あなたの設定で上書きされていない、Yazi標準のキーマップです。

#### マネージャー：移動・ナビゲーション
| キー | 機能 |
| :--- | :--- |
| `<Esc>` / `<C-[>` | ヴィジュアルモード終了、選択解除、または検索キャンセル |
| `q` | プロセスを終了 |
| `Q` | カレントディレクトリを出力せずに終了 |
| `<C-c>` | 現在のタブを閉じる（最後のタブなら終了） |
| `<C-z>` | プロセスを中断（サスペンド） |
| `k` / `j` | 前 / 次のファイルへ移動 |
| `<C-u>` / `<C-d>` | カーソルを半ページ上 / 下に移動 |
| `<C-b>` / `<C-f>` | カーソルを1ページ上 / 下に移動 |
| `g` `g` | リストの最上部へ移動 |
| `G` | リストの最下部へ移動 |
| `h` / `l` | 親ディレクトリに戻る / 子ディレクトリに入る |
| `H` / `L` | 履歴の前 / 次のディレクトリに移動 |
| `g` `h` | ホームディレクトリへ移動 |
| `g` `c` | `~/.config` へ移動 |
| `g` `d` | `~/Downloads` へ移動 |
| `g` `f` | ホバー中のシンボリックリンク先を追跡 |

#### マネージャー：選択・編集・操作
| キー | 機能 |
| :--- | :--- |
| `<Space>` | 現在の選択状態を反転して1行下へ移動 |
| `<C-a>` | すべてのファイルを選択 |
| `<C-r>` | すべてのファイルの選択を反転 |
| `v` / `V` | ヴィジュアルモード（選択 / 解除）に入る |
| `K` / `J` | プレビューを5ユニット分上 / 下にスクロール |
| `i` | ホバー中のファイルをスポット表示 |
| `o` / `<Enter>` | 選択したファイルを開く |
| `x` | 選択したファイルをヤンク（カット） |
| `p` / `P` | ヤンクしたファイルを貼り付け（Pは存在すれば上書き） |
| `-` / `_` | ヤンクしたファイルの絶対パス / 相対パスでシンボリックリンク作成 |
| `<C-l>` | ヤンクしたファイルのハードリンクを作成 |
| `Y` / `X` | ヤンク状態を解除 |
| `a` | ファイル/ディレクトリ作成（末尾 / でディレクトリ） |
| `r` | 選択したファイルのリネーム |
| `:` | シェルコマンドを実行（終了までブロック） |
| `.` | 隠しファイルの表示/非表示を切り替え |
| `~` / `<F1>` | ヘルプを表示 |

#### マネージャー：検索・フィルタ・ソート
| キー | 機能 |
| :--- | :--- |
| `S` | ripgrepを使用して内容で検索 |
| `f` | スマートフィルタリングを実行 |
| `/` / `?` | スマート検索（次を検索 / 前を検索） |
| `n` / `N` | 次 / 前の検索結果へ移動 |
| `,` `m` / `,` `M` | 更新日時順でソート（正順 / 逆順） |
| `,` `b` / `,` `B` | 作成日時順でソート（正順 / 逆順） |
| `,` `e` / `,` `E` | 拡張子順でソート（正順 / 逆順） |
| `,` `a` / `,` `A` | アルファベット順でソート（正順 / 逆順） |
| `,` `n` / `,` `N` | 自然順でソート（正順 / 逆順） |
| `,` `s` / `,` `S` | サイズ順でソート（正順 / 逆順） |
| `,` `r` | ランダムにソート |

#### マネージャー：表示モード（ラインモード）
| キー | 機能 |
| :--- | :--- |
| `m` `s` | ラインモードを「サイズ」に切り替え |
| `m` `p` | ラインモードを「権限」に切り替え |
| `m` `b` | ラインモードを「作成日時」に切り替え |
| `m` `m` | ラインモードを「更新日時」に切り替え |
| `m` `o` | ラインモードを「所有者」に切り替え |
| `m` `n` | ラインモードを「なし」に切り替え |

#### マネージャー：パス・ファイル名コピー (デフォルト)
※あなたの設定 (`y p`, `y n`) で上書きされていない残りのデフォルトコマンドです。
| キー | 機能 |
| :--- | :--- |
| `c` `c` | 現在のファイルパスをコピー |
| `c` `d` | 現在の親ディレクトリパスをコピー |
| `c` `f` | ファイル名をコピー |
| `c` `n` | 拡張子を除いたファイル名をコピー |

---

#### その他のモード（タスク・スポット・入力等）
これらはマネージャー以外のモードにおけるデフォルト設定です。

| モード | 主要なキー | 機能 |
| :--- | :--- | :--- |
| タスク | `<Esc>`, `x`, `k`/`j` | 閉じる、キャンセル、選択 |
| スポット | `<Esc>`, `q`, `k`/`j`, `h`/`l` | 閉じる、行移動、ファイル切り替え |
| ピック | `<Esc>`, `<Enter>`, `k`/`j` | キャンセル、確定、選択 |
| 入力 | `<Esc>`, `<Enter>`, `i`/`a`, `v`, `h`/`j`/`k`/`l` | ノーマルモード、確定、挿入/追加、移動 |
| 確認 | `<Esc>`, `<Enter>`, `y`/`n` | キャンセル、確定、承諾/拒否 |
| 補完 | `<Esc>`, `<Enter>`, `<Tab>`, `k`/`j` | キャンセル、確定、候補選択 |
| ヘルプ | `<Esc>`, `q`, `k`/`j`, `f` | 閉じる、移動、フィルタリング |
---

## Weztermキー操作

`LEADER`は`<C-q>`に設定。

##### 1. コピーモード (Copy Mode)

`LEADER` + `[` で起動。コンソール画面をVimのようにカーソル操作するためのモード。

| モード    | キー             | 機能                                                  | 設定ファイル |
| :-------- | :--------------- | :---------------------------------------------------- | :----------- |
| Normal    | `<Leader>` + `[` | コピーモードを起動                                    | wezterm.lua  |
| Copy Mode | `h`              | 左へ移動 (MoveLeft)                                   | wezterm.lua  |
| Copy Mode | `j`              | 下へ移動 (MoveDown)                                   | wezterm.lua  |
| Copy Mode | `k`              | 上へ移動 (MoveUp)                                     | wezterm.lua  |
| Copy Mode | `l`              | 右へ移動 (MoveRight)                                  | wezterm.lua  |
| Copy Mode | `<S-h>` (H)      | 行頭のコンテンツへ移動 (MoveToStartOfLineContent)     | wezterm.lua  |
| Copy Mode | `<S-l>` (L)      | 行末のコンテンツへ移動 (MoveToEndOfLineContent)       | wezterm.lua  |
| Copy Mode | `0`              | 行頭へ移動 (MoveToStartOfLine)                        | wezterm.lua  |
| Copy Mode | `v`              | セル選択モードを開始 (SetSelectionMode = "Cell")      | wezterm.lua  |
| Copy Mode | `<C-v>`          | ブロック選択モードを開始 (SetSelectionMode = "Block") | wezterm.lua  |
| Copy Mode | `<S-v>` (V)      | 行選択モードを開始 (SetSelectionMode = "Line")        | wezterm.lua  |
| Copy Mode | `y`              | クリップボードにコピー (CopyTo = "Clipboard")         | wezterm.lua  |
| Copy Mode | `q`              | コピーモードを閉じる (Close)                          | wezterm.lua  |
| Copy Mode | `<Esc>`          | コピーモードを閉じる (Close)                          | wezterm.lua  |
| Copy Mode | `<Enter>`        | クリップボードとプライマリにコピーして閉じる          | wezterm.lua  |

##### 2. ワークスペース管理 (Workspace)

複数の作業状態を切り替えるための操作です。

| モード | キー                     | 機能                               | 設定ファイル |
| :----- | :----------------------- | :--------------------------------- | :----------- |
| Normal | `<Leader>` + `w`         | ワークスペース選択ランチャーを表示 | wezterm.lua  |
| Normal | `<Leader>` + `$`         | 現在のワークスペース名を変更       | wezterm.lua  |
| Normal | `<Leader>` + `<S-w>` (W) | 新しいワークスペースを作成         | wezterm.lua  |

##### 3. タブ管理 (Tabs)

タブの作成、閉鎖、および切り替え操作です。

| モード | キー        | 機能                                            | 設定ファイル |
| :----- | :---------- | :---------------------------------------------- | :----------- |
| Normal | `<C-S-p>`   | コマンドパレットを表示 (ActivateCommandPalette) | wezterm.lua  |
| Normal | `<C-Tab>`   | 次のタブへ移動 (ActivateTabRelative(1))         | wezterm.lua  |
| Normal | `<C-S-Tab>` | 前のタブへ移動 (ActivateTabRelative(-1))        | wezterm.lua  |
| Normal | `<C-S-t>`   | 現在のドメインで新しいタブを作成                | wezterm.lua  |
| Normal | `<C-S-w>`   | 現在のタブを閉じる (確認あり)                   | wezterm.lua  |
| Normal | `<A-1>`     | 1番目のタブへ切り替え                           | wezterm.lua  |
| Normal | `<A-2>`     | 2番目のタブへ切り替え                           | wezterm.lua  |
| Normal | `<A-3>`     | 3番目のタブへ切り替え                           | wezterm.lua  |
| Normal | `<A-9>`     | 最後のタブへ切り替え                            | wezterm.lua  |

##### 4. ペイン操作 (Panes)

画面分割と移動に関する操作です。

| モード | キー             | 機能                                     | 設定ファイル |
| :----- | :--------------- | :--------------------------------------- | :----------- |
| Normal | `<Leader>` + `-` | ウィンドウを上下に分割 (SplitVertical)   | wezterm.lua  |
| Normal | `<Leader>` + `\` | ウィンドウを左右に分割 (SplitHorizontal) | wezterm.lua  |
| Normal | `<Leader>` + `x` | 現在のペインを閉じる (確認あり)          | wezterm.lua  |
| Normal | `<Leader>` + `z` | ペインのズーム状態を切り替え             | wezterm.lua  |
| Normal | `h` (Navigator)  | 左のペイン/ウィンドウへ移動 (split_nav)  | wezterm.lua  |
| Normal | `j` (Navigator)  | 下のペイン/ウィンドウへ移動 (split_nav)  | wezterm.lua  |
| Normal | `k` (Navigator)  | 上のペイン/ウィンドウへ移動 (split_nav)  | wezterm.lua  |
| Normal | `l` (Navigator)  | 右のペイン/ウィンドウへ移動 (split_nav)  | wezterm.lua  |

##### 5. クリップボード操作 (Clipboard)

| モード | キー      | 機能                       | 設定ファイル |
| :----- | :-------- | :------------------------- | :----------- |
| Normal | `<C-S-c>` | クリップボードへコピー     | wezterm.lua  |
| Normal | `<C-S-v>` | クリップボードから貼り付け | wezterm.lua  |

##### 6. システム・設定 (System)

| モード | キー        | 機能                         | 設定ファイル |
| :----- | :---------- | :--------------------------- | :----------- |
| Normal | `<C-S-r>`   | 設定ファイルの再読み込み     | wezterm.lua  |
| Normal | `<C-S-+>`   | フォントサイズを拡大         | wezterm.lua  |
| Normal | `<C-->`     | フォントサイズを縮小         | wezterm.lua  |
| Normal | `<C-0>`     | フォントサイズをリセット     | wezterm.lua  |
| Normal | `<A-Enter>` | フルスクリーン表示の切り替え | wezterm.lua  |
