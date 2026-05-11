-- Documents
-- (~/dotfiles/readmes/toc_nvim.md #options-lua)

-- ============================================================================
--  General Environment & Fixes
-- ============================================================================
-- システム全体やエンコーディング、特定バグへの対策

vim.opt.encoding     = "utf-8"
vim.opt.fileencoding = "utf-8"

-- Error detected while processing CursorMoved Autocommands for
-- "<buffer=1>"..function <SNR>22_preview_color[41]..<SNR>22_get_hi_str:
-- line    3:
-- E121: Undefined variable: s:termguicolors
--
-- nvimで~/.dircolors を編集してカーソルを下に移動していくと上記のエラーが
-- いちいち出てきた。
-- 解決策は以下をnvim.luaに追記すること。
-- 参考 ＞ https://github.com/neovim/neovim/issues/32097
vim.opt.termguicolors = true

-- Netrw: リストスタイルを Tree 形式 (3) に固定
vim.cmd("let g:netrw_liststyle = 3")


-- ============================================================================
--  Layout & UI Representation
-- ============================================================================
-- 画面分割、サインカラム、不透明度などの構造的設定

vim.opt.splitright = true -- 垂直分割時に右に開く
vim.opt.splitbelow = true -- 水平分割時に下に開く
vim.opt.signcolumn = "yes" -- テキストの横揺れ防止のため常時表示
vim.opt.background = "dark"

-- Opacity (Transparency)
vim.opt.winblend = 0 -- ウィンドウの透過度
vim.opt.pumblend = 0 -- ポップアップメニューの透過度


-- ============================================================================
--  Indentation & Text Rules
-- ============================================================================
-- タブ、インデント、折り返し、文字数の目安

local TEXT_WIDTH_GUIDE = { 80, 100, 120 }

vim.opt.tabstop     = 2     -- タブ幅
vim.opt.shiftwidth  = 2     -- 自動インデント幅
vim.opt.expandtab   = true  -- タブをスペースに展開
vim.opt.autoindent  = true  -- 前行のインデントを継続
vim.opt.wrap        = false -- 行の折り返しを無効化
vim.opt.colorcolumn = TEXT_WIDTH_GUIDE


-- ============================================================================
--  Section 4: Navigation & Visual Feedback
-- ============================================================================
-- 行番号、カーソル行、検索挙動、仮想編集

vim.opt.number         = true  -- 行番号表示
vim.opt.relativenumber = true  -- 相対行番号（現在行以外）
vim.opt.cursorline     = true  -- カーソル行の強調
vim.opt.virtualedit    = "block" -- 文字がない場所にも矩形選択で入れるようにする

-- Search
vim.opt.ignorecase = true -- 検索時に大文字小文字を区別しない
vim.opt.smartcase  = true -- 大文字が含まれる場合は区別する


-- ============================================================================
--  System Integration & Performance
-- ============================================================================
-- クリップボード、スワップファイル、後退キーの挙動

vim.opt.clipboard:append("unnamedplus") -- システムクリップボードと同期
vim.opt.swapfile  = false              -- スワップファイルを作成しない
vim.opt.backspace = "indent,eol,start" -- 削除キーの挙動を標準的にする


