vim.pack.add({ "https://github.com/stevearc/conform.nvim" })

local conform = require("conform")

conform.setup({
    formatters_by_ft = {
        lua = { "stylua" },
        javascript = { "prettier" },
        typescript = { "prettier" },
        html = { "prettier" },
        css = { "prettier" },
        json = { "prettier" },
        python = { "black" },
        c = { "clang_format" },
        cpp = { "clang_format" },
        sh = { "shfmt" },
    },

    formatters = {
        black = {
            prepend_args = {
                "--line-length",
                "120",
            },
        },

        prettier = {
            prepend_args = {
                "--tab-width",
                "4",
                "--use-tabs",
                "false",
                "--print-width",
                "120",
            },
        },

        stylua = {
            prepend_args = {
                "--indent-type",
                "Spaces",
                "--indent-width",
                "4",
            },
        },

        shfmt = {
            prepend_args = {
                "-i",
                "4",
                "-ci",
                "-bn",
            },
        },

        clang_format = {
            prepend_args = {
                "-style={IndentWidth: 4, TabWidth: 4, UseTab: Never, ColumnLimit: 120}",
            },
        },
    },

    format_on_save = {
        timeout_ms = 500,
        lsp_fallback = true,
    },
})

vim.api.nvim_create_autocmd("BufWritePre", {
    pattern = "*",
    callback = function()
        local lines = vim.api.nvim_buf_get_lines(0, -2, -1, false)
        if lines[1] ~= "" then
            vim.api.nvim_buf_set_lines(0, -1, -1, false, { "" })
        end
    end,
})

