return {
    {
        "rcarriga/nvim-notify",
        opts = {
            top_down = false,
            timeout = 50,
            render = "wrapped-compact",
            max_height = function() return math.floor(vim.o.lines * 0.50) end,
            max_width = function() return math.floor(vim.o.columns * 0.45) end,
        }
    },
    {
        "folke/noice.nvim",
        event = "VeryLazy",
        opts = {
        },
        dependencies = {
            "MunifTanjim/nui.nvim",
            "rcarriga/nvim-notify",
        },
        config = function()
            require("noice").setup({
                lsp = {
                    -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
                    override = {
                        ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
                        ["vim.lsp.util.stylize_markdown"] = true,
                        ["cmp.entry.get_documentation"] = true,
                    },
                },
                -- you can enable a preset for easier configuration
                presets = {
                    bottom_search = false, -- use a classic bottom cmdline for search
                    command_palette = true, -- position the cmdline and popupmenu together
                    long_message_to_split = true, -- long messages will be sent to a split
                    inc_rename = false, -- enables an input dialog for inc-rename.nvim
                    lsp_doc_border = true, -- add a border to hover docs and signature help
                },
                -- skip search_count messages instead of showing them as virtual text
                routes = {
                    {
                        filter = { event = "msg_show", kind = "search_count" },
                        opts = { skip = true },
                    },
                },
            })

            -- scrolling in the hover doc
            vim.keymap.set({ "n", "i", "s" }, "<c-f>", function()
                if not require("noice.lsp").scroll(4) then
                    return "<c-f>"
                end
            end, { silent = true, expr = true })

            vim.keymap.set({ "n", "i", "s" }, "<c-d>", function()
                if not require("noice.lsp").scroll(-4) then
                    return "<c-d>"
                end
            end, { silent = true, expr = true })


        end
    }
}
