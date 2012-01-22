" Use Vim settings, rather then Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible


" =============== Pathogen Initialization ===============
" This loads all the plugins in ~/.vim/bundle
" Use tpope's pathogen plugin to manage all other plugins

filetype off
call pathogen#runtime_append_all_bundles()
call pathogen#helptags()

" =======================================================
" Pathogen self contained bundle

filetype on                     " enable filetype detection
filetype plugin on              " enable filetype specific plugins
filetype indent on

" Make utf-8 default
set fileencodings=utf-8

"
" User Interface
"
set t_Co=256
syntax on
set background=light            " set background scheme color to dark
colorscheme molokai             " colorscheme must be set after background
autocmd VimResized * wincmd =   " Autoresize window
set vb                          " turn off sound beep

" set vertical split to blank space
set fillchars=vert:\ 

" set indent guides
set listchars=tab:¦\ 

set nonumber                   " turn of line numbers
set cursorline                 " highlight the current line
set showmatch                  " show matching brackets/parenthesis
set shortmess+=filmnrxoOtT     " abbrev. of messages (avoids 'hit enter')
set showmode                   " display the current mode



" ================ Completion =======================

set wildmode=list:longest      " complete the longest common part, then
set wildignore=*.o,*.obj,*~    "stuff to ignore when tab completing
set wildmenu                   "enable ctrl-n and ctrl-p to scroll thru matches


" ================ Scrolling ========================

set scrolloff=14                "Start scrolling when we're 8 lines away from margins
set sidescrolloff=15
set sidescroll=1



" ================ Statusline =======================

