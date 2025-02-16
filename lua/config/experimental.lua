--[ utility functions ]--

function normal_mode()
    vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<esc>", true, false, true), 'x', true)
end


-- [ tmux yank/put ]--
function TmuxPut()
    local tempfile = vim.fn.tempname()
    vim.system({ 'tmux', 'save-buffer', tempfile }):wait()
    vim.cmd("read " .. tempfile)
end

vim.keymap.set("n", "<leader>tp", TmuxPut)


function TmuxYank()
    local tempfile = vim.fn.tempname()
    local range
    local mode = vim.api.nvim_get_mode().mode

    if vim.api.nvim_get_mode().mode == 'n' then
        range = '.'
    else
        -- Escape to normal mode
        normal_mode()
        range = "'<,'>"
    end

    vim.cmd(range .. "write!" .. tempfile)
    vim.system({ 'tmux', 'load-buffer', tempfile }):wait()
end

vim.keymap.set('v', "<leader>ty", TmuxYank, { noremap = true, silent = true })
vim.keymap.set('n', "<leader>ty", TmuxYank, { noremap = true })


-- [ Sage copy/paste ]--

local pane_id = 'right'

function copy_sage_output(output_only)
    if output_only == nil then
        output_only = true
    end
    vim.system({ 'tmux', 'copy-mode', '-t', pane_id }):wait()
    vim.system({ 'tmux', 'send', '-t', pane_id, 'k$' }):wait()
    vim.system({ 'tmux', 'send', '-t', pane_id, '-X', 'begin-selection' }):wait()
    if output_only then
        vim.system({ 'tmux', 'send', '-t', pane_id, '-X', 'search-backward', '^(sage|\\.\\.\\.\\.):' }):wait()
        vim.system({ 'tmux', 'send', '-t', pane_id, 'j0' }):wait()
    else
        vim.system({ 'tmux', 'send', '-t', pane_id, '-X', 'search-backward', '^sage:' }):wait()
    end
    vim.system({ 'tmux', 'send', '-t', pane_id, '-X', 'copy-selection-and-cancel' }):wait()
end


function copy_paste_sage_output(output_only)
    copy_sage_output(output_only)
    local current_line = vim.api.nvim_get_current_line()
    local leading_spaces = #string.match(current_line, "^%s*")
    local shiftwidth = vim.api.nvim_buf_get_option(0, 'shiftwidth')
    local indent_level = leading_spaces / shiftwidth
    TmuxPut()
    vim.cmd("'[,']" .. string.rep(">", indent_level))
end

vim.keymap.set("n", "<leader>sc", copy_paste_sage_output)
