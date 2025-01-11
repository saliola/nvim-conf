return {
    {
        "catppuccin/nvim",
        name = "catppuccin",
        lazy = true,
    },

    {
        "rebelot/kanagawa.nvim",
        lazy = true,
    },

    {
        "KeitaNakamura/neodark.vim",
        lazy = true,
    },

    {
        "zenbones-theme/zenbones.nvim",
        dependencies = "rktjmp/lush.nvim",
        event = { "VimEnter" },
        opts = {},
        config = function()
            -- vim.g.zenbones_darken_comments = 45
            -- vim.cmd.colorscheme("zenbones")
            -- vim.cmd.colorscheme("neobones")
            vim.cmd.colorscheme("kanagawabones")
        end,
    },
}
