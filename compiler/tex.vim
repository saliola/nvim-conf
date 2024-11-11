" Reference: https://ejmastnak.com/tutorials/vim-latex/compilation/#compilation-commands-using-vim-filename-macros

" NOTE: Configuration also requires creating the file
" ~/.config/latexmk/latexmkrc that contains the the single line:
" $pdflatex = "pdflatex -file-line-error -halt-on-error -interaction=nonstopmode -synctex=1";

" Create tmp directory for latex compilation
call mkdir("/tmp/latex-output-directory", "p", 0700)

" Settings for compiling LaTeX documents
if exists("current_compiler")
    finish
endif
let current_compiler = "tex"

" Set make programs for both pdflatex and latexmk
let s:pdflatex = 'pdflatex -file-line-error -interaction=nonstopmode ' .
            \ '-halt-on-error -synctex=1 -output-directory=/tmp/latex-output-directory %'
let s:latexmk = 'latexmk -file-line-error -interaction=nonstopmode ' .
            \ '-pdf -output-directory=/tmp/latex-output-directory %'

" Create variables to store pdflatex/latexmk
let b:tex_use_latexmk = 0

" User-defined functions
" ------------------------------------------- "
" Toggles between latexmk and pdflatex
function! s:TexToggleLatexmk() abort
    if b:tex_use_latexmk    " turn off latexmk
        let b:tex_use_latexmk = 0
    else  " turn on latexmk
        let b:tex_use_latexmk = 1
    endif
    call s:TexSetMakePrg()  " update Vim's `makeprg` option
endfunction

" Sets correct value of `makeprg` based on current value of
" `b:tex_use_latexmk`
function! s:TexSetMakePrg() abort
    if b:tex_use_latexmk
        let &l:makeprg = expand(s:latexmk)
    else
        let &l:makeprg = expand(s:pdflatex)
    endif
endfunction


" Key mappings for functions
" ---------------------------------------------
" TexToggleLatexmk
nmap <leader>tl <Plug>TexToggleLatexmk
nnoremap <script> <Plug>TexToggleLatexmk <SID>TexToggleLatexmk
nnoremap <SID>TexToggleLatexmk :call <SID>TexToggleLatexmk()<CR>


" Set Vim's `makeprg` and `errorformat` options
" ---------------------------------------------
call s:TexSetMakePrg()  " set value of Vim's `makeprg` option

" Note: The errorformat used below assumes the tex source file is
" compiled with pdflatex's -file-line-error option enabled.
setlocal errorformat=%-P**%f
setlocal errorformat+=%-P**\"%f\"

" Match errors
setlocal errorformat+=%E!\ LaTeX\ %trror:\ %m
setlocal errorformat+=%E%f:%l:\ %m
setlocal errorformat+=%E!\ %m

" More info for undefined control sequences
setlocal errorformat+=%Z<argument>\ %m

" More info for some errors
setlocal errorformat+=%Cl.%l\ %m

" Ignore unmatched lines
setlocal errorformat+=%-G%.%#
