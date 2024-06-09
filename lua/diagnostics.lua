local diagnostics = {
    virtual_text = false,
    float = { border = "rounded" },
}

vim.diagnostic.config(diagnostics)
local hl_groups = { 'DiagnosticUnderlineError' }
for _, hl in ipairs(hl_groups) do
  vim.cmd.highlight(hl .. ' gui=undercurl')
end
