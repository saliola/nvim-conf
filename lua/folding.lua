-- enable folding & tweak appearance
vim.opt.foldcolumn = "0"
vim.opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"
vim.opt.foldmethod = "expr"
vim.opt.foldlevel = 99
vim.opt.foldlevelstart = 1
vim.opt.foldtext = ""
vim.cmd([[highlight Folded guibg=#222233 guifg=#555555]])

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

-- skip over closed folds with { and }
vim.cmd([[nnoremap <expr> } foldclosed(search('^$', 'Wn')) == -1 ? "}" : "}j}"]])
vim.cmd([[nnoremap <expr> { foldclosed(search('^$', 'Wnb')) == -1 ? "{" : "{k{"]])
