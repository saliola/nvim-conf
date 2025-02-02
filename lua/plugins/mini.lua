return {
    {
        'echasnovski/mini.nvim',
        config = function()
            local miniclue = require('mini.clue')
            miniclue.setup({
                triggers = {
                    -- Leader triggers
                    { mode = 'n', keys = '<leader>' },
                    { mode = 'x', keys = '<leader>' },
                    { mode = 'n', keys = '<localleader>' },
                    { mode = 'x', keys = '<localleader>' },

                    -- bracket keys
                    { mode = 'n', keys = ']' },
                    { mode = 'n', keys = '[' },
                    { mode = 'x', keys = ']' },
                    { mode = 'x', keys = '[' },

                    -- Built-in completion
                    { mode = 'i', keys = '<C-x>' },

                    -- `g` key
                    { mode = 'n', keys = 'g' },
                    { mode = 'x', keys = 'g' },

                    -- Marks
                    { mode = 'n', keys = "'" },
                    { mode = 'n', keys = '`' },
                    { mode = 'x', keys = "'" },
                    { mode = 'x', keys = '`' },

                    -- Registers
                    { mode = 'n', keys = '"' },
                    { mode = 'x', keys = '"' },
                    { mode = 'i', keys = '<C-r>' },
                    { mode = 'c', keys = '<C-r>' },

                    -- `s` key (to show mini.surround keymaps)
                    { mode = 'n', keys = 's' },
                    { mode = 'x', keys = 's' },

                    -- Window commands
                    { mode = 'n', keys = '<C-w>' },

                    -- `z` key
                    { mode = 'n', keys = 'z' },
                    { mode = 'x', keys = 'z' },
                },

                clues = {
                    miniclue.gen_clues.builtin_completion(),
                    miniclue.gen_clues.g(),
                    miniclue.gen_clues.marks(),
                    miniclue.gen_clues.registers(),
                    miniclue.gen_clues.windows(),
                    miniclue.gen_clues.z(),
                    { mode = 'n', keys = '<leader>h', desc = '+Highlight' },
                    { mode = 'n', keys = '<leader>b', desc = '+Buffers' },
                },

                window = {
                    delay = 0,

                    config = {
                        width = 50,
                    },
                }
            })

            require('mini.indentscope').setup({
                symbol = "▏",
                mappings = {
                    object_scope = "ii",
                    object_scope_with_border = "ai",
                    goto_top = '[i',
                    goto_bottom = ']i',
                },
                draw = {
                    animation = function()
                        return 0
                    end
                }
            })

            require('mini.surround').setup()
        end,
    },
}
