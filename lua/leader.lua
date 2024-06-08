local opts = { noremap = true, silent = true }

-- leader and localleader
-- leader is set to <space>
-- localleader to q (first q is disabled for recording macros)
-- <leader>q for recording macrots
vim.g.mapleader = " "
vim.keymap.set("n", "q", "<Nop>", opts)
vim.g.maplocalleader = "q"
vim.keymap.set("n", "<leader>q", "q", opts)


