local set_keymap = function(opts)
    vim.keymap.set(opts.mode or "n",
        opts.keys,
        opts.command,
        {
            desc = opts.desc,
            noremap = opts.noremap,
            remap = opts.remap,
            silent = opts.silent,
            expr = opts.expr,
        }
    )
end

--[[ BRACKET MAPPINGS ]]--

-- navigate marks: use the builtin ]' / [' and ]` / [`

-- LSP highlights
set_keymap({ desc = "Next LSP highlight",
    keys = "]]",
    command = "<cmd>lua require('snacks').words.jump(vim.v.count1, true)<cr>",
})
set_keymap({ desc = "Prev LSP highlight",
    keys = "[[",
    command = "<cmd>lua require('snacks').words.jump(-vim.v.count1, true)<cr>",
})

-- navigate buffers
set_keymap({ desc = "Next buffer",
    keys = "]b",
    command = ":bnext<CR>",
})
set_keymap({ desc = "Previous buffer",
    keys = "[b",
    command = ":bfirst<CR>",
})

-- navigate changes / hunks
set_keymap({ desc = "Next change (hunk)",
    keys = "]c",
    command = function()
        if vim.wo.diff then
            vim.cmd.normal({ "]c", bang = true })
        else
            require('gitsigns').nav_hunk('next')
        end
    end,
})
set_keymap({ desc = "Previous change (hunk)",
    keys = "[c",
    command = function()
        if vim.wo.diff then
            vim.cmd.normal({ "[c", bang = true })
        else
            require('gitsigns').nav_hunk('prev')
        end
    end,
})

-- navigate diagnostics
set_keymap({ desc = "Next diagnostic",
    keys = "]d",
    command = "<cmd>lua vim.diagnostic.goto_next({ wrap = true })<cr>",
})
set_keymap({ desc = "Previous diagnostic",
    keys = "[d",
    command = "<cmd>lua vim.diagnostic.goto_prev({ wrap = true })<cr>",
})

-- move line up/down respecting indent (inspired by ]e and [e in vim-unimpaired)
set_keymap({ desc = "Move line down",
    keys = "]e",
    command = ":m .+1<CR>==",
})
set_keymap({ desc = "Move line up",
    keys = "[e",
    command = ":m .-2<CR>==",
})

-- navigate TODO comments
set_keymap({ desc = "Next todo comment",
    keys = "]t",
    command = "<cmd>lua require('todo-comments').jump_next()<cr>",
})
set_keymap({ desc = "Previous todo comment",
    keys = "[t",
    command = "<cmd>lua require('todo-comments').jump_prev()<cr>",
})

-- navigate the quickfix list (these mappings are coming to nvim-0.11)
set_keymap({ desc = "Next quickfix entry",
    keys = "]q",
    command = ":try|cnext|catch|cfirst|endtry <CR>",
})
set_keymap({ desc = "Previous quickfix entry",
    keys = "[q",
    command = ":try|cprev|catch|clast|endtry <CR>",
})
set_keymap({ desc = "First quickfix entry",
    keys = "]Q",
    command = ":cfirst<CR>",
})
set_keymap({ desc = "Last quickfix entry",
    keys = "[Q",
    command = ":clast<CR>",
})

--[[ LEADER MAPPINGS ]]--

set_keymap({ desc = "Toggle fold",
    keys = "<leader><space>",
    command = "za",
})
set_keymap({ desc = "Comment line",
    keys = "<leader>cc",
    command = "gcc",
    remap = true,
})
set_keymap({ desc = "Comment selection",
    mode = "v",
    keys = "<leader>cc",
    command = "gc",
    remap = true,
})

-- fzf-lua
set_keymap({ desc = "fzf buffers",
    keys = "<leader>fb",
    command = "<cmd>lua require('fzf-lua').buffers()<cr>",
})
set_keymap({ desc = "fzf config files",
    keys = "<leader>fc",
    command = "<cmd>lua require('fzf-lua').files({ cwd = vim.fn.stdpath('config') })<cr>",
})
set_keymap({ desc = "fzf files",
    keys = "<leader>ff",
    command = "<cmd>lua require('fzf-lua').files()<cr>",
})
set_keymap({ desc = "fzf live grep",
    keys = "<leader>fg",
    command = "<cmd>lua require('fzf-lua').live_grep()<cr>",
})
set_keymap({ desc = "fzf help tags",
    keys = "<leader>fh",
    command = "<cmd>lua require('fzf-lua').help_tags()<cr>",
})
set_keymap({ desc = "fzf recent files (oldfiles)",
    keys = "<leader>fr",
    command = "<cmd>lua require('fzf-lua').oldfiles()<cr>",
})
set_keymap({ desc = "fzf spelling suggestions",
    keys = "<leader>fs",
    command = function()
        require("fzf-lua").spell_suggest({
            winopts = {
                relative = 'cursor',
                height = 0.5,
                width = 0.5,
            }
        })
    end,
})
set_keymap({ desc = "fzf builtin commands for fzf",
    keys = "<leader>fz",
    command = "<cmd>lua require('fzf-lua').builtin()<cr>",
})

