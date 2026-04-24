vim.pack.add({ "https://github.com/stevearc/oil.nvim" })

require("oil").setup({
	default_file_explorer = true,
	columns = { "permissions", "size", "mtime" },
	delete_to_trash = true,
	skip_confirm_for_simple_edits = true,
	view_options = {
		show_hidden = true,
	},
})

vim.api.nvim_create_autocmd("FileType", {
	pattern = "oil",
	callback = function()
		vim.wo.winbar = string.format("%3s %-9s %-2s %-12s %s", " ", "PERM", "SIZE", "MTIME", "NAME")
	end,
})
