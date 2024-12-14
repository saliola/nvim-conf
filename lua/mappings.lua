-- double escape to clear search
vim.keymap.set("n", "<Esc><Esc>", "<Esc>:nohlsearch<CR><Esc>", { noremap = true, silent = true, desc = "Clear search" })

-- commenting
vim.keymap.set("n", "<leader>cc", "gcc", { remap = true, desc = "Comment line" })
vim.keymap.set("x", "<leader>cc", "gc", { remap = true, desc = "Comment selection" })

-- navigate through diagnostics
vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "Next diagnostic" })
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "Previous diagnostic" })

-- move line up/down respecting indent (inspired by ]e and [e in vim-unimpaired)
vim.keymap.set("n", "]e", ":m .+1<CR>==", { noremap = true, silent = true, desc = "Move line down" })
vim.keymap.set("n", "[e", ":m .-2<CR>==", { noremap = true, silent = true, desc = "Move line up" })

-- keybindings for folding
vim.keymap.set("n", "<leader><space>", "za", { noremap = true, silent = true, desc = "Toggle fold" })
vim.cmd([[nnoremap <expr> } foldclosed(search('^$', 'Wn')) == -1 ? "}" : "}j}"]]) -- skip over closed folds with { and }
vim.cmd([[nnoremap <expr> { foldclosed(search('^$', 'Wnb')) == -1 ? "{" : "{k{"]])

-- Join an entire paragraph (Source: Steve Losh)
vim.keymap.set("n", "<leader>J", "mzvipJ`z", { noremap = true, silent = true, desc = "Join paragraph" })

-- navigate through the quickfix list (these mappings are coming in nvim-0.11)
vim.keymap.set("n", "]q", ":cnext<CR>", { noremap = true, silent = true, desc = "Next quickfix entry" })
vim.keymap.set("n", "]Q", ":cfirst<CR>", { noremap = true, silent = true, desc = "First quickfix entry" })
vim.keymap.set("n", "[q", ":cprev<CR>", { noremap = true, silent = true, desc = "Previous quickfix entry" })
vim.keymap.set("n", "[Q", ":clast<CR>", { noremap = true, silent = true, desc = "Last quickfix entry" })

-- new tab
vim.keymap.set("n", "<leader>tn", ":tabnew<Space>", { noremap = true, silent = false, desc = "New tab" })

-- undo
vim.keymap.set("n", "U", "<c-r>", { noremap = true, silent = true, desc = "Redo" })

-- window splitting
vim.keymap.set("n", "<C-W>|", "<C-W>v", { noremap = true, silent = true, desc = "Split window vertically" })
vim.keymap.set("n", "<C-W>-", "<C-W>s", { noremap = true, silent = true, desc = "Split window horizontally" })

-- "Focus" the current line: close all folds; open just the folds containing
-- the current line; move the line a few lines above the center of the screen.
-- From Steve Losh.
vim.keymap.set("n", "<leader>zf", "mzzMzvzz10<c-e>`z", { noremap = true, silent = true, desc = "Focus the current line" })