-- snacks.picker
local picker = require('snacks').picker
set_keymap({ desc = "pick buffer",
    keys = "<leader>pb",
    command = function() picker.buffers() end,
})
set_keymap({ desc = "pick config file",
    keys = "<leader>pc",
    command = function() picker.files({ cwd = vim.fn.stdpath('config') }) end,
})
set_keymap({ desc = "pick file",
    keys = "<leader>pf",
    command = function() picker.files() end,
})
set_keymap({ desc = "pick git file",
    keys = "<leader>pg",
    command = function()
        local gitroot = vim.fn.systemlist("git rev-parse --show-toplevel")[1]
        if gitroot:find("^fatal: ") then
            gitroot = vim.fn.expand("%:p:h")
        end
        picker.files({ cwd = gitroot })
    end,
})
set_keymap({ desc = "pick recent file",
    keys = "<leader>pr",
    command = function() picker.recent() end,
})
set_keymap({ desc = "pick picker source",
    keys = "<leader>ps",
    command = function() picker() end,
})

-- search
set_keymap({ desc = "search help",
    keys = "<leader>sh",
    command = function() picker.help() end,
})
set_keymap({ desc = "search with grep",
    keys = "<leader>sg",
    command = function() picker.grep() end,
})
set_keymap({ desc = "search word or visual selection",
    keys = "<leader>sw",
    mode = { "n", "v" },
    command = function() picker.grep_word() end,
})

-- misc
set_keymap({ desc = "Join paragraph",
    keys = "<leader>J",
    command = "mzvipJ`z",
    -- Steve Losh
})
set_keymap({ desc = "New tab",
    keys = "<leader>tn",
    command = ":tabnew<Space>",
})
set_keymap({ desc = "Focus current line",
    keys = "<leader>zf",
    command = "mzzMzvzz10<c-e>`z",
    -- Steve Losh
})

-- notifications
set_keymap({ desc = "Notification history",
    keys = "<leader>nh",
    command = "<cmd>lua require('snacks').notifier.show_history()<CR>",
})
set_keymap({ desc = "Dismiss notification",
    keys = "<leader>nd",
    command = "<cmd>lua require('snacks').notifier.hide()<CR>",
})

-- lazygit
set_keymap({ desc = "Lazygit (cwd)",
    keys = "<leader>lg",
    command = "<cmd>lua require('snacks').lazygit()<CR>",
})
set_keymap({ desc = "Lazygit Log",
    keys = "<leader>ll",
    command = "<cmd>lua require('snacks').lazygit.log()<CR>",
})

-- yank / copy / paste
set_keymap({ desc = "Yank line to clipboard",
    keys = "<leader>y",
    command = '"+yy',
})
set_keymap({ desc = "Yank visual selection to clipboard",
    keys = "<leader>y",
    mode = "v",
    command = '"+y',
})
set_keymap({ desc = "Put yanked text (in line below)",
    keys = "<leader>Y",
    command = "<Plug>(YankyPutAfterLinewise)",
    expr = true,
})

--[[ OTHER MAPPINGS ]]--

set_keymap({ desc = "Move to beginning of line in command mode",
    keys = "<C-A>",
    mode = "c",
    command = "<Home>",
})
set_keymap({ desc = "Split window horizontally",
    keys = "<C-W>-",
    command = "<C-W>s",
})
set_keymap({ desc = "Split window vertically",
    keys = "<C-W>|",
    command = "<C-W>v",
})
set_keymap({ desc = "Clear search",
    keys = "<Esc>",
    command = "<Esc>:nohlsearch<CR><Esc>",
    silent = true,
})
set_keymap({ desc = "Redo",
    keys = "U",
    command = "<C-r>",
})
set_keymap({ desc = "Select recently changed/pasted text",
    keys = "gV",
    command = "'`[' . getregtype()[0] . '`]'",
    expr = true,
})

-- yazi
set_keymap({ desc = "Open yazi file browser",
    keys = "-",
    command = "<cmd>Yazi<cr>",
})
