return {
    {
        "catppuccin/nvim",
        name = "catppuccin",
        lazy = true,
    },

    {
        "vague2k/vague.nvim",
        lazy = true,
        config = function()
            require("vague").setup({})
        end
    },

    {
        "rebelot/kanagawa.nvim",
        event = { "VimEnter" },
        lazy = true,
        config = function()
            require('kanagawa').setup({
                overrides = function(colors)
                    local palette = colors.palette
                    return {
                        ["@markup.heading.1"] = { fg = palette.dragonRed },
                        ["@markup.heading.2"] = { fg = palette.dragonOrange2 },
                        ["@markup.heading.3"] = { fg = palette.dragonYellow },
                        ["@markup.heading.4"] = { fg = palette.dragonGreen },
                        ["@markup.heading.5"] = { fg = palette.dragonTeal },
                        ["@markup.heading.6"] = { fg = palette.dragonAsh },
                    }
                end,
            })
            vim.cmd.colorscheme("kanagawa-dragon")
        end,
    },
}
