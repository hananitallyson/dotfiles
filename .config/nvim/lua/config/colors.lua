local Vessel = {}

function Vessel.setup()

local colors = {
  comment   = "#8b949e",
  keyword   = "#58a6ff",
  string    = "#a5d6a7",
  number    = "#f38ba8",
  func      = "#f9c2a5",
  type      = "#7ee787",
  constant  = "#f9e2af",
  variable  = "#c9d1d9",
  operator  = "#79c0ff",
}

vim.api.nvim_set_hl(0, "Comment",     { fg = colors.comment, italic = true })
vim.api.nvim_set_hl(0, "Keyword",     { fg = colors.keyword, bold = true })
vim.api.nvim_set_hl(0, "String",      { fg = colors.string })
vim.api.nvim_set_hl(0, "Number",      { fg = colors.number })
vim.api.nvim_set_hl(0, "Function",    { fg = colors.func, bold = true })
vim.api.nvim_set_hl(0, "Type",        { fg = colors.type })
vim.api.nvim_set_hl(0, "Constant",    { fg = colors.constant })
vim.api.nvim_set_hl(0, "Identifier",  { fg = colors.variable })
vim.api.nvim_set_hl(0, "Operator",    { fg = colors.operator })

vim.api.nvim_set_hl(0, "Normal",      { bg = "NONE" })
vim.api.nvim_set_hl(0, "NormalNC",    { bg = "NONE" })
vim.api.nvim_set_hl(0, "SignColumn",  { bg = "NONE" })
vim.api.nvim_set_hl(0, "EndOfBuffer", { bg = "NONE" })

vim.api.nvim_create_autocmd("ColorScheme", {
    pattern = "*",
    callback = function()
      vim.api.nvim_set_hl(0, "HarpoonBorder", { fg = colors.operator, bg = "NONE" })
      vim.api.nvim_set_hl(0, "HarpoonWindow", { fg = colors.variable, bg = "NONE" })
      vim.api.nvim_set_hl(0, "HarpoonNormal", { fg = colors.variable, bg = "NONE" })
      vim.api.nvim_set_hl(0, "NormalFloat", { bg = "NONE" }) -- garante transparência
    end,
})

end

return Vessel
