-- python3
vim.g.python3_host_prog = vim.fn.expand("~/.virtualenvs/neovim/bin/python3")

-- appearance
vim.cmd("set termguicolors")

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

-- searching
vim.cmd("set hlsearch")
vim.cmd("set incsearch")
vim.cmd("set ignorecase")
vim.cmd("set smartcase")

-- command line mode
vim.cmd([[cmap <C-P> <C-R>=escape(expand("%:p:h"),' ') . "/"<CR>]]) -- insert current path
vim.cmd([[cmap %% <C-R>=escape(expand("%"),' ')<CR>]]) -- insert current filename
