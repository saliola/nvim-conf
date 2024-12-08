return {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    opts = {
        bigfile = { enabled = true },
        dashboard = {
            enabled = true,
            sections = {
                { section = "header" },
                { section = "keys", gap = 1, padding = 1 },
                { section = "startup" },
            },
        },
        lazygit = {
            enabled = true,
        },
        notifier = {
            enabled = true,
            timeout = 3000,
        },
        quickfile = { enabled = true },
        statuscolumn = {
            enabled = true,
            folds = {
                open = true,
            },
        },
        words = {
            enabled = true,
            timeout = 3000,
        },
    },
    keys = {
        { "<leader>nh",  function() Snacks.notifier.show_history() end, desc = "Notification History" },
        { "<leader>nd", function() Snacks.notifier.hide() end, desc = "Dismiss All Notifications" },
        { "<leader>lg", function() Snacks.lazygit() end, desc = "Lazygit (cwd)" },
        { "<leader>ll", function() Snacks.lazygit.log() end, desc = "Lazygit Log (cwd)" },
        { ']]', function() Snacks.words.jump( vim.v.count1, true) end, desc = 'Next LSP highlight' },
        { '[[', function() Snacks.words.jump(-vim.v.count1, true) end, desc = 'Prev LSP highlight' },
    }
}
