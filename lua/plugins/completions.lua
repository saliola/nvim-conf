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
                },
                panel = { enabled = false, },
            })
        end,
    },

    {
        'saghen/blink.cmp',
        dependencies = {
            { 'rafamadriz/friendly-snippets', },
            -- { 'moyiz/blink-emoji.nvim', },
            -- { 'Kaiser-Yang/blink-cmp-dictionary', },
        },
        version = '*',
        opts = {
            keymap = {
                preset = 'default',
                ["<C-space>"] = {
                    "select_and_accept",
                },
                ['<Tab>'] = {
                    function(cmp)
                        if cmp.snippet_active() then
                            return cmp.accept()
                        else
                            return cmp.select_next()
                        end
                    end,
                    'snippet_forward',
                    'fallback'
                },
                ['<S-Tab>'] = {
                    function(cmp)
                        if cmp.snippet_active() then
                            return cmp.accept()
                        else
                            return cmp.select_prev()
                        end
                    end,
                    'snippet_backward',
                    'fallback'
                },
                cmdline = {
                    preset = 'default',
                    ["<Tab>"] = {
                        'select_next',
                        'fallback'
                    },
                    ["<S-Tab>"] = {
                        'select_prev',
                        'fallback'
                    },
                },
            },
            completion = {
                accept = {
                    auto_brackets = { enabled = false },
                },
                list = {
                    selection = {
                        auto_insert = function(ctx) return ctx.mode ~= 'normal' end,
                        preselect = function(ctx) return ctx.mode ~= 'cmdline' end,
                    },
                },
                menu = {
                    draw = {
                        columns = {
                            { "kind_icon" },
                            { "label", "label_description", gap = 1 },
                            { "source_name" },
                        },
                        components = {
                            source_name = {
                                text = function(ctx)
                                    return '[' .. ctx.source_name .. ']'
                                end,
                            },
                        },
                    },
                },
                documentation = {
                    auto_show = true,
                    auto_show_delay_ms = 0,
                },
            },
        },
        signature = {
            enabled = true,
            window = { border = 'rounded' },
        },
        sources = {
            default = { 'lsp', 'path', 'snippets', 'buffer', 'lazydev', 'emoji', 'dictionary' },
            providers = {
                buffer = {
                    name = "buffer",
                    module = "blink.cmp.sources.buffer",
                    score_offset = 500,
                },
                -- dictionary = {
                --     name = "dictionary",
                --     module = "blink-cmp-dictionary",
                --     opts = {
                --         prefix_min_len = 3,
                --         get_command = {
                --             "rg",
                --             "--color=never",
                --             "--no-line-number",
                --             "--no-messages",
                --             "--no-filename",
                --             "--ignore-case",
                --             "--",
                --             "${prefix}",
                --             vim.fn.expand("~/.config/nvim/words"),
                --         },
                --     },
                -- },
                -- emoji = {
                --     module = "blink-emoji",
                --     name = "emoji",
                --     score_offset = 15,
                --     opts = { insert = true },
                -- },
                -- lazydev = {
                --     name = "lazydev",
                --     module = "lazydev.integrations.blink",
                --     score_offset = 100,
                -- },
                lsp = {
                    name = "lsp",
                    enabled = true,
                    module = "blink.cmp.sources.lsp",
                    kind = "LSP",
                    fallback = { "snippets", "buffer" },
                    score_offset = 1000,
                },
                path = {
                    name = "path",
                    enabled = true,
                    module = "blink.cmp.sources.path",
                    score_offset = 800,
                    opts = {
                        trailing_slash = false,
                        label_trailing_slash = true,
                        get_cwd = function(ctx)
                            return vim.fn.expand(("#%d:p:h"):format(ctx.bufnr))
                        end,
                        show_hidden = false,
                    },
                },
                snippets = {
                    name = "snippets",
                    enabled = true,
                    max_items = 8,
                    min_keyword_length = 2,
                    module = "blink.cmp.sources.snippets",
                    score_offset = 900,
                },
            },
        },
        opts_extend = { "sources.default" }
    },
}
