local Snacks = require('snacks')

--[[ BRACKET MAPPINGS ]]--

-- navigate marks
-- use the builtin ]' / [' and ]` / [`

-- LSP highlights
vim.keymap.set("n", ']]', function() Snacks.words.jump( vim.v.count1, true) end, { desc = 'Next LSP highlight' })
vim.keymap.set("n", '[[', function() Snacks.words.jump(-vim.v.count1, true) end, { desc = 'Prev LSP highlight' })

-- navigate buffers
vim.keymap.set("n", "]b", ":bnext<CR>",                                     { desc = "Next buffer", noremap = true, silent = true })
vim.keymap.set("n", "[b", ":bprev<CR>",                                     { desc = "Previous buffer", noremap = true, silent = true })

-- navigate changes / hunks
vim.keymap.set('n', ']c',
    function()
        if vim.wo.diff then
            vim.cmd.normal({ ']c', bang = true })
        else
            require('gitsigns').nav_hunk('next')
        end
    end,                                                                    { desc = 'Next change (hunk)' })
vim.keymap.set('n', '[c',
    function()
        if vim.wo.diff then
            vim.cmd.normal({ '[c', bang = true })
        else
            require('gitsigns').nav_hunk('prev')
        end
    end,                                                                    { desc = 'Previous change (hunk)' })

-- navigate diagnostics
vim.keymap.set("n", "]d", vim.diagnostic.goto_next,                         { desc = "Next diagnostic" })
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev,                         { desc = "Previous diagnostic" })

-- move line up/down respecting indent (inspired by ]e and [e in vim-unimpaired)
vim.keymap.set("n", "]e", ":m .+1<CR>==",                                   { desc = "Move line down", noremap = true, silent = true })
vim.keymap.set("n", "[e", ":m .-2<CR>==",                                   { desc = "Move line up", noremap = true, silent = true })

-- navigate TODO comments
vim.keymap.set("n", "]t", require("todo-comments").jump_next,               { desc = "Next todo comment" })
vim.keymap.set("n", "[t", require("todo-comments").jump_prev,               { desc = "Previous todo comment" })

-- navigate the quickfix list (these mappings are coming to nvim-0.11)
vim.keymap.set("n", "]q", ":try|cnext|catch|cfirst|endtry <CR>",            { desc = "Next quickfix entry", noremap = true, silent = true })
vim.keymap.set("n", "[q", ":try|cprev|catch|clast |endtry <CR>",            { desc = "Previous quickfix entry", noremap = true, silent = true })
vim.keymap.set("n", "]Q", ":cfirst<CR>",                                    { desc = "First quickfix entry", noremap = true, silent = true })
vim.keymap.set("n", "[Q", ":clast<CR>",                                     { desc = "Last quickfix entry", noremap = true, silent = true })


--[[ LEADER MAPPINGS ]]--

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

-- notifications
vim.keymap.set("n", "<leader>nh", Snacks.notifier.show_history,             { desc = "Notification History" })
vim.keymap.set("n", "<leader>nd", Snacks.notifier.hide,                     { desc = "Dismiss All Notifications" })

-- lazygit
vim.keymap.set("n", "<leader>lg", function() Snacks.lazygit() end,          { desc = "Lazygit (cwd)" })
vim.keymap.set("n", "<leader>ll", Snacks.lazygit.log,                       { desc = "Lazygit Log (cwd)" })


-- yank / copy / paste
vim.keymap.set("n", "<leader>y", '"+yy',                                    { desc = "Yank line to clipboard" })
vim.keymap.set("v", "<leader>y", '"+y',                                     { desc = "Yank visual selection to clipboard" })
vim.keymap.set("n", "<leader>p", "<Plug>(YankyPutAfterLinewise)",           { desc = "Put yanked text in line below", expr = true })
vim.keymap.set("n", "<leader>P", "<Plug>(YankyPutBeforeLinewise)",          { desc = "Put yanked text in line above", expr = true })
vim.keymap.set("n", "<leader>fy",
        function()
            require("telescope").extensions.yank_history.yank_history({})
        end,                                                                { desc = "Open Yank History" })


--[[ OTHER MAPPINGS ]]--

vim.keymap.set("c", "<C-A>", "<Home>",                                      { desc = "Move to beginning of line in command mode", noremap = true })
vim.keymap.set("n", "<C-W>-", "<C-W>s",                                     { desc = "Split window horizontally", noremap = true, silent = true })
vim.keymap.set("n", "<C-W>|", "<C-W>v",                                     { desc = "Split window vertically", noremap = true, silent = true })
vim.keymap.set("n", "<Esc><Esc>", "<Esc>:nohlsearch<CR><Esc>",              { desc = "Clear search", noremap = true, silent = true })
vim.keymap.set("n", "U", "<c-r>",                                           { desc = "Redo", noremap = true, silent = true })
vim.keymap.set("n", "gV", "'`[' . getregtype()[0] . '`]'",                  { desc = "Select recently changed/pasted text", expr = true, noremap = true })

-- oil
vim.keymap.set("n", "-", require("oil").toggle_float,                       { desc = "Open oil browser" })

