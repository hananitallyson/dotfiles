return {
  "adibhanna/nvim-newfile.nvim",
  dependencies = { "MunifTanjim/nui.nvim" },
  keys = {
    { "<leader>nf", "<cmd>lua NewFile()<CR>" },
    { "<leader>nd", "<cmd>lua NewDir()<CR>" },
  },
  config = function()
    local newfile = require("nvim-newfile")
    local nui_input = require("nui.input")
    local vim_fn = vim.fn

    -- Configuração do plugin
    newfile.setup({
      languages = {
        go = { enabled = true, package_format = "package %s", use_directory_name = true, file_extensions = { "go" } },
        php = { enabled = true, package_format = "<?php\n\nnamespace %s;", use_directory_name = false, file_extensions = { "php" } },
        java = { enabled = true, package_format = "package %s;", use_directory_name = false, file_extensions = { "java" } },
        rust = { enabled = true, package_format = "// Module: %s", use_directory_name = true, file_extensions = { "rs" } },
        python = { enabled = true, package_format = '"""Package: %s"""', use_directory_name = false, file_extensions = { "py" } },
      },
      project_root_patterns = { "go.mod", "composer.json", "pom.xml", "build.gradle", "build.sbt", "package.json", ".git", "Cargo.toml", "Makefile" },
      ui = { border_style = "rounded", prompt_text = "File name: ", width = 50, height = 1 },
      notifications = { enabled = true },
    })

    -- Função genérica para criar popup
    local function create_popup(title, on_submit)
      local popup = nui_input({
        position = "50%",
        size = { width = 50 },
        border = { style = "rounded", text = { top = { " ", title, " " } } },
      }, {
        prompt = "",
        on_submit = on_submit,
      })
      popup:map("i", "<Esc>", function() popup:unmount() end)
      popup:mount()
    end

    -- Criar arquivo na pasta do buffer atual
    _G.NewFile = function()
      local current_dir = vim.fn.expand("%:p:h")
      create_popup("New file", function(value)
        if value ~= "" then
          local old_dir = vim.fn.getcwd()
          vim.cmd("lcd " .. current_dir)
          newfile.create_file(value)
          vim.cmd("lcd " .. old_dir)
        end
      end)
    end

    _G.NewDir = function()
      local current_dir = vim.fn.expand("%:p:h") -- pasta do arquivo atual
      create_popup("New directory", function(value)
        if value ~= "" then
          local dir_path = current_dir .. "/" .. value
          vim.fn.mkdir(dir_path, "p")  -- cria diretórios intermediários
          vim.cmd("edit " .. dir_path)  -- abre a nova pasta
        end
      end)
    end

  end,
}

