local Vessel = {}

function Vessel.setup()
local colors = {
  comment  = "#8b949e",
  keyword  = "#58a6ff",
  string   = "#a5d6a7",
  number   = "#f38ba8",
  func     = "#79c0ff",
  type     = "#7ee787",
  constant = "#f9e2af",
  variable = "#e8eaed",
  operator = "#79c0ff",
}

  local function apply_highlights()
    local hl = vim.api.nvim_set_hl

    -- Syntax
    hl(0, "Comment",    { fg = colors.comment, italic = true })
    hl(0, "Keyword",    { fg = colors.keyword, bold = true })
    hl(0, "String",     { fg = colors.string })
    hl(0, "Number",     { fg = colors.number })
    hl(0, "Function",   { fg = colors.func, bold = true })
    hl(0, "Type",       { fg = colors.type })
    hl(0, "Constant",   { fg = colors.constant })
    hl(0, "Identifier", { fg = colors.variable })
    hl(0, "Operator",   { fg = colors.operator })

    -- Base
    hl(0, "Normal",      { bg = "NONE" })
    hl(0, "NormalNC",    { bg = "NONE" })
    hl(0, "SignColumn",  { bg = "NONE" })
    hl(0, "EndOfBuffer", { bg = "NONE" })
    hl(0, "NormalFloat", { bg = "NONE" })

    -- Harpoon
    hl(0, "HarpoonBorder", { fg = colors.operator, bg = "NONE" })
    hl(0, "HarpoonWindow", { fg = colors.variable, bg = "NONE" })
    hl(0, "HarpoonNormal", { fg = colors.variable, bg = "NONE" })

    -- Telescope
    hl(0, "TelescopeNormal",        { link = "Normal" })
    hl(0, "TelescopeBorder",        { link = "FloatBorder" })
    hl(0, "TelescopePromptNormal",  { link = "Normal" })
    hl(0, "TelescopeResultsNormal", { link = "Normal" })
    hl(0, "TelescopePreviewNormal", { link = "Normal" })
  end

  apply_highlights()

  vim.api.nvim_create_autocmd("ColorScheme", {
    callback = apply_highlights,
  })
end

return Vessel

