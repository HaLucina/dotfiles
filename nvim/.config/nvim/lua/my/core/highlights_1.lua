-- 1. ハイライト定義
local Zenkaku = "IdeographicSpace"
local highlights = {
	Normal      = { bg = "none" },
	NormalNC    = { fg = "#666666", bg = "none" }, 
	NonText     = { bg = "none" },
	[Zenkaku]   = { bg = "#00FFAA" },
	ColorColumn = { bg = "#454545" },
}

-- 2. 言語の壁を越えるグレーアウトグループ
local raw_groups = {
	"Normal:NormalNC", "NC:NormalNC",
	-- --- 標準グループ (JSON, Markdown, 全般) ---
	"Constant:NormalNC", "Identifier:NormalNC", "Statement:NormalNC",
	"PreProc:NormalNC", "Type:NormalNC", "Special:NormalNC", "Underlined:NormalNC",
	"String:NormalNC", "Number:NormalNC", "Boolean:NormalNC", "Function:NormalNC",
	"Conditional:NormalNC", "Repeat:NormalNC", "Operator:NormalNC", "Keyword:NormalNC",
	"Comment:NormalNC", "Delimiter:NormalNC", "Title:NormalNC", "Tag:NormalNC",
	
	-- --- Tree-sitter & LSP (Lua, 他プログラミング言語) ---
	-- 予約語・制御構文
	"@keyword:NormalNC", "@keyword.control:NormalNC", "@keyword.control.lua:NormalNC",
	"@keyword.conditional:NormalNC", "@keyword.repeat:NormalNC", "@keyword.return:NormalNC",
	"@keyword.function:NormalNC", "@keyword.operator:NormalNC",

 -- --- MarkdownがリンクしているHTML系ヘッダー ---
	"htmlH1:NormalNC",
	"htmlH2:NormalNC",
	"htmlH3:NormalNC",
	"htmlH4:NormalNC",
	"htmlH5:NormalNC",
	"htmlH6:NormalNC",
	
	-- --- 追加のマークアップ・ラベル系（stacktrace対策） ---
	"markdownH1:NormalNC",
	"markdownH2:NormalNC",
	"markdownH3:NormalNC",
	"markdownH4:NormalNC",
	"markdownH5:NormalNC",
	"markdownH6:NormalNC",
	"@label:NormalNC",
	"Label:NormalNC", 
 
	-- 関数・メソッド
	"@function:NormalNC", "@function.builtin:NormalNC", "@function.call:NormalNC",
	"@method:NormalNC", "@method.call:NormalNC",
	
	-- 【ここが重要】変数・引数・プロパティ（getmなどはここ）
	"@variable:NormalNC", "@variable.builtin:NormalNC", "@variable.parameter:NormalNC",
	"@parameter:NormalNC", "@field:NormalNC", "@property:NormalNC",
	"@member:NormalNC", "@constructor:NormalNC", "@constructor.lua:NormalNC",
	
	-- 記号・値
	"@punctuation.delimiter:NormalNC", "@punctuation.bracket:NormalNC", "@punctuation.special:NormalNC",
	"@string:NormalNC", "@number:NormalNC", "@boolean:NormalNC", "@operator:NormalNC",
	
	-- LSP セマンティックハイライト (さらに強力な上書き)
	"@lsp.type.variable:NormalNC", "@lsp.type.parameter:NormalNC",
	"@lsp.type.property:NormalNC", "@lsp.type.method:NormalNC",
	"@lsp.type.function:NormalNC", "@lsp.type.keyword:NormalNC",
	"@lsp.mod.defaultLibrary:NormalNC", "@lsp.type.namespace:NormalNC",
}

-- 重複を排除して結合 (関数型)
local winhl_str = table.concat(
	vim.iter(pairs(
		vim.iter(raw_groups):fold({}, function(acc, v) acc[v] = true; return acc end)
	))
	:map(function(k, _) return k end)
	:totable(),
	","
)

-- 3. 外観レンダリング
local function render_appearance()
	vim.iter(highlights):each(function(name, val)
		vim.api.nvim_set_hl(0, name, val)
	end)

	vim.iter(vim.fn.getmatches())
		:filter(function(getm) return getm.group == Zenkaku end)
		:each(function(getm) vim.fn.matchdelete(getm.id) end)

	vim.fn.matchadd(Zenkaku, "　")
end

-- 4. 自動実行
vim.api.nvim_create_autocmd(
	{ "ColorScheme", "WinEnter", "WinLeave", "BufWinEnter", "VimEnter" },
	{
		desc = "Complete Language-agnostic Gray-out",
		callback = function(args)
			render_appearance()
			vim.wo.winhighlight = (args.event == "WinLeave") and winhl_str or ""
		end
	}
)

render_appearance()
