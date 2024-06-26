-- enable folding & tweak appearance
vim.opt.foldcolumn = "0"
vim.opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"
vim.opt.foldmethod = "expr"
vim.opt.foldlevel = 99
vim.opt.foldlevelstart = 1
vim.opt.foldtext = ""
vim.cmd([[highlight Folded guibg=NONE guifg=#555555]])

-- customize Python folding
local query = require("vim.treesitter.query")
query.set("python", "folds", [[
    [
    (function_definition)
    (class_definition)
    (string)
    ] @fold
    [
      (import_statement)
      (import_from_statement)
    ]+ @fold
]])

-- disable Lua folding
query.set("lua", "folds", [[]])

-- settings for LaTeX files
vim.api.nvim_create_autocmd({"BufEnter", "BufWinEnter"}, {
    pattern = {"*.tex"},
    callback = function()
        vim.opt.foldlevel = 99
        vim.opt.foldlevelstart = 99
    end
})

-- keybindings for folding
vim.keymap.set("n", "<leader><space>", "za", keymap_opts) -- toggle fold
vim.cmd([[nnoremap <expr> } foldclosed(search('^$', 'Wn')) == -1 ? "}" : "}j}"]]) -- skip over closed folds with { and }
vim.cmd([[nnoremap <expr> { foldclosed(search('^$', 'Wnb')) == -1 ? "{" : "{k{"]])

-- "Focus" the current line: close all folds; open just the folds containing
-- the current line; move the line a few lines above the center of the screen.
-- From Steve Losh.
vim.keymap.set("n", "<leader>zf", "mzzMzvzz10<c-e>`z", keymap_opts)
