--- BRACKET MAPPINGS

vim.keymap.set("n", "]b", ":bnext<CR>",                                     { desc = "Next buffer", noremap = true, silent = true })
vim.keymap.set("n", "[b", ":bprev<CR>",                                     { desc = "Previous buffer", noremap = true, silent = true })

-- navigate through diagnostics
vim.keymap.set("n", "]d", vim.diagnostic.goto_next,                         { desc = "Next diagnostic" })
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev,                         { desc = "Previous diagnostic" })

-- move line up/down respecting indent (inspired by ]e and [e in vim-unimpaired)
vim.keymap.set("n", "]e", ":m .+1<CR>==",                                   { desc = "Move line down", noremap = true, silent = true })
vim.keymap.set("n", "[e", ":m .-2<CR>==",                                   { desc = "Move line up", noremap = true, silent = true })

-- navigate marks
vim.keymap.set("n", "]m", require('marks').next,                            { desc = "Next mark", noremap = true, silent = true })
vim.keymap.set("n", "[m", require('marks').prev,                            { desc = "Previous mark", noremap = true, silent = true })
vim.keymap.set("n", "dm", require('marks').delete_line,                     { desc = "Delete mark", noremap = true, silent = true })

-- navigate through the quickfix list (these mappings are coming to nvim-0.11)
vim.keymap.set("n", "]q", ":try|cnext|catch|cfirst|endtry <CR>",            { desc = "Next quickfix entry", noremap = true, silent = true })
vim.keymap.set("n", "[q", ":try|cprev|catch|clast |endtry <CR>",            { desc = "Previous quickfix entry", noremap = true, silent = true })
vim.keymap.set("n", "]Q", ":cfirst<CR>",                                    { desc = "First quickfix entry", noremap = true, silent = true })
vim.keymap.set("n", "[Q", ":clast<CR>",                                     { desc = "Last quickfix entry", noremap = true, silent = true })


--- LEADER MAPPINGS

vim.keymap.set("n", "<leader><space>", "za",                                { desc = "Toggle fold", noremap = true, silent = true })
vim.keymap.set("n", "<leader>cc", "gcc",                                    { desc = "Comment line", remap = true })
vim.keymap.set("x", "<leader>cc", "gc",                                     { desc = "Comment selection", remap = true })

-- telescope
vim.keymap.set("n", "<leader>fc", require("telescope.builtin").commands,    { desc = "Telescope find commands" })
vim.keymap.set("n", "<leader>ff", require("telescope.builtin").find_files,  { desc = "Telescope find files" })
vim.keymap.set("n", "<leader>fg", require("telescope.builtin").live_grep,   { desc = "Telescope live grep" })
vim.keymap.set("n", "<leader>fh", require("telescope.builtin").help_tags,   { desc = "Telescope help tags" })
vim.keymap.set("n", "<leader>fp", require("telescope.builtin").builtin,     { desc = "Telescope find builtin pickers" })
vim.keymap.set("n", "<leader>fx",
    function()
        require("telescope.builtin").find_files({
            cwd = vim.fn.stdpath("config")
        })
    end,                                                                    { desc = "Telescope find config files" })

-- misc
vim.keymap.set("n", "<leader>J", "mzvipJ`z",                                { desc = "Join paragraph", noremap = true, silent = true }) -- Steve Losh
vim.keymap.set("n", "<leader>tn", ":tabnew<Space>",                         { desc = "New tab", noremap = true, silent = false })
vim.keymap.set("n", "<leader>zf", "mzzMzvzz10<c-e>`z",                      { desc = "Focus current line", noremap = true, silent = true }) -- Steve Losh


--- OTHER MAPPINGS

vim.keymap.set("n", "<Esc><Esc>", "<Esc>:nohlsearch<CR><Esc>",              { desc = "Clear search", noremap = true, silent = true })
vim.keymap.set("n", "U", "<c-r>",                                           { desc = "Redo", noremap = true, silent = true })
vim.keymap.set("n", "<C-W>|", "<C-W>v",                                     { desc = "Split window vertically", noremap = true, silent = true })
vim.keymap.set("n", "<C-W>-", "<C-W>s",                                     { desc = "Split window horizontally", noremap = true, silent = true })
