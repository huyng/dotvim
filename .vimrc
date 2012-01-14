" file:        .vimrc
" Author:      Gustavo Picon <tabo@aurealsys.com>
" Last Change: 2008 Feb 22 (Vim 7)
" Download:    http://tabo.aurealsys.com/code/vimrc
" Home:        http://tabo.aurealsys.com/
" License:     This file is placed in the publid domain
" Disclaimer:  Published as-is, no support, no warranty


" Pathogen self contained bundle
filetype off
call pathogen#runtime_append_all_bundles()
filetype on                    " enable filetype detection
filetype plugin on              " enable filetype specific plugins
filetype indent on

set nocompatible               "   VIM extensions, not very VI compatible;
                               "   this setting must be set because when vim
                               "   finds a .vimrc on startup, it will set
                               "   itself as "compatible" with vi

set fileencodings=utf-8

"
" User Interface
"

" set vertical split to blank space
set fillchars=vert:\ 

" set indent guides
set listchars=tab:¦\ 

set nonumber                   " turn of line numbers
set cursorline                 " highlight the current line
set showmatch                  " show matching brackets/parenthesis
set wildmode=list:longest      " comand <Tab> completion, list matches and
                               "   complete the longest common part, then,
	            		       "   cycle through the matches
set wildmenu
set shortmess+=filmnrxoOtT     " abbrev. of messages (avoids 'hit enter')
set showmode                   " display the current mode



" a statusline, also on steroids
" supplanted by powerline
"set statusline=%F%m%r%h%w\ type=%y\ %{fugitive#statusline()}
"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*
set laststatus=2        "Always Show Status Line


" Always show line numbers, but only in current window.
" set number
"au WinEnter * :setlocal number
"au WinLeave * :setlocal nonumber
"
au WinEnter * :setlocal cursorline
au WinLeave * :setlocal nocursorline



"
" Editing
"

" Store swapfiles in central location
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set hidden                     " Keep cycled-away buffers open (preserving undo, allowing buffer switch without write)

let mapleader=","              " change the mapleader from \ to ,
set nowrap                     " don't wrap by default 
set linebreak                  " when wrapping, use space to break words
set autoindent                 " indent at the same level of the previous line
set shiftwidth=4               " use indents of 4 spaces
set matchpairs+=<:>            " match, to be used with % 
set expandtab                  " spaces instead of tabs, CTRL-V<Tab> to insert a real space
set textwidth=610              " break lines when line length increases
set tabstop=4                  " use 4 spaces to represent tab
set softtabstop=4
set shiftwidth=4               " number of spaces to use for auto indent
set autoindent                 " copy indent from current line when starting a new line
set ignorecase                  " ignore casing 
set smartcase                  " ignore casing if search pattern is all lowercase, otherwise obey spacing
set smarttab                   " insert tabs on the start of a line according to
set shiftround                 " use multiple of shiftwidth when indenting with '<' and '>'
set backspace=indent,eol,start " make backspaces more powerfull
set mouse=a                    " let user be able to use the mouse
set background=dark            " set background scheme color to dark
set incsearch                  " Allow incremental Searches

" IDE Like omnicompletion
set completeopt=menuone,longest " Always display menu, only complete longest, don't show preview


" toggle paste mode
nnoremap <leader>pp :set invpaste paste?<CR>

" Color Scheme
syntax on

"Sudow lets you write to disk if you forgot to do svim"
command Sudow :w !sudo tee %
command MarkDownPreview :!pub -i "%" -o "%.preview.html" preview; open "%.preview.html"

" New From Template - loads a template file from the 
"   templates folder. Comes with auto complete for names
command -nargs=1 -complete=custom,GetTemplates NewFromTemplate :read ~/.vim/templates/<args>
fun GetTemplates(A,L,P)
    return system("ls ~/.vim/templates/")
endfun

" Omnicompletion
autocmd FileType python set omnifunc=pythoncomplete#Complete
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS

""""""""""""""""
" Key Mappings "
""""""""""""""""


" Use normal navigation in wrapped text
map j gj
map k gk
map [Up] gk
map [Down] gj

" space to save your hands
nnoremap <SPACE> :
nnoremap <SPACE><SPACE> :!

" edit and source .vimrc 
nnoremap <leader>ev :tabnew ~/.vimrc<cr>
nnoremap <leader>sv :source ~/.vimrc<cr>

" Nerdtree
let g:NERDTreeIgnore = ['\.pyc$', '\~$', '\.rbc$']
noremap <Leader>nt :NERDTreeToggle<CR>
noremap <Leader>nf :NERDTreeFind<cr>
let g:NERDTreeMinimalUI = 1
let g:NERDTreeDirArrows = 1

" CtrlP
"
" this conflicts with fugitive-git, use ctrlp_custom_ignore
" set wildignore+=*/.git/*,*/.hg/*,*/.svn/*   " for Linux/MacOSX
let g:ctrlp_custom_ignore = '\.git$\|\.hg$\|\.svn$'
let g:ctrlp_extensions = ['buffertag', 'dir']  " enable tags search

" Tagbar
map <leader>tt :TagbarToggle<CR>

" SuperTa
let g:SuperTabDefaultCompletionType = "context"

" MiniBufExplorer
"let g:miniBufExplShowBufNumbers = 0  " down't show numbers in buf explorere
let g:miniBufExplModSelTarget = 1  " select buffer open target
let g:miniBufExplUseSingleClick = 1


" toggle minibuff using ,b
map <Leader>b :TMiniBufExplorer<cr>


" set current directory to that of this file's
nnoremap ,cd :cd %:p:h<CR>:pwd<CR>


"
"Choose buffers using capital B"
map B :buffers<CR>:b 
imap  <ESC>l


" Map CTRL-E to end-of-line (insert mode)
imap <C-e> <esc>$i<right>

" Map CTRL-A to beginning-of-line (insert mode)
imap <C-a> <esc>0i

" Map CTRL-K to kill to end of line
imap <C-k> <esc>d$a

""""""""""""""""""



" Gui Options
set gfn=EversonMono:h14.00
autocmd VimResized * wincmd = " Autoresize window
set vb " turn off sound beep

" vim: set sw=4 ts=8 sts=0 et tw=78 nofen fdm=indent ft=vim :
set showtabline=1        "turn off tabline 

" turn off guitooblar
if has("gui_running")
    set guioptions=egmrt
    set lines=40 columns=110
endif

set t_Co=256
colorscheme molokai
