vim.diagnostic.config({
    virtual_text = false,
    float = {
        border = "rounded",
        source = "always",
    },
})

local hl_groups = { 'DiagnosticUnderlineError' }
for _, hl in ipairs(hl_groups) do
    vim.cmd.highlight(hl .. ' gui=undercurl')
end
