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
    vim.cmd("Tput")
end

vim.keymap.set("n", "<leader>sc", copy_paste_sage_output)
