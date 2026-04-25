vim.pack.add({ "https://github.com/stevearc/conform.nvim" })

local conform = require("conform")

conform.setup({
	formatters_by_ft = {
		lua = { "stylua" },
		javascript = { "prettier" },
		typescript = { "prettier" },
		html = { "prettier" },
		css = { "prettier" },
		json = { "prettier" },
		python = { "black" },
		c = { "clang_format" },
		cpp = { "clang_format" },
		sh = { "shfmt" },
	},

	format_on_save = {
		timeout_ms = 500,
		lsp_fallback = true,
	},
})

vim.api.nvim_create_autocmd("BufWritePre", {
	pattern = "*",
	callback = function()
		local lines = vim.api.nvim_buf_get_lines(0, -2, -1, false)
		if lines[1] ~= "" then
			vim.api.nvim_buf_set_lines(0, -1, -1, false, { "" })
		end
	end,
})
