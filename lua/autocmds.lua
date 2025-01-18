vim.api.nvim_create_autocmd({'BufReadPost'}, {
    desc = "Restore cursor position",
    callback = function(args)
        local mark = vim.api.nvim_buf_get_mark(args.buf, '"')
        local line_count = vim.api.nvim_buf_line_count(args.buf)
        if mark[1] > 0 and mark[1] <= line_count then
            vim.cmd('normal! g`"zvzz')
        end
    end
})

vim.api.nvim_create_autocmd({'BufRead', 'BufNewFile', 'VimEnter'}, {
    desc = "Set fold / syntax options for latex files",
    pattern = '*.tex',
    callback = function()
        vim.opt.foldlevel = 99
        vim.opt.foldlevelstart = 99
        vim.cmd('syntax off')
    end
})

vim.api.nvim_create_autocmd("TextYankPost", {
    desc = "Highlight yanked text",
    callback = function()
        vim.highlight.on_yank({higroup = "IncSearch", timeout = 200})
    end,
})
