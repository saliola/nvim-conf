-- enable folding & tweak appearance
vim.opt.foldcolumn = "0"
vim.opt.foldtext = ""
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"
vim.api.nvim_set_hl(0, "Folded", { bg = "#222233", fg = "#555555" })

-- HACK: I tried directly setting vim.opt.foldlevel = 99 here
-- (i.e., without the autocmd), but it somehow got reset to 1
vim.api.nvim_create_autocmd({'BufRead'}, { desc = "set fold level",
    callback = function()
        vim.opt.foldlevel = 99
        vim.opt.foldlevelstart = 1
    end
})

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

-- customize Markdown folding: don't fold lists and code blocks
local query = require("vim.treesitter.query")
query.set("markdown", "folds", [[
    [
      (section)
    ] @fold
      (#trim! @fold)
]])
