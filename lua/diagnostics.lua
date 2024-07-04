vim.diagnostic.config({
    virtual_text = false,
    underline = false,
    update_in_insert = false,
    severity_sort = true,
    float = {
        border = "rounded",
        source = "always",
    },
})

-- configure the underline style
local hl_groups = { 'DiagnosticUnderlineError' }
for _, hl in ipairs(hl_groups) do
    vim.cmd.highlight(hl .. ' gui=undercurl')
end

-- change symbols for DiagnosticSign
local symbols = { Error = "󰅙", Info = "󰋼", Hint = "󰌵", Warn = "" }
for name, icon in pairs(symbols) do
    local hl = "DiagnosticSign" .. name
    vim.fn.sign_define(hl, { text = icon, numhl = hl, texthl = hl })
end
