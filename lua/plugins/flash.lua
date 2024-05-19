return {
    "folke/flash.nvim",
    event = "VeryLazy",
    opts = {
        jump = {
            nohlsearch = true,
        },
        prompt = {
            -- Place the prompt above the statusline.
            win_config = { row = -3 },
        },
        label = {
            -- style = "eol",
            style = "inline",
            rainbow = {
                enabled = false,
                -- number between 1 and 9
                shade = 9,
            },
            highlight = {
                -- show a backdrop with hl FlashBackdrop
                backdrop = true,
                -- Highlight the search matches
                matches = true,
                -- extmark priority
                priority = 5000,
                groups = {
                    match = "FlashMatch",
                    current = "FlashCurrent",
                    backdrop = "FlashBackdrop",
                    label = "FlashLabel",
                },
            },
        },
        search = {
            mode = "fuzzy",
            exclude = {
                'notify',
                'cmp_menu',
                'noice',
                'flash_prompt',
                'qf',
                function(win)
                    -- Floating windows from bqf.
                    if vim.api.nvim_buf_get_name(vim.api.nvim_win_get_buf(win)):match 'BqfPreview' then
                        return true
                    end

                    -- Non-focusable windows.
                    return not vim.api.nvim_win_get_config(win).focusable
                end,
            },
        },
    },
    keys = {
        {
            "S",
            mode = { "n", "x", "o" },
            function()
                require("flash").jump()
            end,
            desc = "Flash"
        },
  },
}
