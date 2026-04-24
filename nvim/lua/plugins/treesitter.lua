vim.pack.add({
	{ src = "https://github.com/nvim-treesitter/nvim-treesitter", version = "main" },
})

local nts = require("nvim-treesitter")
nts.install({
	"lua",
	"python",
	"javascript",
	"typescript",
	"html",
	"css",
	"json",
	"bash",
	"markdown",
	"c",
	"cpp",
	"c_sharp",
})

vim.api.nvim_create_autocmd("PackChanged", {
	callback = function()
		nts.update()
	end,
})

vim.api.nvim_create_autocmd("FileType", {
	callback = function(args)
		local lang = vim.treesitter.language.get_lang(args.match)
		if lang and vim.treesitter.language.add(lang) then
			vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
			vim.treesitter.start()
		end
	end,
})
