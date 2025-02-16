return {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    opts = {
        styles = {
            notification_history = {
                wo = {
                    wrap = true,
                },
            },
        },
        bigfile = { enabled = true },
        dashboard = {
            enabled = true,
            sections = {
                {
                    pane = 1,
                    section = "terminal",
                    cmd = "colorscript -e pacman-ghosts",
                    width = 54,
                    height = 7,
                    padding = 0,
                    indent = 4,
                },
                {
                    section = "startup",
                    padding = 1
                },
                {
                    section = "keys",
                    gap = 0,
                    padding = 1
                },
                {
                    title = "Recent Files",
                    section = "recent_files",
                    icon = " ",
                    indent = 2,
                    padding = 1
                },
                {
                    title = "Projects",
                    section = "projects",
                    icon = " ",
                    indent = 2,
                    padding = 1
                },
                {
                    title = "Git Status",
                    section = "terminal",
                    icon = " ",
                    enabled = function()
                        return require('snacks').git.get_root() ~= nil
                    end,
                    cmd = "hub status --short --branch --renames",
                    height = 5,
                    padding = 0,
                    ttl = 5 * 60,
                    indent = 3,
                },
            },
            preset = {
                keys = {
                    { icon = " ", key = "f", desc = "Find File", action = ":lua Snacks.dashboard.pick('files')" },
                    { icon = " ", key = "i", desc = "New File", action = ":ene | startinsert" },
                    { icon = " ", key = "g", desc = "Find Text", action = ":lua Snacks.dashboard.pick('live_grep')" },
                    { icon = " ", key = "r", desc = "Recent Files", action = ":lua Snacks.dashboard.pick('oldfiles')" },
                    { icon = " ", key = "c", desc = "Config", action = ":lua Snacks.dashboard.pick('files', {cwd = vim.fn.stdpath('config')})" },
                    { icon = "󰒲 ", key = "l", desc = "Lazy", action = ":Lazy", enabled = package.loaded.lazy ~= nil },
                    { icon = " ", key = "q", desc = "Quit", action = ":qa" },
                },
            },
        },
        gitbrowse = {
            enabled = true
        },
        lazygit = {
            enabled = true,
        },
        notifier = {
            enabled = true,
            timeout = 3000,
        },
        picker = { enabled = true },
        quickfile = { enabled = true },
        statuscolumn = {
            enabled = true,
            folds = {
                open = true,
            },
        },
        toggle = {
            enabled = true,
        },
        words = {
            enabled = true,
            timeout = 3000,
        },
    },
}
