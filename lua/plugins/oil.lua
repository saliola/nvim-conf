return {
    {
        'stevearc/oil.nvim',
        dependencies = { "nvim-tree/nvim-web-devicons" },
        config = function ()
            local oil = require("oil")
            oil.setup({
                keymaps = {
                    ["q"] = "actions.close",
                }
            })
            vim.keymap.set("n", "-", oil.toggle_float, {})
        end,
    },
}
