vim.pack.add { 
    'https://github.com/mason-org/mason.nvim',
    'https://github.com/mason-org/mason-lspconfig.nvim',
    'https://github.com/WhoIsSethDaniel/mason-tool-installer.nvim',
}

require('mason').setup()

require('mason-lspconfig').setup({
  ensure_installed = {
    'bashls',
    'lua_ls',
    'ts_ls',
    'html',
    'cssls',
    'jsonls',
    'pyright',
    'clangd',
  },
})

require('mason-tool-installer').setup({
  ensure_installed = {
    'stylua',
    'prettier',
    'black',
    'clang-format',
    'shfmt',
    'eslint_d',
    'flake8',
  },
})