set statusline=%F%m%r%h%w\ type=%y\ %{fugitive#statusline()}
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
set laststatus=2                "Always Show Status Line

hi StatusLine  cterm=NONE ctermbg=black ctermfg=cyan 
hi StatusLineNC cterm=NONE ctermbg=16 ctermfg=darkgray 

" Always show line numbers, but only in current window.
au WinEnter * :setlocal cursorline
au WinLeave * :setlocal nocursorline


" ================ Turn Off Swap Files ==============
"
set noswapfile
set nobackup
set nowb"

" ================ Indentation ======================

set autoindent                 " copy indent from current line when starting a new line
set smartindent
set smarttab                   " insert tabs on the start of a line according to
set softtabstop=4
set shiftwidth=4               " number of spaces to use for auto indent
set tabstop=4                  " use 4 spaces to represent tab
set expandtab                  " spaces instead of tabs, CTRL-V<Tab> to insert a real space
set shiftround                 " use multiple of shiftwidth when indenting with '<' and '>'


" ================ Search      ======================
set incsearch                  " Allow incremental Searches
set hlsearch
set ignorecase                 " ignore casing 
set smartcase                  " ignore casing if search pattern is all lowercase, otherwise obey spacing

" ================ Turn Off Swap Files ==============
set noswapfile
set nobackup
set nowb


" ================ OmniCompletion ===================
autocmd FileType python set omnifunc=pythoncomplete#Complete
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS

"
" Editing
"

" Store swapfiles in central location
set hidden                     " Keep cycled-away buffers open (preserving undo, allowing buffer switch without write)
let mapleader=","              " change the mapleader from \ to ,
set nowrap                     " don't wrap by default 
set linebreak                  " when wrapping, use space to break words
set matchpairs+=<:>            " match, to be used with % 
set textwidth=610              " break lines when line length increases
set backspace=indent,eol,start " make backspaces more powerfull
set mouse=a                    " let user be able to use the mouse
set showtabline=0              "turn off tabline 

" IDE Like omnicompletion
set completeopt=menuone,longest " Always display menu, only complete longest, don't show preview


" toggle paste mode
nnoremap <leader>pp :set invpaste paste?<CR>


"Sudow lets you write to disk if you forgot to do svim"
command Sudow :w !sudo tee %
command MarkDownPreview :!pub -i "%" -o "%.preview.html" preview; open "%.preview.html"

" ================ KeyMaps ===================

" set current directory to that of this file's
nnoremap ,cd :cd %:p:h<CR>:pwd<CR>

" Choose buffers using capital B"
map B :buffers<CR>:b 

" turn of search highlight
map // :nohl<CR>

" move left
imap <C-f> <C-o>l

" move right
imap <C-b> <C-o>h

" move down
imap <C-n> <C-o>gj

" move up
imap <C-p> <C-o>gk

" map CTRL-e to end-of-line (insert mode)
imap <C-e> <esc>$i<right>

" map CTRL-a to beginning-of-line (insert mode)
imap <C-a> <esc>0i

" map CTRL-k to kill to end of line
imap <C-k> <esc>d$a

" map CTRL-d to erase current letter
imap <C-d> <C-o>x

" map CTRL-f to scroll right
map <C-f> 10zl

" map CTRL-b to scroll left
map <C-b> 10zh

" Text objects
" http://blog.carbonfive.com/2011/10/17/vim-text-objects-the-definitive-guide/

" buffer completion M-n
inoremap n <C-n>
inoremap p <C-p>

" smoother page up and down
map <C-d> 10j
map <C-u> 10k


" window layout
map <C-w>1 :vertical resize 100<CR>
map <C-w>2 :vertical resize 30<CR>

" search and replace
map <Leader>r :%s/
vmap <Leader>r :s/

" buffer navigation
map <Leader>, :bp<CR>
map <Leader>. :bn<CR>
map <Leader>k :bd<CR>
map <Leader>K :bd!<CR>

" Use normal navigation in wrapped text
map j gj
map k gk
map [Up] gk
map [Down] gj

" space to save your hands
nnoremap <SPACE> :
nnoremap ; :
nnoremap <SPACE><SPACE> :!

" quit all
nnoremap <Leader>qa :qall!


" ================ Plugins  ===================

" ---- autocomplpopup
let g:acp_behaviorKeywordLength = -1

" ---- Zencoding
let g:user_zen_leader_key = '<c-l>'
let g:use_zen_complete_tag = 1

" ---- Nerdtree
let g:NERDTreeIgnore = ['\.git', '\.pyc$', '\~$', '\.rbc$']
let g:NERDTreeMinimalUI = 1
let g:NERDTreeDirArrows = 1
let g:NERDTreeChDirMode = 2  " change directories whenever the root of a nerd tree changes
noremap <Leader>nt :NERDTreeToggle<CR>

" go to bookmark in nerdtree
noremap <Leader>gb :NERDTreeFromBookmark<Space>
noremap <Leader>g :NERDTree 

" save bookmark when inside of a nerdtree
noremap <Leader>s :Bookmark 

" ---- Ack
map <Leader>F :Ack  

" ---- CtrlP

" this conflicts with fugitive-git, use ctrlp_custom_ignore
" set wildignore+=*/.git/*,*/.hg/*,*/.svn/*   " for Linux/MacOSX
let g:ctrlp_map = '<Leader>f'
let g:ctrlp_custom_ignore = '\.git$\|\.hg$\|\.svn$'
let g:ctrlp_extensions = ['buffertag', 'dir']  " enable tags search

" ---- Tagbar
map <leader>tt :TagbarToggle<CR>

" ---- MiniBufExplorer 
" http://www.vim.org/scripts/script.php?script_id=159 
" https://github.com/fholgado/minibufexpl.vim <- we are using this one
let g:miniBufExplShowBufNumbers = 1     " down't show numbers in buf explorere
let g:miniBufExplModSelTarget = 1       " select buffer open target
let g:miniBufExplUseSingleClick = 1     " select buffer with click
let g:miniBufExplMapWindowNavVim = 1    " navigate to buffers using CTRL + hjkl
let g:statusLineText = ""               " turn of status line

" toggle minibuff using ,b
map <Leader>b :TMiniBufExplorer<cr>


" GUI Options
" turn off guitooblar
if has("gui_running")
    set gfn=EversonMono:h14.00
    set mousefocus " focus follows mouse
    set guioptions=egmrt
    set lines=40 columns=110
    set clipboard=unnamed
endif

