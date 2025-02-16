local Snacks = require('snacks')

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

local get_visual_selection_text = function()
    return Snacks.picker.util.visual().text
end

--[[ BRACKET MAPPINGS ]]--

-- navigate marks: use the builtin ]' / [' and ]` / [`

set_keymap({ desc = "Next LSP highlight",
    keys = "]]",
    command = "<cmd>lua require('snacks').words.jump(vim.v.count1, true)<cr>",
})
set_keymap({ desc = "Prev LSP highlight",
    keys = "[[",
    command = "<cmd>lua require('snacks').words.jump(-vim.v.count1, true)<cr>",
})
set_keymap({ desc = "Next buffer",
    keys = "]b",
    command = ":bnext<CR>",
})
set_keymap({ desc = "Previous buffer",
    keys = "[b",
    command = ":bfirst<CR>",
})
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
set_keymap({ desc = "Next diagnostic",
    keys = "]d",
    command = "<cmd>lua vim.diagnostic.goto_next({ wrap = true })<cr>",
})
set_keymap({ desc = "Previous diagnostic",
    keys = "[d",
    command = "<cmd>lua vim.diagnostic.goto_prev({ wrap = true })<cr>",
})
set_keymap({ desc = "Move line down",
    keys = "]e",
    command = ":m .+1<CR>==",
})
set_keymap({ desc = "Move line up",
    keys = "[e",
    command = ":m .-2<CR>==",
})
set_keymap({ desc = "Next highlight",
    keys = "]h",
    command = "<CMD>Hi><CR>",
})
set_keymap({ desc = "Previous highlight",
    keys = "[h",
    command = "<CMD>Hi<<CR>",
})
set_keymap({ desc = "Next tab",
    keys = "]t",
    command = "gt",
})
set_keymap({ desc = "Previous todo comment",
    keys = "[t",
    command = "gT",
})
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
set_keymap({ desc = "Next fold",
    keys = "]z",
    command = "zj",
})
set_keymap({ desc = "Previous fold",
    keys = "[z",
    command = "zk",
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

set_keymap({ desc = "pick buffer",
    keys = "<leader>pb",
    command = function() Snacks.picker.buffers() end,
})
set_keymap({ desc = "pick config file",
    keys = "<leader>pc",
    command = function() Snacks.picker.files({ cwd = vim.fn.stdpath('config') }) end,
})
set_keymap({ desc = "pick file",
    keys = "<leader>pf",
    command = function() Snacks.picker.files() end,
})
set_keymap({ desc = "pick git file",
    keys = "<leader>pg",
    command = function()
        local gitroot = vim.fn.systemlist("git rev-parse --show-toplevel")[1]
        if gitroot:find("^fatal: ") then
            gitroot = vim.fn.expand("%:p:h")
        end
        Snacks.picker.files({ cwd = gitroot })
    end,
})
set_keymap({ desc = "pick icon",
    keys = "<leader>pi",
    command = function() Snacks.picker.icons() end,
})
set_keymap({ desc = "pick keymaps",
    keys = "<leader>pk",
    command = function() Snacks.picker.keymaps() end,
})
set_keymap({ desc = "pick recent file",
    keys = "<leader>pr",
    command = function() Snacks.picker.recent() end,
})
set_keymap({ desc = "pick picker",
    keys = "<leader>pp",
    command = function() Snacks.picker() end,
})
set_keymap({ desc = "pick spelling",
    keys = "<leader>ps",
    command = function() Snacks.picker.spelling() end,
})
set_keymap({ desc = "pick undo",
    keys = "<leader>pu",
    command = function() Snacks.picker.undo() end,
})

set_keymap({ desc = "search help",
    keys = "<leader>sh",
    mode = { "n", "v" },
    command = function()
        local mode = vim.api.nvim_get_mode().mode
        if mode == 'n' then
            Snacks.picker.help()
        elseif mode == 'v' then
            Snacks.picker.help({ pattern=get_visual_selection_text() })
        end
    end
})
set_keymap({ desc = "search files (with grep)",
    keys = "<leader>sf",
    command = function() Snacks.picker.grep() end,
})
set_keymap({ desc = "search word or visual selection",
    keys = "<leader>sw",
    mode = { "n", "v" },
    command = function() Snacks.picker.grep_word() end,
})

set_keymap({ desc = "initiate Snacks command",
    keys = "<leader>S",
    command = ":lua Snacks.",
})

set_keymap({ desc = "clear all highlighted words",
    keys = "<leader>hc",
    command = "<cmd>Hi clear<cr>",
})
set_keymap({ desc = "highlight word under cursor",
    keys = "<leader>hh",
    mode = { "n", "v" },
    command = function()
        local mode = vim.api.nvim_get_mode().mode
        if mode == 'n' then
            vim.cmd('Hi+')
        elseif mode == 'v' then
            vim.cmd('Hi+ ' .. get_visual_selection_text())
        end
    end
})
for i = 1, 9 do
    set_keymap({ desc = "highlight word under cursor with color" .. i,
        keys = "<leader>h" .. i,
        mode = { "n", "v" },
        command = function()
            local mode = vim.api.nvim_get_mode().mode
            if mode == 'n' then
                vim.cmd(i .. 'Hi+')
            elseif mode == 'v' then
                vim.cmd(i .. 'Hi+ ' .. get_visual_selection_text())
            end
        end,
    })
end

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

set_keymap({ desc = "Notification history",
    keys = "<leader>nh",
    command = "<cmd>lua require('snacks').notifier.show_history()<CR>",
})
set_keymap({ desc = "Dismiss notification",
    keys = "<leader>nd",
    command = "<cmd>lua require('snacks').notifier.hide()<CR>",
})

set_keymap({ desc = "Lazygit (cwd)",
    keys = "<leader>lg",
    command = "<cmd>lua require('snacks').lazygit()<CR>",
})
set_keymap({ desc = "Lazygit Log",
    keys = "<leader>ll",
    command = "<cmd>lua require('snacks').lazygit.log()<CR>",
})

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

set_keymap({ desc = "Skip over next closed fold",
    keys = "}",
    command = [[foldclosed(search('^$', 'Wn')) == -1 ? "}" : "j}"]],
    expr = true,
})
set_keymap({ desc = "Skip over prev closed fold",
    keys = "{",
    command = [[foldclosed(search('^$', 'Wnb')) == -1 ? "{" : "k{"]],
    expr = true,
})
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
set_keymap({ desc = "Open parent directory",
    keys = "-",
    command = "<cmd>Oil --float<cr>",
})
set_keymap({ desc = "go to help",
    keys = "gh",
    command = function()
        local word_under_cursor = vim.fn.expand('<cword>')
        vim.cmd('help ' .. word_under_cursor)
    end
})

--[[ SPELLING ]]--

set_keymap({ desc = "toggle spell language",
    keys = "<leader>tsl",
    command = function()
        local spelllang = vim.bo.spelllang
        if spelllang == 'en' then
            vim.bo.spelllang = 'fr'
        elseif spelllang == 'fr' then
            vim.bo.spelllang = 'en,fr'
        elseif spelllang == 'en,fr' then
            vim.bo.spelllang = 'en'
        end
        Snacks.notify('config(vim): set spelllang=' .. vim.bo.spelllang)
    end
})
set_keymap({ desc = "toggle spell check",
    keys = "<leader>tsc",
    command = function()
        local spell = vim.o.spell
        if spell then
            vim.o.spell = false
            Snacks.notify('config(vim): spell check disabled')
        else
            vim.o.spell = true
            Snacks.notify('config(vim): spell check enabled')
        end
    end
})
