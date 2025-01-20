return {
    {
        'lukas-reineke/indent-blankline.nvim',
        main = 'ibl',
        event = 'VeryLazy',
        opts = {
            indent = {
                char = "▏",
            },
            scope = {
                enabled = false,
            },
        },
        config = function(_, opts)
            vim.api.nvim_set_hl(0, "IblIndent", { fg = "#222222" })
            require('ibl').setup(opts)
        end
    }
}
