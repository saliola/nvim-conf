return {
    "tpope/vim-commentary",
     config = function()
        vim.keymap.set('n', '<leader>cc', '<Plug>CommentaryLine', {})
        vim.keymap.set('x', '<leader>cc', '<Plug>Commentary', {})
     end
}
