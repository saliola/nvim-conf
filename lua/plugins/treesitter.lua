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
                },
                sync_install = false,
            })
        end,
    },
    {
        "nvim-treesitter/nvim-treesitter-context",
    },
    {
        "aaronik/treewalker.nvim",
        config = function ()
            vim.api.nvim_set_keymap('n', 'tj', ':Treewalker Down<CR>', { noremap = true, silent = true })
            vim.api.nvim_set_keymap('n', 'tk', ':Treewalker Up<CR>', { noremap = true, silent = true })
            vim.api.nvim_set_keymap('n', 'th', ':Treewalker Left<CR>', { noremap = true, silent = true })
            vim.api.nvim_set_keymap('n', 'tl', ':Treewalker Right<CR>', { noremap = true, silent = true })
            require('treewalker').setup({
                highlight = true,
            })
        end
    }
}
