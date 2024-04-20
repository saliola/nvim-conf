return {
    "tpope/vim-unimpaired",
    config = function()
        vim.keymap.set("n", "]t", ":tabnext<CR>")
        vim.keymap.set("n", "[t", ":tabprevious<CR>")
    end,
}
