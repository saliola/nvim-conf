return {
    "tpope/vim-dispatch",
    config = function()
        vim.keymap.set("n", "<leader>d", ":Dispatch<CR>", {})
        vim.keymap.set("n", "<leader>D", ":Dispatch!<CR>", {})
        vim.keymap.set("n", "<leader>m", ":Make<CR>", {})
        vim.keymap.set("n", "<leader>M", ":Make!<CR>", {})
    end,
}
