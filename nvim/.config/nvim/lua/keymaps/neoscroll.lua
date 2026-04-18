vim.keymap.set({ "n", "v", "x" }, "<C-j>", function()
	require("neoscroll").scroll(0.2, { duration = 120 })
end)

vim.keymap.set({ "n", "v", "x" }, "<C-k>", function()
	require("neoscroll").scroll(-0.2, { duration = 120 })
end)
