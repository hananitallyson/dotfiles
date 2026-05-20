local M = {}

function M.setup()
	local c = {
		bg = "NONE",
		bg_alt = "#181818",
		bg_highlight = "#3c4048",
		fg = "#e8e8e8",
		grey = "#7b8496",
		blue = "#5ea1ff",
		green = "#5eff6c",
		cyan = "#5ef1ff",
		red = "#ff6e5e",
		yellow = "#f1ff5e",
		magenta = "#ff5ef1",
		pink = "#ff5ea0",
		orange = "#ffbd5e",
		purple = "#bd5eff",
		none = "NONE",
	}

	local function apply()
		local hl = vim.api.nvim_set_hl

		hl(0, "Normal", { fg = c.fg, bg = c.bg })
		hl(0, "NormalFloat", { fg = c.fg, bg = c.bg })
		hl(0, "NormalNC", { fg = c.fg, bg = c.bg })
		hl(0, "FloatBorder", { fg = c.bg_highlight, bg = c.bg })
		hl(0, "FloatTitle", { fg = c.blue, bg = c.bg, bold = true })

		hl(0, "CursorLine", { bg = c.bg_alt })
		hl(0, "CursorLineNr", { fg = c.blue, bold = true })
		hl(0, "CursorColumn", { bg = c.bg_alt })
		hl(0, "Cursor", { fg = c.bg, bg = c.fg })
		hl(0, "TermCursor", { fg = c.bg, bg = c.fg })

		hl(0, "LineNr", { fg = c.bg_highlight })
		hl(0, "SignColumn", { fg = c.bg_highlight, bg = c.bg })
		hl(0, "ColorColumn", { bg = c.bg_alt })

		hl(0, "StatusLine", { fg = c.fg, bg = c.bg_alt })
		hl(0, "StatusLineNC", { fg = c.grey, bg = c.bg_alt })
		hl(0, "WinBar", { fg = c.fg, bg = c.bg, bold = true })
		hl(0, "WinBarNC", { fg = c.bg, bg = c.bg })
		hl(0, "WinSeparator", { fg = c.bg_highlight })

		hl(0, "TabLine", { fg = c.grey, bg = c.bg_alt })
		hl(0, "TabLineFill", { bg = c.bg_alt })
		hl(0, "TabLineSel", { fg = c.fg, bg = c.bg, bold = true })

		hl(0, "Pmenu", { fg = c.fg, bg = c.bg_alt })
		hl(0, "PmenuSel", { fg = c.fg, bg = c.bg_highlight })
		hl(0, "PmenuSbar", { bg = c.bg_highlight })
		hl(0, "PmenuThumb", { bg = c.grey })
		hl(0, "PmenuKind", { fg = c.cyan, bg = c.bg_alt })
		hl(0, "PmenuKindSel", { fg = c.cyan, bg = c.bg_highlight })
		hl(0, "PmenuExtra", { fg = c.grey, bg = c.bg_alt })

		hl(0, "Visual", { bg = c.bg_highlight })
		hl(0, "VisualNOS", { bg = c.bg_highlight })

		hl(0, "Search", { fg = c.bg, bg = c.yellow })
		hl(0, "IncSearch", { fg = c.bg, bg = c.orange, bold = true })
		hl(0, "CurSearch", { fg = c.bg, bg = c.orange, bold = true })
		hl(0, "Substitute", { fg = c.bg, bg = c.red })

		hl(0, "MatchParen", { fg = c.cyan, bold = true, underline = true })

		hl(0, "NonText", { fg = c.bg_highlight })
		hl(0, "Whitespace", { fg = c.bg_highlight })
		hl(0, "SpecialKey", { fg = c.bg_highlight })
		hl(0, "EndOfBuffer", { fg = c.bg })
		hl(0, "Conceal", { fg = c.grey })

		hl(0, "Folded", { fg = c.grey, bg = c.bg_alt })
		hl(0, "FoldColumn", { fg = c.grey, bg = c.bg })

		hl(0, "Directory", { fg = c.blue, bold = true })
		hl(0, "Title", { fg = c.blue, bold = true })
		hl(0, "Question", { fg = c.cyan })
		hl(0, "MoreMsg", { fg = c.green })
		hl(0, "ModeMsg", { fg = c.fg, bold = true })
		hl(0, "MsgArea", { fg = c.fg })
		hl(0, "MsgSeparator", { fg = c.bg_highlight })

		hl(0, "WarningMsg", { fg = c.yellow })
		hl(0, "ErrorMsg", { fg = c.red })

		hl(0, "SpellBad", { undercurl = true, sp = c.red })
		hl(0, "SpellCap", { undercurl = true, sp = c.yellow })
		hl(0, "SpellRare", { undercurl = true, sp = c.cyan })
		hl(0, "SpellLocal", { undercurl = true, sp = c.blue })

		hl(0, "Underlined", { underline = true })
		hl(0, "Bold", { bold = true })
		hl(0, "Italic", { italic = true })

		hl(0, "Comment", { fg = c.grey, italic = false })
		hl(0, "SpecialComment", { fg = c.grey })

		hl(0, "Constant", { fg = c.yellow })
		hl(0, "String", { fg = c.green })
		hl(0, "Character", { fg = c.green })
		hl(0, "Number", { fg = c.pink })
		hl(0, "Boolean", { fg = c.yellow })
		hl(0, "Float", { fg = c.pink })

		hl(0, "Identifier", { fg = c.fg })
		hl(0, "Function", { fg = c.blue, bold = true })

		hl(0, "Statement", { fg = c.blue })
		hl(0, "Conditional", { fg = c.blue })
		hl(0, "Repeat", { fg = c.blue })
		hl(0, "Label", { fg = c.blue })
		hl(0, "Operator", { fg = c.cyan })
		hl(0, "Keyword", { fg = c.blue, bold = true })
		hl(0, "Exception", { fg = c.red })

		hl(0, "PreProc", { fg = c.blue })
		hl(0, "Include", { fg = c.blue })
		hl(0, "Define", { fg = c.blue })
		hl(0, "Macro", { fg = c.blue })
		hl(0, "PreCondit", { fg = c.blue })

		hl(0, "Type", { fg = c.cyan })
		hl(0, "StorageClass", { fg = c.cyan })
		hl(0, "Structure", { fg = c.cyan })
		hl(0, "Typedef", { fg = c.cyan })

		hl(0, "Special", { fg = c.cyan })
		hl(0, "SpecialChar", { fg = c.cyan })
		hl(0, "Tag", { fg = c.cyan })
		hl(0, "Delimiter", { fg = c.cyan })
		hl(0, "Debug", { fg = c.red })

		hl(0, "Error", { fg = c.red })
		hl(0, "Todo", { fg = c.bg, bg = c.yellow, bold = true })

		hl(0, "@variable", { fg = c.fg })
		hl(0, "@variable.builtin", { fg = c.red })
		hl(0, "@variable.parameter", { fg = c.fg })
		hl(0, "@variable.member", { fg = c.fg })

		hl(0, "@constant", { fg = c.yellow })
		hl(0, "@constant.builtin", { fg = c.yellow })
		hl(0, "@constant.macro", { fg = c.yellow })

		hl(0, "@string", { fg = c.green })
		hl(0, "@string.escape", { fg = c.cyan })
		hl(0, "@string.special", { fg = c.cyan })
		hl(0, "@string.regexp", { fg = c.orange })

		hl(0, "@character", { fg = c.green })
		hl(0, "@number", { fg = c.pink })
		hl(0, "@number.float", { fg = c.pink })
		hl(0, "@boolean", { fg = c.yellow })

		hl(0, "@function", { fg = c.blue, bold = true })
		hl(0, "@function.builtin", { fg = c.blue })
		hl(0, "@function.call", { fg = c.blue })
		hl(0, "@function.macro", { fg = c.blue })
		hl(0, "@function.method", { fg = c.blue, bold = true })
		hl(0, "@function.method.call", { fg = c.blue })

		hl(0, "@constructor", { fg = c.cyan })

		hl(0, "@keyword", { fg = c.blue, bold = true })
		hl(0, "@keyword.function", { fg = c.blue, bold = true })
		hl(0, "@keyword.operator", { fg = c.cyan })
		hl(0, "@keyword.import", { fg = c.blue })
		hl(0, "@keyword.return", { fg = c.blue })
		hl(0, "@keyword.exception", { fg = c.red })
		hl(0, "@keyword.conditional", { fg = c.blue })
		hl(0, "@keyword.repeat", { fg = c.blue })

		hl(0, "@operator", { fg = c.cyan })
		hl(0, "@punctuation.delimiter", { fg = c.fg })
		hl(0, "@punctuation.bracket", { fg = c.fg })
		hl(0, "@punctuation.special", { fg = c.cyan })

		hl(0, "@type", { fg = c.cyan })
		hl(0, "@type.builtin", { fg = c.cyan })
		hl(0, "@type.qualifier", { fg = c.cyan })
		hl(0, "@type.definition", { fg = c.cyan })

		hl(0, "@attribute", { fg = c.blue })
		hl(0, "@property", { fg = c.fg })
		hl(0, "@label", { fg = c.cyan })
		hl(0, "@namespace", { fg = c.cyan })
		hl(0, "@module", { fg = c.cyan })

		hl(0, "@comment", { fg = c.grey })
		hl(0, "@comment.todo", { fg = c.bg, bg = c.yellow, bold = true })
		hl(0, "@comment.error", { fg = c.bg, bg = c.red, bold = true })
		hl(0, "@comment.warning", { fg = c.bg, bg = c.orange, bold = true })
		hl(0, "@comment.note", { fg = c.bg, bg = c.cyan, bold = true })

		hl(0, "@tag", { fg = c.blue })
		hl(0, "@tag.attribute", { fg = c.cyan })
		hl(0, "@tag.delimiter", { fg = c.cyan })

		hl(0, "@markup.heading", { fg = c.blue, bold = true })
		hl(0, "@markup.italic", { italic = true })
		hl(0, "@markup.bold", { bold = true })
		hl(0, "@markup.underline", { underline = true })
		hl(0, "@markup.strikethrough", { strikethrough = true })
		hl(0, "@markup.link", { fg = c.cyan, underline = true })
		hl(0, "@markup.link.url", { fg = c.cyan, underline = true })
		hl(0, "@markup.raw", { fg = c.green })
		hl(0, "@markup.quote", { fg = c.grey, italic = true })
		hl(0, "@markup.list", { fg = c.blue })

		hl(0, "DiagnosticError", { fg = c.red })
		hl(0, "DiagnosticWarn", { fg = c.yellow })
		hl(0, "DiagnosticInfo", { fg = c.cyan })
		hl(0, "DiagnosticHint", { fg = c.green })
		hl(0, "DiagnosticOk", { fg = c.green })

		hl(0, "DiagnosticUnderlineError", { undercurl = true, sp = c.red })
		hl(0, "DiagnosticUnderlineWarn", { undercurl = true, sp = c.yellow })
		hl(0, "DiagnosticUnderlineInfo", { undercurl = true, sp = c.cyan })
		hl(0, "DiagnosticUnderlineHint", { undercurl = true, sp = c.green })

		hl(0, "DiagnosticVirtualTextError", { fg = c.red })
		hl(0, "DiagnosticVirtualTextWarn", { fg = c.yellow })
		hl(0, "DiagnosticVirtualTextInfo", { fg = c.cyan })
		hl(0, "DiagnosticVirtualTextHint", { fg = c.green })

		hl(0, "DiagnosticSignError", { fg = c.red })
		hl(0, "DiagnosticSignWarn", { fg = c.yellow })
		hl(0, "DiagnosticSignInfo", { fg = c.cyan })
		hl(0, "DiagnosticSignHint", { fg = c.green })

		hl(0, "LspReferenceText", { bg = c.bg_highlight })
		hl(0, "LspReferenceRead", { bg = c.bg_highlight })
		hl(0, "LspReferenceWrite", { bg = c.bg_highlight })
		hl(0, "LspInlayHint", { fg = c.grey })
		hl(0, "LspCodeLens", { fg = c.grey })

		hl(0, "DiffAdd", { fg = c.green, bg = c.bg_alt })
		hl(0, "DiffChange", { fg = c.yellow, bg = c.bg_alt })
		hl(0, "DiffDelete", { fg = c.red, bg = c.bg_alt })
		hl(0, "DiffText", { fg = c.bg, bg = c.yellow })

		hl(0, "GitSignsAdd", { fg = c.green })
		hl(0, "GitSignsChange", { fg = c.yellow })
		hl(0, "GitSignsDelete", { fg = c.red })
		hl(0, "GitSignsAddNr", { fg = c.green })
		hl(0, "GitSignsChangeNr", { fg = c.yellow })
		hl(0, "GitSignsDeleteNr", { fg = c.red })
		hl(0, "GitSignsAddLn", { bg = c.bg_alt })
		hl(0, "GitSignsChangeLn", { bg = c.bg_alt })
		hl(0, "GitSignsCurrentLineBlame", { fg = c.grey, italic = true })

		hl(0, "TelescopeNormal", { link = "Normal" })
		hl(0, "TelescopePromptNormal", { link = "Normal" })
		hl(0, "TelescopeResultsNormal", { link = "Normal" })
		hl(0, "TelescopePreviewNormal", { link = "Normal" })
		hl(0, "TelescopeBorder", { link = "FloatBorder" })
		hl(0, "TelescopePromptBorder", { link = "FloatBorder" })
		hl(0, "TelescopeResultsBorder", { link = "FloatBorder" })
		hl(0, "TelescopePreviewBorder", { link = "FloatBorder" })
		hl(0, "TelescopeTitle", { fg = c.blue, bold = true })
		hl(0, "TelescopePromptTitle", { fg = c.blue, bold = true })
		hl(0, "TelescopeResultsTitle", { fg = c.blue, bold = true })
		hl(0, "TelescopePreviewTitle", { fg = c.blue, bold = true })
		hl(0, "TelescopeMatching", { fg = c.cyan, bold = true })
		hl(0, "TelescopeSelection", { fg = c.fg, bg = c.bg_highlight })
		hl(0, "TelescopeSelectionCaret", { fg = c.blue, bg = c.bg_highlight })
		hl(0, "TelescopePromptCounter", { fg = c.grey })

		hl(0, "NvimTreeNormal", { link = "Normal" })
		hl(0, "NvimTreeNormalNC", { link = "Normal" })
		hl(0, "NvimTreeFolderIcon", { fg = c.blue })
		hl(0, "NvimTreeFolderName", { fg = c.blue })
		hl(0, "NvimTreeOpenedFolderName", { fg = c.cyan })
		hl(0, "NvimTreeRootFolder", { fg = c.purple, bold = true })
		hl(0, "NvimTreeFileName", { fg = c.fg })
		hl(0, "NvimTreeSpecialFile", { fg = c.yellow })
		hl(0, "NvimTreeExecFile", { fg = c.green })
		hl(0, "NvimTreeGitDirty", { fg = c.yellow })
		hl(0, "NvimTreeGitNew", { fg = c.green })
		hl(0, "NvimTreeGitDeleted", { fg = c.red })
		hl(0, "NvimTreeIndentMarker", { fg = c.bg_highlight })
		hl(0, "NvimTreeWinSeparator", { fg = c.bg_highlight })
		hl(0, "NvimTreeCursorLine", { bg = c.bg_highlight })

		hl(0, "OilDir", { fg = c.grey, bold = true })
		hl(0, "OilLink", { fg = c.fg, bold = true })
		hl(0, "OilDirHidden", { fg = "#555555", bold = true })
		hl(0, "OilFileHidden", { fg = "#555555" })

		hl(0, "HarpoonBorder", { fg = c.cyan, bg = c.none })
		hl(0, "HarpoonWindow", { fg = c.fg, bg = c.none })
		hl(0, "HarpoonNormal", { fg = c.fg, bg = c.none })

		hl(0, "WhichKey", { fg = c.cyan })
		hl(0, "WhichKeyGroup", { fg = c.purple })
		hl(0, "WhichKeyDesc", { fg = c.fg })
		hl(0, "WhichKeySeparator", { fg = c.grey })
		hl(0, "WhichKeyFloat", { link = "NormalFloat" })
		hl(0, "WhichKeyBorder", { link = "FloatBorder" })
		hl(0, "WhichKeyValue", { fg = c.grey })

		hl(0, "CmpItemAbbr", { fg = c.fg })
		hl(0, "CmpItemAbbrMatch", { fg = c.cyan, bold = true })
		hl(0, "CmpItemAbbrMatchFuzzy", { fg = c.cyan })
		hl(0, "CmpItemAbbrDeprecated", { fg = c.grey, strikethrough = true })
		hl(0, "CmpItemKind", { fg = c.purple })
		hl(0, "CmpItemMenu", { fg = c.grey })

		hl(0, "IblIndent", { fg = c.bg_highlight })
		hl(0, "IblScope", { fg = c.bg_highlight })
		hl(0, "IndentBlanklineChar", { fg = c.bg_highlight })

		hl(0, "NotifyERRORBorder", { fg = c.red })
		hl(0, "NotifyWARNBorder", { fg = c.yellow })
		hl(0, "NotifyINFOBorder", { fg = c.cyan })
		hl(0, "NotifyDEBUGBorder", { fg = c.grey })
		hl(0, "NotifyTRACEBorder", { fg = c.purple })
		hl(0, "NotifyERRORIcon", { fg = c.red })
		hl(0, "NotifyWARNIcon", { fg = c.yellow })
		hl(0, "NotifyINFOIcon", { fg = c.cyan })
		hl(0, "NotifyDEBUGIcon", { fg = c.grey })
		hl(0, "NotifyTRACEIcon", { fg = c.purple })
		hl(0, "NotifyERRORTitle", { fg = c.red, bold = true })
		hl(0, "NotifyWARNTitle", { fg = c.yellow, bold = true })
		hl(0, "NotifyINFOTitle", { fg = c.cyan, bold = true })
		hl(0, "NotifyDEBUGTitle", { fg = c.grey, bold = true })
		hl(0, "NotifyTRACETitle", { fg = c.purple, bold = true })

		hl(0, "NoiceCmdline", { link = "NormalFloat" })
		hl(0, "NoiceCmdlinePopup", { link = "NormalFloat" })
		hl(0, "NoiceCmdlinePopupBorder", { fg = c.blue })
		hl(0, "NoiceCmdlineIcon", { fg = c.blue })
		hl(0, "NoiceConfirm", { link = "NormalFloat" })
		hl(0, "NoiceConfirmBorder", { fg = c.blue })

		hl(0, "LazyNormal", { link = "NormalFloat" })
		hl(0, "LazyBorder", { link = "FloatBorder" })
		hl(0, "LazyButton", { fg = c.fg, bg = c.bg_highlight })
		hl(0, "LazyButtonActive", { fg = c.bg, bg = c.blue, bold = true })
		hl(0, "LazyH1", { fg = c.blue, bold = true })
		hl(0, "LazyH2", { fg = c.purple, bold = true })
		hl(0, "LazySpecial", { fg = c.cyan })
		hl(0, "LazyReasonPlugin", { fg = c.purple })

		vim.g.terminal_color_0 = c.bg
		vim.g.terminal_color_1 = c.red
		vim.g.terminal_color_2 = c.green
		vim.g.terminal_color_3 = c.yellow
		vim.g.terminal_color_4 = c.blue
		vim.g.terminal_color_5 = c.magenta
		vim.g.terminal_color_6 = c.cyan
		vim.g.terminal_color_7 = c.fg
		vim.g.terminal_color_8 = c.bg_highlight
		vim.g.terminal_color_9 = c.red
		vim.g.terminal_color_10 = c.green
		vim.g.terminal_color_11 = c.yellow
		vim.g.terminal_color_12 = c.blue
		vim.g.terminal_color_13 = c.purple
		vim.g.terminal_color_14 = c.cyan
		vim.g.terminal_color_15 = c.fg
	end

	vim.cmd("hi clear")
	if vim.fn.exists("syntax_on") == 1 then
		vim.cmd("syntax reset")
	end
	vim.o.termguicolors = true
	vim.g.colors_name = "cyberdream_custom"

	apply()
	vim.api.nvim_create_autocmd("ColorScheme", {
		pattern = "cyberdream_custom",
		callback = apply,
	})
end

return M

