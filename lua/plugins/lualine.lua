return {
    "nvim-lualine/lualine.nvim",
    event = "VimEnter",
    config = function()
        local lualine = require("lualine")
        local lazy_status = require("lazy.status")

        lualine.setup({
            options = {
                theme = "dracula",
            },
            sections = {
                lualine_x = {
                    {
                        function()
                            return vim.o.spelllang
                        end,
                        cond = function()
                            return vim.bo.filetype == 'markdown' and vim.wo.spell
                        end,
                        color = { gui = 'italic' },
                        padding = 1,
                    },
                    {
                        lazy_status.updates,
                        cond = lazy_status.has_updates,
                        color = { fg = "#ff9e64" },
                    },
                    { "encoding" },
                    { "fileformat" },
                    { "filetype" },
                },
            }
        })
    end,
}
