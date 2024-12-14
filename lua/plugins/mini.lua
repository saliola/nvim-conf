return {
    {
        'echasnovski/mini.nvim',
        config = function()
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

            -- require('mini.surround').setup()
        end,
    },
}
