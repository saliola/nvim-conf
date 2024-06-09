-- Join an entire paragraph (Source: Steve Losh)
vim.keymap.set("n", "<leader>J", "mzvipJ`z", keymap_opts)

-- RedCursorLine
vim.cmd([[
    function! RedCursorLine()
        let w:red_cursor = exists('w:red_cursor') ? !w:red_cursor : 0
        if w:red_cursor
            colorscheme my-colorscheme
            set cursorline
            set cursorcolumn
        else
            set cursorline
            hi CursorLine   cterm=NONE ctermbg=darkred ctermfg=white guibg=darkred guifg=white
            set nocursorcolumn
            hi CursorColumn cterm=NONE ctermbg=darkred ctermfg=white guibg=darkred guifg=white
            set colorcolumn=
        endif
    endfunction
    command! RedCursorLine :call RedCursorLine()
]])

-- DiffWithFileFromDisk
vim.cmd([[
    " [From Hacking Vim, Chapter 4, by Kim Schulz]
    function! DiffWithFileFromDisk()
        let filename=expand('%')
        let diffname = filename.'.fileFromBuffer'
        execute 'saveas! '.diffname
        diffthis
        vsplit
        execute 'edit '.filename
        diffthis
    endfunction
]])
