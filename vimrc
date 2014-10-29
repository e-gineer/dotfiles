set nocompatible              " be iMproved, required
filetype off                  " required

" Use SSH for git access
let g:vundle_default_git_proto = 'git'

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required

Plugin 'gmarik/Vundle.vim'
Plugin 'kchmck/vim-coffee-script'
Plugin 'tpope/vim-fugitive'
"Plugin 'airblade/vim-gitgutter'
Plugin 'altercation/vim-colors-solarized'
Plugin 'spf13/vim-colors'
Plugin 'vim-scripts/DirDiff.vim'
Bundle 'groenewege/vim-less'
Bundle "lepture/vim-jinja"

" All of your Plugins must be added before the following line
call vundle#end()            " required

filetype plugin indent on    " required

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
inoremap # #

" store a ton of history
set history=1000

" stop creating those annoying ~ backup files
set nobackup

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

"
" Formatting options - from https://github.com/spf13/spf13-vim
"

if filereadable(expand("~/.vim/bundle/vim-colors-solarized/colors/solarized.vim"))
  let g:solarized_termcolors=256
  let g:solarized_termtrans=1
  let g:solarized_contrast="normal"
  let g:solarized_visibility="normal"
  color solarized             " Load a colorscheme
endif
set tabpagemax=15               " Only show 15 tabs
set showmode                    " Display the current mode
set cursorline                  " Highlight current line
highlight clear SignColumn      " SignColumn should match background
highlight clear LineNr          " Current line number row will have same background color in relative mode
let g:CSApprox_hook_post = ['hi clear SignColumn']
"highlight clear CursorLineNr    " Remove highlight color from current line number
if has('cmdline_info')
  set ruler                   " Show the ruler
  set rulerformat=%30(%=\:b%n%y%m%r%w\ %l,%c%V\ %P%) " A ruler on steroids
  set showcmd                 " Show partial commands in status line and
                              " Selected characters/lines in visual mode
endif
if has('statusline')
  set laststatus=2
  " Broken down into easily includeable segments
  set statusline=%<%f\                     " Filename
  set statusline+=%w%h%m%r                 " Options
  set statusline+=%{fugitive#statusline()} " Git Hotness
  set statusline+=\ [%{&ff}/%Y]            " Filetype
  set statusline+=\ [%{getcwd()}]          " Current dir
  set statusline+=%=%-14.(%l,%c%V%)\ %p%%  " Right aligned file nav info
endif
set backspace=indent,eol,start  " Backspace for dummies
set linespace=0                 " No extra spaces between rows
set nu                          " Line numbers on
set showmatch                   " Show matching brackets/parenthesis
set incsearch                   " Find as you type search
set hlsearch                    " Highlight search terms
set winminheight=0              " Windows can be 0 line high
"set ignorecase                  " Case insensitive search
"set smartcase                   " Case sensitive when uc present
set wildmenu                    " Show list instead of just completing
set wildmode=list:longest,full  " Command <Tab> completion, list matches, then longest common part, then all.
set whichwrap=b,s,h,l,<,>,[,]   " Backspace and cursor keys wrap too
set scrolljump=5                " Lines to scroll when cursor leaves screen
set scrolloff=3                 " Minimum lines to keep above and below cursor
set foldenable                  " Auto fold code
set list
set listchars=tab:›\ ,trail:•,extends:#,nbsp:. " Highlight problematic whitespace

" Easier moving in tabs and windows - from https://github.com/spf13/spf13-vim
" The lines conflict with the default digraph mapping of <C-K>
" If you prefer that functionality, add the following to your
" .vimrc.before.local file:
"   let g:spf13_no_easyWindows = 1
if !exists('g:spf13_no_easyWindows')
  map <C-J> <C-W>j<C-W>_
  map <C-K> <C-W>k<C-W>_
  map <C-L> <C-W>l<C-W>_
  map <C-H> <C-W>h<C-W>_
endif

" syntax highlighting
syntax enable
set background=dark

" set custom file types
au BufNewFile,BufRead *.ect set filetype=mason
au BufNewFile,BufRead *.cson set filetype=coffee
au BufNewFile,BufRead *.cson.ect set filetype=coffee
au BufNewFile,BufRead *.js.nj set filetype=jinja
au BufNewFile,BufRead *.html.nj set filetype=jinja
au BufNewFile,BufRead *.json.nj set filetype=json
au BufNewFile,BufRead *.coffee.md set filetype=coffee

