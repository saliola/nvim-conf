return {
    {
        'echasnovski/mini.surround',
        version = false,
        config = function()
            require('mini.surround').setup()
        end,
    },
    {
        'echasnovski/mini.indentscope',
        version = false,
        opts = {
            symbol = "▏",
            mappings = {
                object_scope = "ii",
                object_scope_with_border = "ai",
                goto_top = '[i',
                goto_bottom = ']i',
            },
        }
        -- config = function()
        --     require('mini.indentscope').setup()
        -- end,
    },
}
