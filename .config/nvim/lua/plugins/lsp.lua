-- config/nvim/lua/plugins/lsp.lua
return {
  {
    "williamboman/mason.nvim",
    config = true,
  },

  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = { "mason.nvim" },
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = {
          "lua_ls",
          "pyright",
          "ts_ls",
          "bashls",
        },
      })
    end,
  },

  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      local on_attach = function(_, bufnr)
        local map = function(mode, lhs, rhs)
          vim.keymap.set(mode, lhs, rhs, { buffer = bufnr })
        end

        map("n", "gd", vim.lsp.buf.definition)
        map("n", "gr", vim.lsp.buf.references)
        map("n", "K", vim.lsp.buf.hover)
        map("n", "<leader>rn", vim.lsp.buf.rename)
        map("n", "<leader>ca", vim.lsp.buf.code_action)
        map("n", "[d", vim.diagnostic.goto_prev)
        map("n", "]d", vim.diagnostic.goto_next)
      end

      local capabilities = vim.lsp.protocol.make_client_capabilities()

      -- API NOVA (Neovim >= 0.11)
      vim.lsp.config("lua_ls", {
        on_attach = on_attach,
        capabilities = capabilities,
        settings = {
          Lua = {
            diagnostics = { globals = { "vim" } },
            workspace = { checkThirdParty = false },
          },
        },
      })

      vim.lsp.config("pyright", {
        on_attach = on_attach,
        capabilities = capabilities,
      })

      vim.lsp.config("ts_ls", {
        on_attach = on_attach,
        capabilities = capabilities,
      })

      vim.lsp.config("bashls", {
        on_attach = on_attach,
        capabilities = capabilities,
      })

      vim.lsp.config("clangd", {
        on_attach = on_attach,
        capabilities = capabilities,
        cmd = {
          "clangd",
          "--background-index",
          "--clang-tidy",
          "--completion-style=detailed",
          "--header-insertion=iwyu",
        },
      })

    end,
  },
}

