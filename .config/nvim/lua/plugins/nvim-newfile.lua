return {
  "adibhanna/nvim-newfile.nvim",
  dependencies = { "MunifTanjim/nui.nvim" },
  keys = {
    { "<leader>nf", "<cmd>lua _G.NewFileNoEmoji()<CR>" },
    { "<leader>nd", "<cmd>lua _G.NewDirNoEmoji()<CR>" },
  },
  config = function()
    local newfile = require("nvim-newfile")
    local nui_input = require("nui.input")

    -- Função global para criar arquivo
    _G.NewFileNoEmoji = function()
      local popup = nui_input({
        position = "50%",
        size = { width = 40 },
        border = { style = "rounded", text = { top = { " ", "New file", " "} } },
      }, {
        prompt = "",
        on_submit = function(value)
          if value ~= "" then
            newfile.create_file(value)
          end
        end,
      })
      -- fecha com ESC
      popup:map("i", "<Esc>", function() popup:unmount() end)
      popup:mount()
    end

    -- Função global para criar diretório
    _G.NewDirNoEmoji = function()
      local popup = nui_input({
        position = "50%",
        size = { width = 40 },
        border = { style = "rounded", text = { top = { " ", "New directory", " " } } },
      }, {
        prompt = "",
        on_submit = function(value)
          if value ~= "" then
            vim.fn.mkdir(value, "p") -- cria diretórios intermediários automaticamente
            vim.cmd("edit .")
          end
        end,
      })
      -- fecha com ESC
      popup:map("i", "<Esc>", function() popup:unmount() end)
      popup:mount()
    end
  end,
}

