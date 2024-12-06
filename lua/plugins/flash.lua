return {
    "folke/flash.nvim",
    event = "VeryLazy",
    opts = {
        search = {
            mode = "fuzzy",
        },
        jump = {
            nohlsearch = true,
        },
    },
    keys = {
        {
            "S",
            mode = { "n", "x", "o" },
            function()
                require("flash").jump()
            end,
            desc = "Flash (jump)",
        },
    },
    config = function()
        flash_label_hl = vim.api.nvim_get_hl(0, { name = "FlashLabel" })
        flash_label_hl.fg = "Yellow"
        flash_label_hl.bg = "#000000"
        flash_label_hl.italic = true
        vim.api.nvim_set_hl(0, "FlashLabel", flash_label_hl)
    end,
}
