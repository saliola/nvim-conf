return {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    lazy = true,
    config = function()
        require("todo-comments").setup()
    end,
}
