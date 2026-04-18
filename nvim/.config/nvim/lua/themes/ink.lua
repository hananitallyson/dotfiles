local Ink = {}

function Ink.setup()
	local palette = {
		silver = "#a0a8b0",
		blue = "#4f9fff",
		green = "#66d28c",
		pink = "#ff6fa3",
		skyblue = "#4faaff",
		mint = "#8fffa0",
		yellow = "#ffe590",
		gray = "#929292",
		white = "#e8e8e8",
		surface = "NONE",
	}

	local function apply()
		local hl = vim.api.nvim_set_hl

		hl(0, "Normal", { fg = palette.white, bg = palette.surface })
		hl(0, "NormalNC", { fg = palette.white, bg = palette.surface })
		hl(0, "SignColumn", { fg = palette.white, bg = palette.surface })
		hl(0, "EndOfBuffer", { fg = palette.white, bg = palette.surface })
		hl(0, "CursorLine", { bg = "#181818" })
		hl(0, "CursorColumn", { bg = "NONE" })
		hl(0, "Visual", { bg = "#2A2A2A" })

		hl(0, "Pmenu", { fg = palette.white, bg = palette.surface })
		hl(0, "PmenuSel", { fg = palette.white, bg = "#525253" })
		hl(0, "FloatBorder", { fg = palette.white, bg = palette.surface })
		hl(0, "NormalFloat", { fg = palette.white, bg = palette.surface })

		hl(0, "Comment", { fg = palette.silver, italic = false, bold = false })
		hl(0, "Keyword", { fg = palette.blue, bold = true })
		hl(0, "Conditional", { fg = palette.blue })
		hl(0, "Repeat", { fg = palette.blue })
		hl(0, "Statement", { fg = palette.blue })
		hl(0, "Function", { fg = palette.skyblue, bold = true })
		hl(0, "Identifier", { fg = palette.white })
		hl(0, "String", { fg = palette.green })
		hl(0, "Character", { fg = palette.green })
		hl(0, "Number", { fg = palette.pink })
		hl(0, "Float", { fg = palette.pink })
		hl(0, "Boolean", { fg = palette.yellow })
		hl(0, "Constant", { fg = palette.yellow })
		hl(0, "Type", { fg = palette.mint })
		hl(0, "StorageClass", { fg = palette.mint })
		hl(0, "Struct", { fg = palette.mint })
		hl(0, "Operator", { fg = palette.skyblue })
		hl(0, "PreProc", { fg = palette.blue })
		hl(0, "Macro", { fg = palette.blue })
		hl(0, "Include", { fg = palette.blue })
		hl(0, "Delimiter", { fg = palette.skyblue })
		hl(0, "Special", { fg = palette.skyblue })

		hl(0, "LspReferenceText", { bg = "#2A2A2A" })
		hl(0, "LspReferenceRead", { bg = "#2A2A2A" })
		hl(0, "LspReferenceWrite", { bg = "#2A2A2A" })
		hl(0, "LspCodeLens", { fg = palette.white })

		hl(0, "DiagnosticError", { fg = palette.pink })
		hl(0, "DiagnosticWarn", { fg = palette.blue })
		hl(0, "DiagnosticInfo", { fg = palette.skyblue })
		hl(0, "DiagnosticHint", { fg = palette.mint })

		hl(0, "TelescopeNormal", { link = "Normal" })
		hl(0, "TelescopeBorder", { link = "FloatBorder" })
		hl(0, "TelescopePromptNormal", { link = "Normal" })
		hl(0, "TelescopeResultsNormal", { link = "Normal" })
		hl(0, "TelescopePreviewNormal", { link = "Normal" })

		hl(0, "HarpoonBorder", { fg = palette.skyblue, bg = palette.surface })
		hl(0, "HarpoonWindow", { fg = palette.white, bg = palette.surface })
		hl(0, "HarpoonNormal", { fg = palette.white, bg = palette.surface })

		hl(0, "OilDir", { fg = palette.gray, bold = true })
		hl(0, "OilLink", { fg = palette.white, bold = true })
		hl(0, "OilDirHidden", { fg = "#555555", bold = true })
		hl(0, "OilFileHidden", { fg = "#555555" })

		hl(0, "WinBar", { fg = palette.white, bg = palette.surface, bold = true })
		hl(0, "WinBarNC", { fg = palette.white, bg = palette.surface })
	end

	apply()
	vim.api.nvim_create_autocmd("ColorScheme", { callback = apply })
end

return Ink
