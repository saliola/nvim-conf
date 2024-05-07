return {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-tree/nvim-web-devicons",
        "MunifTanjim/nui.nvim",
    },
    opts = {
    },
    config = function(_, opts)
        require("neo-tree").setup(opts)
        vim.keymap.set("n", "<C-n>", ":Neotree filesystem toggle right<CR>")
    end,
}
