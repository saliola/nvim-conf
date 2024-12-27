return {
    {
        "catppuccin/nvim",
        name = "catppuccin",
        lazy = false,
        priority = 1000,
    },

    {
        "rebelot/kanagawa.nvim",
        lazy = false,
        priority = 1000,
        config = function()
            -- vim.cmd.colorscheme("kanagawa")
        end,
    },

    {
        "KeitaNakamura/neodark.vim",
        lazy = false,
        priority = 1000,
        opts = {},
        config = function()
            -- vim.cmd.colorscheme("neodark")
        end,
    },

    {
        "folke/tokyonight.nvim",
        lazy = false,
        priority = 1000,
        opts = {},
    },

    {
        "zenbones-theme/zenbones.nvim",
        dependencies = "rktjmp/lush.nvim",
        lazy = false,
        priority = 1000,
        opts = {},
        config = function()
            -- vim.g.zenbones_darken_comments = 45
            -- vim.cmd.colorscheme("zenbones")
            -- vim.cmd.colorscheme("neobones")
            vim.cmd.colorscheme("kanagawabones")
        end,
    },
}
