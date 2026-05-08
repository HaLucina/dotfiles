-- (~/dotfiles/readmes/toc_nvim.md)
-- (~/dotfiles/readmes/toc_nvim.md #highlights-lua)


-- ==========================================================================
-- 1. 定数・設定データ
-- ==========================================================================
local Zenkaku = "IdeographicSpace"

local UI_HIGHLIGHTS = {
    Normal      = { bg = "none" },
    NormalNC    = { fg = "#666666", bg = "none" },
    NonText     = { bg = "none" },
    [Zenkaku]   = { bg = "#00FFAA" },
    ColorColumn = { bg = "#454545" },
}

-- ==========================================================================
-- 2. ユーティリティ関数（純粋なロジック）
-- ==========================================================================

--- グレーアウトの対象外とするグループか判定
local function is_ignored_group(name)
    local ignores = { Normal = true, NormalNC = true }
    return ignores[name] or name:match("^WinBar")
end

--- 非アクティブウィンドウ用の winhighlight 文字列を生成
local function generate_grayout_string()
    return vim.iter(vim.api.nvim_get_hl(0, {}))
        :filter(function(name) return not is_ignored_group(name) end)
        :map(function(name) return name .. ":NormalNC" end)
        :join(",")
end

-- ==========================================================================
-- 3. アクション関数（副作用を伴う処理）
-- ==========================================================================

--- 基本的なハイライトグループを適用
local function apply_ui_highlights()
    for name, val in pairs(UI_HIGHLIGHTS) do
        vim.api.nvim_set_hl(0, name, val)
    end
end

--- 全角スペースのマッチを更新
local function refresh_zenkaku_match()
    for _, m in ipairs(vim.fn.getmatches()) do
        if m.group == Zenkaku then
            vim.fn.matchdelete(m.id)
        end
    end
    vim.fn.matchadd(Zenkaku, "　")
end

-- ==========================================================================
-- 4. 実行・自動実行設定
-- ==========================================================================

-- 起動時およびColorScheme変更時に使い回すキャッシュ
local cached_grayout_str = generate_grayout_string()

vim.api.nvim_create_autocmd(
    { "ColorScheme", "WinEnter", "WinLeave", "BufWinEnter", "VimEnter" },
    {
        desc = "Dynamic Universal Gray-out and UI Highlights",
        callback = function(args)
            -- 常に実行する処理
            apply_ui_highlights()
            refresh_zenkaku_match()

            -- カラースキーム変更時のみキャッシュを更新
            if args.event == "ColorScheme" then
                cached_grayout_str = generate_grayout_string()
            end

            -- ウィンドウ状態に応じたハイライトの切り替え
            local is_inactive = (args.event == "WinLeave")
            vim.wo.winhighlight = is_inactive and cached_grayout_str or ""
        end
    }
)

-- 起動時の初期化実行
apply_ui_highlights()
refresh_zenkaku_match()

