vim.pack.add({ "https://github.com/nvim-lualine/lualine.nvim" })

local lualine = require("lualine")

local base = {
	a = { fg = "#0a0a0a", bg = "#e8e8e8", gui = "bold" },
	b = { fg = "#808080", bg = "#0a0a0a", gui = "bold" },
	c = { fg = "#e8e8e8", bg = "#0a0a0a", gui = "bold" },
	x = { fg = "#e8e8e8", bg = "#0a0a0a", gui = "bold" },
	y = { fg = "#e8e8e8", bg = "#0a0a0a", gui = "bold" },
	z = { fg = "#e8e8e8", bg = "#0a0a0a", gui = "bold" },
}

local theme = {
	normal = base,
	insert = base,
	visual = base,
	replace = base,
	inactive = base,
}

lualine.setup({
	options = {
		theme = theme,
		component_separators = "",
		section_separators = { left = "", right = "" },
		globalstatus = true,
	},

	sections = {
		lualine_a = { { "mode", upper = true } },

		lualine_b = {
			{ "branch", icon = "" },
			{ "diff" },
		},

		lualine_c = {
			{ "filename", path = 0, symbols = { modified = "[+]", readonly = "[-]", unnamed = "[No Name]" } },
			{ "filesize" },
		},

		lualine_x = {
			{ "diagnostics" },
			{ "searchcount" },
			{ "encoding" },
			{ "fileformat" },
			{ "filetype" },
		},

		lualine_y = {
			{ "progress" },
		},

		lualine_z = {
			{ "location" },
			{
				function()
					return vim.fn.line("$")
				end,
			},
		},
	},

	inactive_sections = {
		lualine_a = {},
		lualine_b = {},
		lualine_c = { { "filename", path = 1 } },
		lualine_x = { { "location" } },
		lualine_y = {},
		lualine_z = {},
	},
})
