return {
    {
        "azabiong/vim-highlighter",
        init = function()
            vim.api.nvim_set_keymap("n", "<leader>w", ":Hi+<CR>", { noremap = true, desc = "highlight word under cursor (:Hi+)" })
            vim.api.nvim_set_keymap("n", "<leader>0", ":Hi clear<CR>", { noremap = true, desc = "clear all highlights" })
            for i = 1, 9 do
                vim.api.nvim_set_keymap("n", "<leader>" .. i, ":" .. i .. "Hi+<CR>", { noremap = true, desc = "highlight word under cursor with color " .. i })
            end
        end,
    }
}
