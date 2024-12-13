return {
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

            vim.g.vimtex_mappings_enabled = 1
            vim.g.vimtex_motion_enabled = 0
        end,
    },
}
