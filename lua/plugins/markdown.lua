return {
    {
        "iamcco/markdown-preview.nvim",
        cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
        build = "cd app && npm install && git restore .",
        init = function()
            vim.g.mkdp_filetypes = { "markdown" }
            -- vim.g.mkdp_markdown_css = vim.fn.stdpath("data") .. "/path/to/style.css"
        end,
        ft = { "markdown" },
    }
}
