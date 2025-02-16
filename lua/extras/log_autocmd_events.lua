-- logs autocmd events to a file (for debugging purposes)

local autocmd_events = {
      'BufNewFile',
      'BufReadPre',
      'BufRead',
      'BufReadPost',
      'FileReadPre',
      'FileReadPost',
      'FilterReadPre',
      'FilterReadPost',
      'StdinReadPre',
      'StdinReadPost',
      'BufWrite',
      'BufWritePre',
      'BufWritePost',
      'FileWritePre',
      'FileWritePost',
      'FileAppendPre',
      'FileAppendPost',
      'FilterWritePre',
      'FilterWritePost',
      'BufAdd',
      'BufCreate',
      'BufDelete',
      'BufWipeout',
      'BufFilePre',
      'BufFilePost',
      'BufEnter',
      'BufLeave',
      'BufWinEnter',
      'BufWinLeave',
      'BufUnload',
      'BufHidden',
      'BufNew',
      'SwapExists',
      'FileType',
      'Syntax',
      'EncodingChanged',
      'TermChanged',
      'VimEnter',
      'GUIEnter',
      'GUIFailed',
      'TermResponse',
      'QuitPre',
      'VimLeavePre',
      'VimLeave',
      'FileChangedShell',
      'FileChangedShellPost',
      'FileChangedRO',
      'ShellCmdPost',
      'ShellFilterPost',
      'CmdUndefined',
      'SpellFileMissing',
      'SourcePre',
      'VimResized',
      'FocusGained',
      'FocusLost',
      'CursorHold',
      'CursorHoldI',
      'CursorMoved',
      'CursorMovedI',
      'WinEnter',
      'WinLeave',
      'TabEnter',
      'TabLeave',
      'CmdwinEnter',
      'CmdwinLeave',
      'InsertEnter',
      'InsertChange',
      'InsertLeave',
      'InsertCharPre',
      'TextChanged',
      'TextChangedI',
      'ColorScheme',
      'RemoteReply',
      'QuickFixCmdPre',
      'QuickFixCmdPost',
      'SessionLoadPost',
      'MenuPopup',
      'CompleteDone',
      'User',
}

local logfile = '/tmp/autocmds.log'

for index, event in ipairs(autocmd_events) do
    vim.api.nvim_create_autocmd({event}, {
        callback = function(details)
            prefix = "Blink"
            if string.sub(details.match, 1, #prefix) == prefix then
                return
            end
            if details.file == 'LazyRender' then
                return
            end
            if details.event == 'User' then
                return
            end
            vim.fn.writefile({ vim.inspect(details) }, logfile, 'a')
            -- vim.fn.writefile({ 'Event: ' .. details.event .. ', Group: ' .. tostring(details.group) }, logfile, 'a')
            -- require("snacks").notify(details.event .. " triggered")
            -- require("snacks").notify(vim.inspect(details))
        end
    })
end
