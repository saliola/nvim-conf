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
                    "basedpyright",
                    "ruff",
                    "texlab",
                    "cssls",
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
        dependencies = {
            { 'saghen/blink.cmp', },
            {
                "folke/lazydev.nvim",
                ft = "lua",
                opts = {
                    library = {
                        { path = "${3rd}/luv/library", words = { "vim%.uv" } },
                    },
                },
            },
        },
        config = function()
            local capabilities = require('blink.cmp').get_lsp_capabilities()
            local lspconfig = require('lspconfig')

            lspconfig.bashls.setup({
                capabilities = capabilities,
                filetypes = {"bash"},
            })

            lspconfig.lua_ls.setup({
                capabilities = capabilities
            })

            lspconfig.cssls.setup({
                capabilities = capabilities
            })

            lspconfig.basedpyright.setup({
                capabilities = capabilities,
                filetypes = {"python"},
                settings = {
                    python = {
                        pythonPath = "$HOME/Applications/sage/local/var/lib/sage/venv-python3.12/bin/python",
                        analysis = {
                            diagnosticSeverityOverrides = {
                                reportFunctionMemberAccess = "information",
                                reportCallIssue = "information",
                            },
                        },
                    },
                },
            })

            lspconfig.ruff.setup({
                capabilities = capabilities,
                filetypes = {"python"},
                init_options = {
                    settings = {
                        -- extra CLI arguments
                        -- https://docs.astral.sh/ruff/configuration/#command-line-interface
                        -- https://docs.astral.sh/ruff/rules/
                        args = {
                            '--preview',
                            '--select', 'E,F',
                            "--ignore", table.concat({
                                "E501", -- line-too-long
                                "E702", -- multiple-statements-on-one-line-semicolon
                                "E731", -- lambda-assignment
                                "F401", -- unused-import  (note: should be handled by pyright as 'hint')
                            }, ','),
                        },
                    },
                },
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

            vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
            vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, {})
            vim.keymap.set("n", "<leader>ka", vim.diagnostic.open_float, {})
        end,
    },
}
