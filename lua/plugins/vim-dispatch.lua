return {
    "tpope/vim-dispatch",
    init = function()
        vim.g.dispatch_no_maps = 1
        vim.keymap.set("n", "<leader>d", ":Dispatch<CR>", {})
    end,
}
