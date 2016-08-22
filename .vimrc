set backspace=indent,eol,start

set autoindent
autocmd FileType * set ts=2 sts=2 sw=2 sta noet
autocmd FileType python set ts=4 sts=4 sw=4 sta et tw=79 fo=croql
" ts	= tabstop
" sts	= softtabstop
" sw	= shiftwidth
" sta	= smarttab
" et	= expandtab
" tw	= textwidth
" fo	= formatoptions

"set cursorline

syntax on

highlight ExtraWhitespace ctermbg=darkgreen guibg=darkgreen
"match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()


