return {

    {
        "williamboman/mason.nvim",
        config = function()
            require("mason").setup()
        end,
    },

    {
        "williamboman/mason-lspconfig.nvim",
        config = function()
            require("mason-lspconfig").setup({
                ensure_installed = {
                    "bashls",
                    "lua_ls",
                    "pyright",
                    "ruff_lsp",
                    "texlab",
                },
            })
        end,
    },

    {
        "WhoIsSethDaniel/mason-tool-installer.nvim",
        config = function()
            require("mason-tool-installer").setup({
                ensure_installed = {
                    "black",
                    "isort",
                },
            })
        end,
    },

    {
        "neovim/nvim-lspconfig",
        lazy = false,
        config = function()
            local capabilities = require('cmp_nvim_lsp').default_capabilities()

            local lspconfig = require("lspconfig")
            lspconfig.lua_ls.setup({
                capabilities = capabilities
            })

            lspconfig.texlab.setup({
                capabilities = capabilities,
                flags = {
                    debounce_text_changes = 150,
                },
                settings = {
                    texlab = {
                        chktex = {
                            onEdit = true,
                            onOpenAndSave = true,
                        },
                    },
                },
            })

            lspconfig.pyright.setup({
                capabilities = capabilities,
                filetypes = {"python"},
            })

            lspconfig.ruff_lsp.setup({
                capabilities = capabilities,
                filetypes = {"python"},
                init_options = {
                    settings = {
                        args = {'--preview', '--select', 'E,F'},
                    },
                },
            })

            vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
            vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, {})
            vim.keymap.set("n", "<leader>ka", vim.diagnostic.open_float, {})
            vim.keymap.set("n", "]d", vim.diagnostic.goto_next, {})
            vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, {})
        end,
    },
}
