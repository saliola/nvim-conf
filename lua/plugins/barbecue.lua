return {
    {
        "utilyre/barbecue.nvim",
        event = { "BufRead", "BufNewFile" },
        name = "barbecue",
        dependencies = {
            {
                "SmiteshP/nvim-navic",
                "nvim-tree/nvim-web-devicons",
            },
        },
        config = function()
            require("barbecue").setup()
        end,
    },
}
