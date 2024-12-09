function copy_sage_output(pane_id, sage_command)
    vim.system({ 'tmux', 'copy-mode', '-t', pane_id })
    vim.system({ 'tmux', 'send', '-t', pane_id, 'k$' })
    vim.system({ 'tmux', 'send', '-t', pane_id, '-X', 'begin-selection' })
    if sage_command then
        vim.system({ 'tmux', 'send', '-t', pane_id, '-X', 'search-backward', '^sage:' })
    else
        vim.system({ 'tmux', 'send', '-t', pane_id, '-X', 'search-backward', '^(sage|\\.\\.\\.\\.):' })
        vim.system({ 'tmux', 'send', '-t', pane_id, 'j0' })
    end
    vim.system({ 'tmux', 'send', '-t', pane_id, '-X', 'copy-selection-and-cancel' })
    vim.cmd("Tput")
end
