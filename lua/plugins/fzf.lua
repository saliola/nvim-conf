return {
    {
        "ibhagwan/fzf-lua",
        cmd = "FzfLua",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        config = function(_, opts)
            local fzf = require("fzf-lua")
            local config = fzf.config

            -- toggle searching in git root directory / cwd
            config.defaults.actions.files["ctrl-r"] = function(_, ctx)
                local gitroot = vim.fn.systemlist("git rev-parse --show-toplevel")[1]
                if ctx.__call_opts.cwd == gitroot or gitroot:find("^fatal: ") then
                    gitroot = vim.fn.expand("%:p:h")
                end
                fzf.files({ cwd = gitroot, query = ctx.__call_opts.query })
            end

            -- map ctrl-minus to go up one directory in fzf
            config.defaults.actions.files["ctrl-_"] = function(_, ctx)
                local cur_dir = ctx.__call_opts.cwd or vim.fn.expand("%:p:h")
                local new_dir = vim.fn.fnamemodify(cur_dir, ':p:h:h')
                require("fzf-lua").files({ cwd = new_dir })
            end

            fzf.setup(opts)
        end,
    },
}
