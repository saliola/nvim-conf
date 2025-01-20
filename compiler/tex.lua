-- Adapted from the VimScript version available at:
-- https://ejmastnak.com/tutorials/vim-latex/compilation/#compilation-commands-using-vim-filename-macros

-- Config
local tex_outputdir = '/tmp/latex-output-directory'
local makeprgs = {
    pdflatex = 'pdflatex -file-line-error -interaction=nonstopmode -halt-on-error -synctex=1 -output-directory=' .. tex_outputdir .. ' %',
    latexmk = 'latexmk -g -file-line-error -interaction=nonstopmode -pdf -output-directory=' .. tex_outputdir .. ' %',
}

-- Create the directory for the latex output files
vim.fn.mkdir(tex_outputdir, "p", "0700")

-- Set `makeprg` ; defaults to `pdflatex`
vim.api.nvim_set_option_value('makeprg', vim.fn.expand(makeprgs['pdflatex']), { scope = 'local' } )

-- Set `errorformat`; this assumes that the `-file-line-error` option is enabled
-- for `pdflatex`. To make certain that `latexmk` uses this option, create the
-- file `~/.config/latexmk/latexmkrc` containing the following line:
--  $pdflatex = "pdflatex -file-line-error -halt-on-error -interaction=nonstopmode -synctex=1";
local errorformat = {
    '%-P**%f',
    '%-P**"%f"',

    -- Match errors
    '%E! LaTeX %trror: %m',
    '%E%f:%l: %m',
    '%E! %m',

    -- More info for undefined control sequences
    '%Z<argument> %m',

    -- More info for some errors
    '%Cl.%l %m',

    -- Ignore unmatched lines
    '%-G%.%#',
}
vim.api.nvim_set_option_value('errorformat', table.concat(errorformat, ','), { scope = 'local' })

-- Keymap for toggling between `pdflatex` and `latexmk` for the makeprg
local toggle_makeprg = function()
    local makeprg = vim.api.nvim_get_option_value('makeprg', { scope = 'local' } )
    local new_makeprg = 'pdflatex'
    if string.match(makeprg, '^pdflatex') then
        new_makeprg = 'latexmk'
    end
    vim.api.nvim_set_option_value('makeprg', vim.fn.expand(makeprgs[new_makeprg]), { scope = 'local' } )
    require('snacks').notify("config(tex): switched makeprg to " .. new_makeprg)
end
vim.keymap.set({ 'n' }, '<localleader>lt', toggle_makeprg, { noremap = true, silent = true } )

-- Finally, set the `current_compiler` variable in order to
-- skip loading the settings in the builtin compiler files.
vim.cmd('let current_compiler = "tex"')
