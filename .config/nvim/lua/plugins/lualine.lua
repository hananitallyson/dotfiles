return {
  {
    "nvim-lualine/lualine.nvim",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
    config = function()
      local lualine = require("lualine")

      lualine.setup({
        options = {
          theme = {
            normal = { a = { fg = "#020202", bg = "#e8eaed", gui = "bold" },
                       b = { fg = "#e8eaed", bg = "#020202", gui = "bold" },
                       c = { fg = "#e8eaed", bg = "#020202", gui = "bold" },
                       x = { fg = "#e8eaed", bg = "#020202", gui = "bold" },
                       y = { fg = "#e8eaed", bg = "#020202", gui = "bold" },
                       z = { fg = "#e8eaed", bg = "#020202", gui = "bold" } },
            insert = { a = { fg = "#020202", bg = "#e8eaed", gui = "bold" },
                       b = { fg = "#e8eaed", bg = "#020202", gui = "bold" },
                       c = { fg = "#e8eaed", bg = "#020202", gui = "bold" },
                       x = { fg = "#e8eaed", bg = "#020202", gui = "bold" },
                       y = { fg = "#e8eaed", bg = "#020202", gui = "bold" },
                       z = { fg = "#e8eaed", bg = "#020202", gui = "bold" } },
            visual = { a = { fg = "#020202", bg = "#e8eaed", gui = "bold" },
                       b = { fg = "#e8eaed", bg = "#020202", gui = "bold" },
                       c = { fg = "#e8eaed", bg = "#020202", gui = "bold" },
                       x = { fg = "#e8eaed", bg = "#020202", gui = "bold" },
                       y = { fg = "#e8eaed", bg = "#020202", gui = "bold" },
                       z = { fg = "#e8eaed", bg = "#020202", gui = "bold" } },
            replace = { a = { fg = "#020202", bg = "#e8eaed", gui = "bold" },
                        b = { fg = "#e8eaed", bg = "#020202", gui = "bold" },
                        c = { fg = "#e8eaed", bg = "#020202", gui = "bold" },
                        x = { fg = "#e8eaed", bg = "#020202", gui = "bold" },
                        y = { fg = "#e8eaed", bg = "#020202", gui = "bold" },
                        z = { fg = "#e8eaed", bg = "#020202", gui = "bold" } },
            inactive = { a = { fg = "#020202", bg = "#e8eaed", gui = "bold" },
                         b = { fg = "#e8eaed", bg = "#020202", gui = "bold" },
                         c = { fg = "#e8eaed", bg = "#020202", gui = "bold" },
                         x = { fg = "#e8eaed", bg = "#020202", gui = "bold" },
                         y = { fg = "#e8eaed", bg = "#020202", gui = "bold" },
                         z = { fg = "#e8eaed", bg = "#020202", gui = "bold" } },
          },
          component_separators = "",
          section_separators = { left = "", right = "" },
        },
      })

      -- força todos os highlights Lualine
      local hl = vim.api.nvim_set_hl
      local sections = { "LualineNormal", "LualineInsert", "LualineVisual", "LualineReplace", "LualineCommand", "LualineInactive" }
      for _, group in ipairs(sections) do
        hl(0, group, { fg = "#e8eaed", bg = "#020202", bold = true })
      end
    end
  }
}

