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

vim.api.nvim_create_autocmd("TextYankPost", {
    desc = "Highlight yanked text",
    callback = function()
        vim.highlight.on_yank({higroup = "IncSearch", timeout = 200})
    end,
})

vim.api.nvim_create_autocmd("FileType", {
    desc = 'Move help window to the far right',
    pattern = 'help',
    callback = function()
        vim.cmd('wincmd L')
    end,
})
