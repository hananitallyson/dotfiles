local Vessel = {}

function Vessel.setup()
  -- Paleta completa dentro do setup
  local palette = {
    -- Cores principais
    black   = "#282828",
    red     = "#EE5396",
    green   = "#25be6a",
    yellow  = "#08BDBA",
    blue    = "#78A9FF",
    magenta = "#BE95FF",
    cyan    = "#33B1FF",
    orange  = "#3DDBD9",
    pink    = "#FF7EB6",
    white   = "#e8eaed",  -- branco fixo

    -- Comentários
    comment = "#9CA0A4",

    -- Fg
    fg0     = "#F8FAFC", -- lighter fg
    fg1     = "#F2F4F8", -- default fg
    fg2     = "#C1C3C6", -- darker fg (status line)
    fg3     = "#8C8F93", -- darker fg (line numbers, fold columns)

    -- Seleção
    sel0    = "#2A2A2A", -- visual selection bg / popup bg
    sel1    = "#525253", -- popup selection / search bg
  }

  -- Derivando cores de syntax da paleta
  local colors = {
    comment  = palette.comment,
    keyword  = palette.magenta,
    string   = palette.green,
    number   = palette.orange,
    func     = palette.blue,
    type     = palette.yellow,
    constant = palette.orange,
    variable = palette.white,
    operator = palette.blue,
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

