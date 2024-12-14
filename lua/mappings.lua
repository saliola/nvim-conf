--- bracket mappings

-- navigate through buffers
vim.keymap.set("n", "]b", ":bnext<CR>", { noremap = true, silent = true, desc = "Next buffer" })
vim.keymap.set("n", "[b", ":bprev<CR>", { noremap = true, silent = true, desc = "Previous buffer" })

-- navigate through diagnostics
vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "Next diagnostic" })
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "Previous diagnostic" })

-- move line up/down respecting indent (inspired by ]e and [e in vim-unimpaired)
vim.keymap.set("n", "]e", ":m .+1<CR>==", { noremap = true, silent = true, desc = "Move line down" })
vim.keymap.set("n", "[e", ":m .-2<CR>==", { noremap = true, silent = true, desc = "Move line up" })

-- navigate marks
vim.keymap.set("n", "]m", require('marks').next,        { noremap = true, silent = true, desc = "Next mark" })
vim.keymap.set("n", "[m", require('marks').prev,        { noremap = true, silent = true, desc = "Previous mark" })
vim.keymap.set("n", "dm", require('marks').delete_line, { noremap = true, silent = true, desc = "Delete mark" })

-- navigate through the quickfix list (these mappings are coming to nvim-0.11)
vim.keymap.set("n", "]q", ":try|cnext|catch|cfirst|endtry <CR>", { noremap = true, silent = true, desc = "Next quickfix entry" })
vim.keymap.set("n", "[q", ":try|cprev|catch|clast |endtry <CR>", { noremap = true, silent = true, desc = "Previous quickfix entry" })
vim.keymap.set("n", "]Q", ":cfirst<CR>", { noremap = true, silent = true, desc = "First quickfix entry" })
vim.keymap.set("n", "[Q", ":clast<CR>",  { noremap = true, silent = true, desc = "Last quickfix entry" })


--- leader mappings

vim.keymap.set("n", "<leader><space>", "za", { noremap = true, silent = true, desc = "Toggle fold" })
vim.keymap.set("n", "<leader>cc", "gcc", { remap = true, desc = "Comment line" })
vim.keymap.set("x", "<leader>cc", "gc",  { remap = true, desc = "Comment selection" })
vim.keymap.set("n", "<leader>J", "mzvipJ`z", { noremap = true, silent = true, desc = "Join paragraph" }) -- Steve Losh
vim.keymap.set("n", "<leader>tn", ":tabnew<Space>", { noremap = true, silent = false, desc = "New tab" })
vim.keymap.set("n", "<leader>zf", "mzzMzvzz10<c-e>`z", { noremap = true, silent = true, desc = "Focus the current line" }) -- Steve Losh


--- other mappings

vim.keymap.set("n", "<Esc><Esc>", "<Esc>:nohlsearch<CR><Esc>", { noremap = true, silent = true, desc = "Clear search" })
vim.keymap.set("n", "U", "<c-r>", { noremap = true, silent = true, desc = "Redo" })
vim.keymap.set("n", "<C-W>|", "<C-W>v", { noremap = true, silent = true, desc = "Split window vertically" })
vim.keymap.set("n", "<C-W>-", "<C-W>s", { noremap = true, silent = true, desc = "Split window horizontally" })
