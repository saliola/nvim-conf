return {
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        config = function()
            local configs = require("nvim-treesitter.configs")
            configs.setup({
                highlight = {
                    enable = true,
                    additional_vim_regex_highlighting = { "latex", "markdown" },
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
                    "yaml",
                },
                sync_install = false,
            })
        end,
    },
}
