local builtin = require("telescope.builtin")

vim.keymap.set("n", "<leader>ff", function()
	local cwd = vim.fn.getcwd()
	local launched_with_dir = vim.fn.argc() > 0

	require("telescope.builtin").find_files({
		cwd = launched_with_dir and cwd or vim.fn.expand("~"),
		hidden = true,
	})
end, { desc = "Find files" })

vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Live grep" })
vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Buffers" })
vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Help tags" })
vim.keymap.set("n", "<leader>fr", builtin.oldfiles, { desc = "Recent files" })
vim.keymap.set("n", "<leader>fs", builtin.grep_string, { desc = "Grep word under cursor" })
