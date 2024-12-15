return {
    "akinsho/bufferline.nvim",
    version = "*",
    opts = {
        options = {
            mode = "bufferline",
            numbers = "both",
            indicator = {
                style = "underline",
            },
            buffer_close_icon = '󰅖',
            diagnostics = "nvim_lsp",
        },
    },
}
