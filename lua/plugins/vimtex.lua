return {
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
    end,
}
