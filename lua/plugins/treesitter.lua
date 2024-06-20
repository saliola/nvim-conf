return {
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        config = function()
            local configs = require("nvim-treesitter.configs")
            configs.setup({
                highlight = {
                    enable = true
                },
                indent = {
                    enable = true
                },
                ensure_installed = {
                    "c",
                    "html",
                    "javascript",
                    "latex",
                    "lua",
                    "markdown",
                    "python",
                    "vim",
                    "vimdoc",
                },
                sync_install = false,
            })
        end,
    },
    {
        "nvim-treesitter/nvim-treesitter-context",
    }
}
