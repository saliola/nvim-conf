return {
    {
        "garymjr/nvim-snippets",
        keys = {
            {
                "<Tab>",
                function()
                    if vim.snippet.active({ direction = 1 }) then
                        vim.schedule(function()
                            vim.snippet.jump(1)
                        end)
                        return
                    end
                    return "<Tab>"
                end,
                expr = true,
                silent = true,
                mode = "i",
            },
            {
                "<Tab>",
                function()
                    vim.schedule(function()
                        vim.snippet.jump(1)
                    end)
                end,
                expr = true,
                silent = true,
                mode = "s",
            },
            {
                "<S-Tab>",
                function()
                    if vim.snippet.active({ direction = -1 }) then
                        vim.schedule(function()
                            vim.snippet.jump(-1)
                        end)
                        return
                    end
                    return "<S-Tab>"
                end,
                expr = true,
                silent = true,
                mode = { "i", "s" },
            },
        },
        opts = {
            friendly_snippets = false,
            create_cmp_source = true,
        },
    },
    {
        "hrsh7th/nvim-cmp",
        dependencies = {
            "hrsh7th/cmp-nvim-lsp",
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-path",
            "hrsh7th/cmp-cmdline",
        },
        config = function()
            local cmp = require("cmp")

            cmp.setup({
                snippet = {
                    expand = function(args)
                        vim.snippet.expand(args.body)
                    end,
                },
                window = {
                    completion = cmp.config.window.bordered(),
                    documentation = cmp.config.window.bordered(),
                },
                mapping = cmp.mapping.preset.insert({
                    ['<CR>'] = cmp.mapping.confirm({ select = true })
                }),
                sources = cmp.config.sources({
                    { name = "snippets" },
                    { name = "buffer" },
                    { name = "path" },
                    { name = "nvim_lsp" },
                }),
            })
        end,
    },
}
