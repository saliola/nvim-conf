return {
    "ntpeters/vim-better-whitespace",
    event = "BufEnter",
    init = function()
        vim.g.better_whitespace_operator = false
    end,
}
