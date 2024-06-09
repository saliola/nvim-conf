return {
    {
        'lukas-reineke/indent-blankline.nvim',
        main = 'ibl',
        event = 'VeryLazy',
        config = function ()
            -- disable first level scope indent: https://github.com/lukas-reineke/indent-blankline.nvim/issues/824
            local hooks = require("ibl.hooks")
            hooks.register(hooks.type.VIRTUAL_TEXT, function(_, _, _, virt_text)
                if virt_text[1] and virt_text[1][1] == '▏' then
                    virt_text[1] = { ' ', { "@ibl.whitespace.char.1" } }
                end
                return virt_text
            end
            )
            local opts = {
                indent = {
                    char = "▏",
                },
                scope = {
                    enabled = false,
                },
            }
            require("ibl").setup(opts)
        end
    },
}

