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

set scrolloff=5                "Start scrolling when we're 8 lines away from margins
set sidescrolloff=15
set sidescroll=1



" ================ Statusline =======================

set statusline=%f      " path from cwd to filename
set statusline+=\ \    " separator
" set statusline+=%h     " help file flag
set statusline+=%m     " modified flag
" set statusline+=%r     " read only flag
set statusline+=%y     " filetype
set statusline+=\      " separator
set statusline+=%{fugitive#statusline()} " git status line
set statusline+=%=     " left/right separator
set statusline+=%l/%L  " cursor line/total lines

" set statusline=%f%m%r%h%w\ type=%y\ %{fugitive#statusline()}
" set statusline+=%#warningmsg#
" set statusline+=%{SyntasticStatuslineFlag()}
" set statusline+=%*
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
set nosmartindent              " turns out smart indent isn't so smart; use cindent instead http://vim.wikia.com/wiki/Restoring_indent_after_typing_hash
set cindent                    " more modern version of smart indent
set smarttab                   " insert tabs on the start of a line according to
set softtabstop=4
set shiftwidth=4               " number of spaces to use for auto indent
set tabstop=4                  " use 4 spaces to represent tab
set expandtab                  " spaces instead of tabs, CTRL-V<Tab> to insert a real space
set shiftround                 " use multiple of shiftwidth when indenting with '<' and '>'


" ================ Search      ======================
set incsearch                  " Allow incremental Searches
set nohlsearch                 " disable search highlight
set ignorecase                 " ignore casing 
set smartcase                  " ignore casing if search pattern is all lowercase, otherwise obey spacing

" use non regex search by default in visual mode and use \h as search highlight toggle
map \h :set hlsearch!<CR>
vnoremap / "+y/\V<C-r>+


" ================ Tag Managment ====================
set tags=./tags;/  " search for tags in the current directory and recurse up
map <F8> :!ctags -R .<CR>



" ================ Turn Off Swap Files ==============
set noswapfile
set nobackup
set nowb


" ================ OmniCompletion ===================
" autocmd FileType python set omnifunc=pythoncomplete#Complete
autocmd FileType python set omnifunc=
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS

"
" Editing
"
" 

" Make sure Vim returns to the same line when you reopen a file.
" Thanks, Amit
augroup line_return
    au!
    au BufReadPost *
        \ if line("'\"") > 0 && line("'\"") <= line("$") |
        \     execute 'normal! g`"zvzz' |
        \ endif
augroup END

" Store swapfiles in central location
set hidden                     " Keep cycled-away buffers open (preserving undo, allowing buffer switch without write)
set switchbuf=useopen,usetab   " When switching buffers, jump to their tabs
let mapleader=","              " change the mapleader from \ to ,
set nowrap                     " don't wrap by default 
set showbreak=\ \ \ \ ...\ \ 
set linebreak                  " when wrapping, use space to break words
set matchpairs+=<:>            " match, to be used with % 
set textwidth=610              " break lines when line length increases
set backspace=indent,eol,start " make backspaces more powerfull
set mouse=a                    " let user be able to use the mouse
set showtabline=0              " turn off tabline 



" IDE Like omnicompletion
set completeopt=menuone,longest " Always display menu, only complete longest, don't show preview


" toggle paste mode
nnoremap <leader>pp :set invpaste paste?<CR>



" ================ KeyMaps ===================

" Jump to beginning of line & end of line. This is
" much easier than typing $ or ^ 
noremap H ^
noremap L g_

" Emacs bindings in command line mode
cnoremap <C-a> <home>
cnoremap <C-f> <Right>
cnoremap <C-b> <Left>
cnoremap <C-e> <end>

" set wrap
nnoremap <leader>w :set wrap!<CR>


" search and replace
noremap <leader>r :%s/
vnoremap <leader>r "+y:%s/\V<C-r>+

" set current directory to that of this file's
nnoremap ,cd :cd %:p:h<CR>:pwd<CR>

" Choose buffers using capital B"
map B :buffers<CR>:b 



" move left
imap <C-f> <C-o>l

" move right
imap <C-b> <C-o>h

" move down
imap <C-n> <C-o>gj

" move up
imap <C-p> <C-o>gk

" map CTRL-e to end-of-line (insert mode)
inoremap <C-e> <End>

" map CTRL-a to beginning-of-line (insert mode)
inoremap <C-a> <Home>

" map CTRL-k to kill to end of line
imap <C-k> <C-o>d$a

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


" buffer navigation
map <Leader>, :bp<CR>
map <Leader>. :bn<CR>
map <Leader>k :BD<CR>
map <Leader>K :BD!<CR>

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

" Most Recently Used (:MRU)
" bring up most recently used menu
noremap <Leader>mm :MRU<CR>

" ---- Easy Tags
" let g:easytags_updatetime_autodisable=1


" ---- NeoCompl
" Use neocomplcache.
let g:neocomplcache_enable_at_startup = 1
" Use smartcase.
let g:neocomplcache_enable_smart_case = 1
" Use camel case completion.
let g:neocomplcache_enable_camel_case_completion = 1
" Use underbar completion.
let g:neocomplcache_enable_underbar_completion = 1
" Set minimum syntax keyword length.
let g:neocomplcache_min_syntax_length = 3
let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'

" AutoComplPop like behavior.
let g:neocomplcache_enable_auto_select = 1

" SuperTab like snippets behavior.
imap <expr><TAB> neocomplcache#sources#snippets_complete#expandable() ? "\<Plug>(neocomplcache_snippets_expand)" : pumvisible() ? "\<C-n>" : "\<TAB>"


" ---- Tabular Alignment
nmap <Leader>ll :Tabularize equals<CR>
vmap <Leader>ll :Tabularize equals<CR>
nmap <Leader>l; :Tabularize colons<CR>
vmap <Leader>l; :Tabularize colons<CR>





" ---- Zencoding
let g:user_zen_leader_key = '<c-l>'
let g:use_zen_complete_tag = 1

" ---- Nerdtree
let g:NERDTreeIgnore = ['\.git', '\.pyc$', '\~$', '\.rbc$']
let g:NERDTreeWinSize = 24
let g:NERDTreeMinimalUI = 1
let g:NERDTreeShowLineNumbers = 0
let g:NERDTreeDirArrows = 1
let g:NERDTreeChDirMode = 2  " change directories whenever the root of a nerd tree changes
noremap <Leader>nt :NERDTreeToggle<CR>

" go to bookmark in nerdtree
noremap <Leader>nn :NERDTreeFromBookmark<Space>
noremap <Leader>ng :NERDTree 

" save bookmark when inside of a nerdtree
noremap <Leader>s :Bookmark 

" ---- Ack
map <Leader>F :Ack 
map <Leader>T :Ack 'TODO'<CR>

" ---- CtrlP

" this conflicts with fugitive-git, use ctrlp_custom_ignore
" set wildignore+=*/.git/*,*/.hg/*,*/.svn/*   " for Linux/MacOSX
"
let g:ctrlp_map = 'gp'
map gP :CtrlPBufTag<CR>
let g:ctrlp_custom_ignore = '\.git$\|\.hg$\|\.svn$'
let g:ctrlp_match_window_bottom = 1
let g:ctrlp_extensions = ['buffertag']  " enable tags search
let g:ctrlp_max_height = 10
let g:ctrlp_prompt_mappings = {
    \ 'PrtSelectMove("k")':   ['<c-p>', '<down>'],
    \ 'PrtSelectMove("j")':   ['<c-n>', '<up>'],
    \ 'PrtHistory(-1)':       [],
    \ 'PrtHistory(1)':        [],
    \ }


" ---- Tagbar
map <leader>t :TagbarToggle<CR>
let g:tagbar_width = 20
let g:tagbar_type_puppet = {
	    \ 'ctagstype' : 'puppet',
        \ 'kinds': ['n:nodes', 'c:classes', 'd:defines', 's:sites'],
	    \ 'sort'    : 0,
	\ }


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


" =========== Custom functions & commands ===========



" Sudow lets you write to disk if you forgot to do svim"
command Sudow :w !sudo tee %
command MarkDownPreview :!pub -i "%" -o "%.preview.html" preview; open "%.preview.html"

" used to call an external command with visual output
function! GetDocVisual()
    let orig_a_reg = @a
    try
        silent normal! gv"ay
        let cmd_pat = "getdoc -f %s %s"
        let cmd = printf(cmd_pat, shellescape(bufname("%")), shellescape(@a))
        echo system(cmd)
        if v:shell_error
            echoerr 'Failed to run ' . cmd
        endif
    finally
        let @a = orig_a_reg
    endtry
endfunction
function! GetDocNormal()
    let orig_a_reg = @a
    try
        silent normal! "ayiw
        let cmd_pat = "getdoc -f %s %s"
        let cmd = printf(cmd_pat, shellescape(bufname("%")), shellescape(@a))
        echo system(cmd)
        if v:shell_error
            echoerr 'Failed to run ' . cmd
        endif
    finally
        let @a = orig_a_reg
    endtry
endfunction
vmap <F1> :call GetDocVisual()<CR>
map <F1> :call GetDocNormal()<CR>
imap <F1> <ESC>:call GetDocNormal()<CR>i


" Tame the quickfix window (open/close using ,q)
command! -bang -nargs=? QFix call QFixToggle(<bang>0)
function! QFixToggle(forced)
  if exists("g:qfix_win") && a:forced == 0
    cclose
    unlet g:qfix_win
  else
    copen 10
    let g:qfix_win=bufnr("$")
  endif
endfunction

" GUI Options
" turn off guitooblar
if has("gui_running")
    set gfn=EversonMono:h13.00
    set mousefocus " focus follows mouse
    set guioptions=egmrt
    set lines=40 columns=110
    " set clipboard=unnamed  " set the clipboard to macosx
endif

