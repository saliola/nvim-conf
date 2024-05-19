-- select most recently changed/pasted text
vim.cmd([[nnoremap <expr> gV '`[' . getregtype()[0] . '`]']])

return {
    "gbprod/yanky.nvim",
    opts = {
        ring = {
            history_length = 50,
        },
        highlight = {
            timer = 250,
        },
        system_clipboard = {
            sync_with_ring = true,
        },
    },
    keys = {
        {
            "<leader>fy",
            function()
                require("telescope").extensions.yank_history.yank_history({})
            end,
            desc = "Open Yank History",
        },
        {
            "<leader>y",
            '"+yy',
            mode = {"n"},
            desc = "Yank line to clipboard",
        },
        {
            "<leader>y",
            '"+y',
            mode = {"v"},
            desc = "Yank visual selection to clipboard",
        },
        {
            "<leader>p",
            "<Plug>(YankyPutAfterLinewise)",
            desc = "Put yanked text in line below",
        },
        {
            "<leader>P",
            "<Plug>(YankyPutBeforeLinewise)",
            desc = "Put yanked text in line above",
        },
    },
}
