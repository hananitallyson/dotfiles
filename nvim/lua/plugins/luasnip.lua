vim.pack.add({
	{ src = "https://github.com/rafamadriz/friendly-snippets" },
	{
		src = "https://github.com/L3MON4D3/LuaSnip",
		version = "v2.5.0",
	},
})

vim.api.nvim_create_autocmd("PackChanged", {
	callback = function(ev)
		if ev.data.spec.name == "LuaSnip" then
			vim.system({ "make", "install_jsregexp" }, { cwd = ev.data.path })
		end
	end,
})

local luasnip = require("luasnip")

luasnip.setup({
	history = true,
	update_events = { "TextChanged", "TextChangedI" },
	delete_check_events = "TextChanged",
})

require("luasnip.loaders.from_vscode").lazy_load()

