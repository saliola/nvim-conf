return {
    "chentoast/marks.nvim",
    event = "VeryLazy",
    config = function()
        require("marks").setup({
            default_mappings = false
        })
        vim.api.nvim_create_user_command('MarksDeleteAll', function() require('marks').delete_buf() end, {})
    end
}
