return {
    {
        "zbirenbaum/copilot.lua",
        cmd = "Copilot",
        event = "InsertEnter",
        config = function()
            require("copilot").setup({
                suggestion = {
                    enabled = true,
                    auto_trigger = true,
                }
            })
        end,
    },

    {
        'saghen/blink.cmp',
        dependencies = 'rafamadriz/friendly-snippets',
        version = '*',
        opts = {
            keymap = { preset = 'default' },
            appearance = {
                use_nvim_cmp_as_default = true,
                nerd_font_variant = 'mono'
            },
            completion = {
                list = {
                    selection = "auto_insert",
                },
                accept = {
                    auto_brackets = { enabled = false },
                },
            },
        },
        sources = {
            default = { 'lsp', 'path', 'snippets', 'buffer' },
            providers = {
                buffer = {
                    name = "buffer",
                    module = "blink.cmp.sources.buffer",
                    opts = {
                        get_bufnrs = function()
                            return vim
                                .iter(vim.api.nvim_list_wins())
                                :map(function(win) return vim.api.nvim_win_get_buf(win) end)
                                :filter(function(buf) return vim.bo[buf].buftype ~= 'nofile' end)
                                :totable()
                        end,
                    }
                },
                lsp = {
                    name = "lsp",
                    enabled = true,
                    module = "blink.cmp.sources.lsp",
                    kind = "LSP",
                    score_offset = 1000,
                },
                snippets = {
                    name = "snippets",
                    enabled = true,
                    module = "blink.cmp.sources.snippets",
                    score_offset = 900,
                },
                copilot = {
                    name = "copilot",
                    enabled = true,
                    module = "blink-cmp-copilot",
                    kind = "Copilot",
                    score_offset = -100,
                    async = true,
                },
            },
        },
        signature = {
            enabled = true,
        },
        opts_extend = { "sources.default" }
    },
}
