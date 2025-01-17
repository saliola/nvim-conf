-- settings for *.tex files
vim.api.nvim_create_autocmd({'BufRead', 'BufNewFile', 'VimEnter'}, {
    pattern = '*.tex',
    callback = function()
        vim.opt.foldlevel = 99
        vim.opt.foldlevelstart = 99
        vim.cmd('syntax off')
    end
})
