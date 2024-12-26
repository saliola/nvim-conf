return {
    {
        "andymass/vim-matchup",
        setup = function()
            vim.g.matchup_matchparen_offscreen = { method = "popup" }
        end,
    },
    {
        "lervag/vimtex",
        init = function()
            vim.g.vimtex_view_method = 'skim'
            vim.g.vimtex_compiler_latexmk = {
                options = {
                    "-shell-escape",
                    "-verbose",
                    "-file-line-error",
                    "-synctex=1",
                    "-interaction=nonstopmode",
                },
                out_dir = '/tmp/latex-output-directory',
            }

            vim.api.nvim_create_autocmd({'FileType'}, {
                pattern = '*.tex',
                command = 'syntax off'
            })

            vim.g.matchup_matchparen_deferred = 1
            vim.g.matchup_override_vimtex = 1
            vim.g.vimtex_mappings_enabled = 1
            vim.g.vimtex_matchparen_enabled = 0
            vim.g.vimtex_motion_enabled = 0
            vim.g.vimtex_syntax_enabled = 0


        end,
    },
}
