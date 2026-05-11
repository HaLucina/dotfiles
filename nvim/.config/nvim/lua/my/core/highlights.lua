-- (~/dotfiles/readmes/toc_nvim.md)
-- (~/dotfiles/readmes/toc_nvim.md #highlights-lua)

-- ============================================================================
--  Constants 
-- ============================================================================
local hl_parameters = {
  Normal           = { bg = "none" },                 -- active window
  NormalNC         = { fg = "#666666", bg = "none" }, -- inactive window
  ColorColumn      = { bg = "#454545" },              -- colum 80/100/120 marker
  IdeographicSpace = { bg = "#00FFAA" }               -- zenkaku space
}

local screen_update_events = {
  "BufWinEnter",  -- buffer displayed in window
  "ColorScheme",  -- colorscheme changed
  "VimEnter",     -- nvim startup completed
  "WinEnter",
  "WinLeave",
}

-- ============================================================================
--  Helpers 
-- ============================================================================
local function generate_inactive_hl_tbl()
  return vim.iter(vim.api.nvim_get_hl(0, {}))
    :filter(function(name) return name ~= "NormalNC" end)
    :map(function(name) return name .. ":NormalNC" end)
    :join(",")
end

local function render_appearance()
  vim.iter(hl_parameters)
    :each(function(name, val) vim.api.nvim_set_hl(0, name, val) end)

  vim.iter(vim.fn.getmatches())
    :filter(function(match) return match.group == "IdeographicSpace" end)
    :each(function(match) vim.fn.matchdelete(match.id) end)
  vim.fn.matchadd("IdeographicSpace", "　")
end

-- ============================================================================
--  Events 
-- ============================================================================
do
  local set_inactive_hl   = generate_inactive_hl_tbl()
  local unset_inactive_hl = ""

  vim.api.nvim_create_autocmd(screen_update_events, {
    callback = function(trigger)
      local event = trigger.event

      if event == "VimEnter" or event == "ColorScheme" then
        set_inactive_hl = generate_inactive_hl_tbl() end

      if event == "WinLeave" then 
        vim.wo.winhighlight = set_inactive_hl
      else 
        vim.wo.winhighlight = unset_inactive_hl
      end

      render_appearance()
    end
  })
end

-- ============================================================================
--  Initialize 
-- ============================================================================
render_appearance()
