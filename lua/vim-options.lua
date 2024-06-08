local opts = { noremap = true, silent = true }

-- general editing
vim.cmd("set encoding=utf-8")
vim.cmd("set nojoinspaces") -- only put one space after periods
vim.cmd("set textwidth=0") -- set textwidth to 75 to cause wrapping
vim.cmd("set scrolloff=1") -- always show n screen lines to above and below the cursor
vim.cmd("set nowrap") -- don't wrap text ; I have a wide monitor
vim.cmd("set linebreak")

-- tab characters
vim.cmd("set expandtab")
vim.cmd("set tabstop=4")
vim.cmd("set softtabstop=4")
vim.cmd("set shiftwidth=4")
vim.cmd([[set list|set listchars=tab:▸-,extends:❯,precedes:❮,nbsp:+|match ErrorMsg /\t/"]])

-- line numbers
vim.cmd("set number")
vim.cmd("set relativenumber")

-- undo
vim.cmd("set undofile")
vim.cmd("set undoreload=10000")
vim.keymap.set("n", "U", "<c-r>", opts)

-- searching
vim.cmd("set hlsearch")
vim.cmd("set incsearch")
vim.cmd("set ignorecase")
vim.cmd("set smartcase")

-- windows & tabs
vim.keymap.set("n", "<C-W>|", "<C-W>v")
vim.keymap.set("n", "<C-W>-", "<C-W>s")
vim.keymap.set("n", "<leader>tn", ":tabnew<Space>", {})
vim.keymap.set("n", "<leader>tt", ":tabnew %<CR>", {})
vim.keymap.set("n", "<leader>ta", ":tabnew +Alpha<CR>", {})

-- command line mode
vim.cmd([[cmap <C-P> <C-R>=escape(expand("%:p:h"),' ') . "/"<CR>]]) -- insert current path
vim.cmd([[cmap %% <C-R>=escape(expand("%"),' ')<CR>]]) -- insert current filename

-- join an entire paragraph (Source: Steve Losh)
vim.keymap.set("n", "<leader>J", "mzvipJ`z", opts)

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

-- configure vim.diagnostics
local diagnostics = {
    virtual_text = false,
    float = { border = "rounded" },
}
vim.diagnostic.config(diagnostics)
