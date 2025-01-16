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
                    cmd = "colorscript -e crunchbang-mini",
                    width = 50,
                    height = 5,
                    padding = 0,
                    indent = 6,
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
                        return Snacks.git.get_root() ~= nil
                    end,
                    cmd = "hub status --short --branch --renames",
                    height = 5,
                    padding = 0,
                    ttl = 5 * 60,
                    indent = 3,
                },
            },
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
        words = {
            enabled = true,
            timeout = 3000,
        },
    },
}
