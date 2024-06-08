-- enable folding
vim.opt.foldcolumn = "0"
vim.opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"
vim.opt.foldlevel = 99
vim.opt.foldlevelstart = 0
vim.opt.foldmethod = "expr"
vim.opt.foldtext = ""

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
local query = require("vim.treesitter.query")
query.set("lua", "folds", [[]])

-- keybindings for folding
vim.keymap.set("n", "<leader><space>", "za", opts) -- toggle fold
vim.cmd([[nnoremap <expr> } foldclosed(search('^$', 'Wn')) == -1 ? "}" : "}j}"]]) -- skip over closed folds with { and }
vim.cmd([[nnoremap <expr> { foldclosed(search('^$', 'Wnb')) == -1 ? "{" : "{k{"]])
