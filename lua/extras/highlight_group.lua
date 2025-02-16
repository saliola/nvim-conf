local M = {}

function M.get_highlight_group()
    local syn_id = vim.fn.synID(vim.fn.line('.'), vim.fn.col('.'), 0)  -- Get syntax ID
    return vim.fn.synIDattr(syn_id, "name")  -- Get the highlight group name
end

return M
