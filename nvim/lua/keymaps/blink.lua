vim.keymap.set("i", "<C-Space>", function()
	require("blink.cmp").show()
end)

vim.keymap.set("i", "<C-y>", function()
	require("blink.cmp").accept()
end)

vim.keymap.set("i", "<C-e>", function()
	require("blink.cmp").hide()
end)

vim.keymap.set("i", "<Tab>", function()
	require("blink.cmp").select_next()
end)

vim.keymap.set("i", "<S-Tab>", function()
	require("blink.cmp").select_prev()
end)

vim.keymap.set("i", "<C-j>", function()
	require("blink.cmp").select_next()
end)

vim.keymap.set("i", "<C-k>", function()
	require("blink.cmp").select_prev()
end)

vim.keymap.set("i", "<C-d>", function()
	require("blink.cmp").scroll_documentation_down()
end)

vim.keymap.set("i", "<C-u>", function()
	require("blink.cmp").scroll_documentation_up()
end)
