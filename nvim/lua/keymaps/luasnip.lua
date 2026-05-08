local luasnip = require("luasnip")

vim.keymap.set("i", "<C-y>", function()
	if luasnip.expandable() then
		luasnip.expand()
	else
		require("blink.cmp").accept()
	end
end)

vim.keymap.set({ "i", "s" }, "<C-l>", function()
	if luasnip.jumpable(1) then
		luasnip.jump(1)
	end
end, { silent = true })

vim.keymap.set({ "i", "s" }, "<C-h>", function()
	if luasnip.jumpable(-1) then
		luasnip.jump(-1)
	end
end, { silent = true })

vim.keymap.set({ "i", "s" }, "<C-n>", function()
	if luasnip.choice_active() then
		luasnip.change_choice(1)
	end
end, { silent = true })

