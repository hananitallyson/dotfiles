local Vessel = {}

function Vessel.setup()
  local palette = {
    comment  = "#a0a8b0", -- mais claro e vibrante
    keyword  = "#4f9fff", -- azul mais intenso
    string   = "#66d28c", -- verde mais vibrante
    number   = "#ff6fa3", -- rosa mais vivo
    func     = "#4faaff", -- azul função mais intenso
    type     = "#8fffa0", -- verde tipo mais forte
    constant = "#ffe590", -- constante mais viva
    variable = "#ffffff", -- branco puro
    operator = "#4faaff", -- operador azul intenso
    bg       = "NONE",    -- fundo transparente
  }

  local function apply_highlights()
    local hl = vim.api.nvim_set_hl

    -- Base
    hl(0, "Normal",         { fg = palette.variable, bg = palette.bg })
    hl(0, "NormalNC",       { fg = palette.variable, bg = palette.bg })
    hl(0, "SignColumn",     { fg = palette.variable, bg = palette.bg })
    hl(0, "EndOfBuffer",    { fg = palette.variable, bg = palette.bg })
    hl(0, "CursorLine",     { bg = "NONE" })
    hl(0, "CursorColumn",   { bg = "NONE" })
    hl(0, "Visual",         { bg = "#2A2A2A" })
    hl(0, "Pmenu",          { fg = palette.variable, bg = palette.bg })
    hl(0, "PmenuSel",       { fg = palette.variable, bg = "#525253" })
    hl(0, "FloatBorder",    { fg = palette.variable, bg = palette.bg })
    hl(0, "NormalFloat",    { fg = palette.variable, bg = palette.bg })

    -- Syntax
    hl(0, "Comment",        { fg = palette.comment, italic = true })
    hl(0, "Keyword",        { fg = palette.keyword, bold = true })
    hl(0, "Conditional",    { fg = palette.keyword })
    hl(0, "Repeat",         { fg = palette.keyword })
    hl(0, "Statement",      { fg = palette.keyword })
    hl(0, "Function",       { fg = palette.func, bold = true })
    hl(0, "Identifier",     { fg = palette.variable })
    hl(0, "String",         { fg = palette.string })
    hl(0, "Character",      { fg = palette.string })
    hl(0, "Number",         { fg = palette.number })
    hl(0, "Float",          { fg = palette.number })
    hl(0, "Boolean",        { fg = palette.constant })
    hl(0, "Constant",       { fg = palette.constant })
    hl(0, "Type",           { fg = palette.type })
    hl(0, "StorageClass",   { fg = palette.type })
    hl(0, "Struct",         { fg = palette.type })
    hl(0, "Operator",       { fg = palette.operator })
    hl(0, "PreProc",        { fg = palette.keyword })
    hl(0, "Macro",          { fg = palette.keyword })
    hl(0, "Include",        { fg = palette.keyword })
    hl(0, "Delimiter",      { fg = palette.operator })
    hl(0, "Special",        { fg = palette.func })

    -- LSP / Diagnostic
    hl(0, "LspReferenceText",        { bg = "#2A2A2A" })
    hl(0, "LspReferenceRead",        { bg = "#2A2A2A" })
    hl(0, "LspReferenceWrite",       { bg = "#2A2A2A" })
    hl(0, "LspCodeLens",             { fg = palette.variable })
    hl(0, "DiagnosticError",         { fg = palette.number })
    hl(0, "DiagnosticWarn",          { fg = palette.keyword })
    hl(0, "DiagnosticInfo",          { fg = palette.func })
    hl(0, "DiagnosticHint",          { fg = palette.type })

    -- Telescope
    hl(0, "TelescopeNormal",        { link = "Normal" })
    hl(0, "TelescopeBorder",        { link = "FloatBorder" })
    hl(0, "TelescopePromptNormal",  { link = "Normal" })
    hl(0, "TelescopeResultsNormal", { link = "Normal" })
    hl(0, "TelescopePreviewNormal", { link = "Normal" })

    -- Harpoon
    hl(0, "HarpoonBorder",  { fg = palette.operator, bg = palette.bg })
    hl(0, "HarpoonWindow",  { fg = palette.variable, bg = palette.bg })
    hl(0, "HarpoonNormal",  { fg = palette.variable, bg = palette.bg })

    -- Lualine com bg NONE
    local lualine_colors = {
      normal = { a = { fg = palette.variable, bg = palette.bg, gui = "bold" },
      b = { fg = palette.variable, bg = palette.bg },
      c = { fg = palette.variable, bg = palette.bg } },
      insert = { a = { fg = palette.variable, bg = palette.bg, gui = "bold" },
      b = { fg = palette.variable, bg = palette.bg },
      c = { fg = palette.variable, bg = palette.bg } },
      visual = { a = { fg = palette.variable, bg = palette.bg, gui = "bold" },
      b = { fg = palette.variable, bg = palette.bg },
      c = { fg = palette.variable, bg = palette.bg } },
      replace = { a = { fg = palette.variable, bg = palette.bg, gui = "bold" },
      b = { fg = palette.variable, bg = palette.bg },
      c = { fg = palette.variable, bg = palette.bg } },
      inactive = { a = { fg = palette.variable, bg = palette.bg, gui = "bold" },
      b = { fg = palette.variable, bg = palette.bg },
      c = { fg = palette.variable, bg = palette.bg } },
    }

    for mode, sections in pairs(lualine_colors) do
      for section, col in pairs(sections) do
        local hl_name = "Lualine" .. mode:gsub("^%l", string.upper) .. section:upper()
        hl(0, hl_name, { fg = col.fg, bg = col.bg, bold = col.gui == "bold" })
      end
    end
  end

  apply_highlights()

  vim.api.nvim_create_autocmd("ColorScheme", {
    callback = apply_highlights,
  })
end

return Vessel

