-- config/nvim/lua/plugins/harpoon.lua
local function harpoon_telescope(list)
  local conf = require("telescope.config").values
  local pickers = require("telescope.pickers")
  local finders = require("telescope.finders")
  local themes = require("telescope.themes")

  local files = {}
  for _, item in ipairs(list.items) do
    table.insert(files, item.value)
  end

  pickers
  .new(themes.get_ivy({
    prompt_title = "Harpoon",
  }), {
    finder = finders.new_table({
      results = files,
    }),
    previewer = conf.file_previewer({}),
    sorter = conf.generic_sorter({}),
  })
  :find()
end

return {
  {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",

    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope.nvim",
    },

    opts = {},

    keys = {
      {
        "<leader>a",
        function()
          require("harpoon"):list():add()
        end,
        desc = "Harpoon add file",
      },
      {
        "<leader>h",
        function()
          local harpoon = require("harpoon")
          harpoon.ui:toggle_quick_menu(harpoon:list())
        end,
        desc = "Harpoon menu (native)",
      },
      {
        "<leader>fl",
        function()
          harpoon_telescope(require("harpoon"):list())
        end,
        desc = "Harpoon list (Telescope)",
      },
      {
        "<C-p>",
        function()
          require("harpoon"):list():prev()
        end,
        desc = "Harpoon previous",
      },
      {
        "<C-n>",
        function()
          require("harpoon"):list():next()
        end,
        desc = "Harpoon next",
      },
    },
  },
}

