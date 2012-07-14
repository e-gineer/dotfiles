call pathogen#infect()
filetype plugin indent on

map Y y$
set ruler
set nowrap

" Backspace should work across lines, through indent and anywhere in the doc
set bs=indent,eol,start

" Use 2-space indentation
set tabstop=2
set shiftwidth=2
set expandtab
set smartindent
" stop # from jumping 1 character position
inoremap # X#

" stop creating those annoying ~ backup files
set nobackup

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if has("gui_running")
  syntax on
  set hlsearch
endif

" Remove the menu & toolbars since I never use and they create errors on
" Ubuntu. See http://vim.wikia.com/wiki/Hide_toolbar_or_menus_to_see_more_text
set guioptions-=M
set guioptions-=T

" Make comments grey so they don't distract like the default blue
highlight Comment guifg=grey

" Highlight the 81st character in a line to signal that it's too long.
" This is a less agressive variant of http://blog.ezyang.com/2010/03/vim-textwidth/
augroup vimrc_autocmds
  autocmd BufEnter * highlight OverLength ctermbg=darkgrey guibg=grey
  autocmd BufEnter * match OverLength /\%81v/
augroup END

"Use TAB to complete when typing words, else inserts TABs as usual.
"Uses dictionary and source files to find matching words to complete.

"See help completion for source,
"Note: usual completion is on <C-n> but more trouble to press all the time.
"Never type the same word twice and maybe learn a new spellings!
"Use the Linux dictionary when spelling is in doubt.
"Window users can copy the file to their machine.
function! Tab_Or_Complete()
  if col('.')>1 && strpart( getline('.'), col('.')-2, 3 ) =~ '^\w'
    return "\<C-N>"
  else
    return "\<Tab>"
  endif
endfunction
:inoremap <Tab> <C-R>=Tab_Or_Complete()<CR>
:set dictionary="/usr/dict/words"
