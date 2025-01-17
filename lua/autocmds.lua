-- Restore cursor position
vim.api.nvim_create_autocmd({'BufReadPost', 'BufWritePost'}, {
    pattern = '*',
    callback = function(args)
        local mark = vim.api.nvim_buf_get_mark(args.buf, '"')
        local line_count = vim.api.nvim_buf_line_count(args.buf)
        if mark[1] > 0 and mark[1] <= line_count then
            vim.cmd('normal! g`"zz')
        end
    end
})

-- latex : set fold / syntax options
vim.api.nvim_create_autocmd({'BufRead', 'BufNewFile', 'VimEnter'}, {
    pattern = '*.tex',
    callback = function()
        vim.opt.foldlevel = 99
        vim.opt.foldlevelstart = 99
        vim.cmd('syntax off')
    end
})
