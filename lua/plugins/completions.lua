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
        event = { "InsertEnter" },
        dependencies = {
            { 'rafamadriz/friendly-snippets', },
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
                            { "label", "label_description", gap = 1 },
                            { "kind_icon", "kind", gap = 1 },
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
                    auto_show = false,
                    auto_show_delay_ms = 0,
                },
            },
        },
        sources = {
            default = { 'lsp', 'path', 'snippets', 'buffer', },
            providers = {
                buffer = {
                    name = "buffer",
                    module = "blink.cmp.sources.buffer",
                },
                lsp = {
                    name = "lsp",
                    module = "blink.cmp.sources.lsp",
                },
                path = {
                    name = "path",
                    module = "blink.cmp.sources.path",
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
                    module = "blink.cmp.sources.snippets",
                },
            },
        },
        opts_extend = { "sources.default" },
    },
}
