return {
    {
        'neovim/nvim-lspconfig',
        lazy = false,
        dependencies = {
            { 'williamboman/mason.nvim', },
            { 'williamboman/mason-lspconfig.nvim', },
            { 'saghen/blink.cmp', },
            {
                'folke/lazydev.nvim',
                ft = 'lua',
                opts = {
                    library = {
                        { path = '${3rd}/luv/library', words = { 'vim%.uv' } },
                    },
                },
            },
        },
        config = function()

            -- configs for the language servers
            local server_configs = {
                clangd = {},
                cssls = {},
                lua_ls = {},

                bashls = { filetypes = { 'bash' } },
                html = { filetypes = { 'html' } },

                pyright = {
                    filetypes = { 'python' },
                    settings = {
                        python = {
                            pythonPath = os.getenv('HOME') .. '/Applications/sage/venv/bin/python3',
                            analysis = {
                                typeCheckingMode = 'basic',
                                diagnosticSeverityOverrides = {
                                    reportCallIssue = 'none',
                                },
                            },
                        },
                    },
                },

                ruff = {
                    filetypes = { 'python' },
                    init_options = {
                        settings = {
                            lint = {
                                preview = true,
                                select = { "E", "F" },
                                ignore = {
                                    "E501", -- line-too-long
                                    "E702", -- multiple-statements-on-one-line-semicolon
                                    "E731", -- lambda-assignment
                                    "F401", -- unused-import  (note: should be handled by pyright as 'hint')
                                },
                            },
                        },
                    },
                },

                texlab = {
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
                },
            }

            -- install and configure servers
            require('mason').setup()

            local ensure_installed = vim.tbl_keys(server_configs)
            local capabilities = require('blink.cmp').get_lsp_capabilities()
            require('mason-lspconfig').setup({
                ensure_installed = ensure_installed,
                automatic_installation = true,
                handlers = {
                    function(server_name)
                        local server = server_configs[server_name] or {}
                        -- This handles overriding only values explicitly passed via server_configs.
                        -- Useful for disabling certain features of an LSP.
                        server.capabilities = vim.tbl_deep_extend('force', {}, capabilities, server.capabilities or {})
                        require('lspconfig')[server_name].setup(server)
                    end,
                },
            })

            -- set up some key maps
            vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
            vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, {})
            vim.keymap.set("n", "<leader>ka", vim.diagnostic.open_float, {})
        end,
    },
}
