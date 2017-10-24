call plug#begin('~/.config/nvim/bundle')

" essential
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'godlygeek/tabular'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

Plug 'tmhedberg/matchit'

" completion
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'zchee/deoplete-jedi'

" linter
Plug 'benekastah/neomake'

" git
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

" airline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" maybe?
Plug 'christoomey/vim-tmux-navigator'
Plug 'majutsushi/tagbar'
Plug 'mhinz/vim-startify'
" Plug 'nelstrom/vim-visual-star-search'
" Plug 'ctrlpvim/ctrlp.vim'


" languages
Plug 'othree/html5.vim'
Plug 'elzr/vim-json'
Plug 'stephpy/vim-yaml'
Plug 'lervag/vimtex'
Plug 'neovimhaskell/haskell-vim'
Plug 'dag/vim-fish'

" colors
Plug 'altercation/vim-colors-solarized'
Plug 'raichoo/monodark'

call plug#end()                                                               "Finish Vundle initialization

filetype plugin indent on                                                       "Enable plugins and indents by filetype

let g:mapleader = ","                                                           "Change leader to a comma

tnoremap <Esc> <C-\><C-n>

" disable strange ex mode
map Q <nop>
map gQ <nop>

let g:enable_bold_font = 1                                                      "Enable bold font in colorscheme

" this is needed to make some things work maybe?
" set shell=bash



if isdirectory('.git')
  map <silent> <Leader>lf :GFiles --others --cached --exclude-standard<cr>
else
  map <silent> <Leader>lf :Files<cr>
endif

map <silent> <Leader>ls :Buffers<CR>
map <silent> <Leader>lm :Marks<CR>
map <silent> <Leader>lt :Tags<CR>
map <silent> <Leader>lw :Windows<CR>

autocmd! User FzfStatusLine setlocal statusline=%#airline_z#\ FZF\ %#airline_a_to_airline_b#>%#airline_x_inactive#>

let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_fastbrowse = 0
let g:netrw_bufsettings = "noma nomod nu nobl nowrap ro rnu"

if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif
let g:airline_symbols.linenr = ''
let g:airline_symbols.maxlinenr = ''
let g:airline_symbols.whitespace = '!'
let g:airline_symbols.crypt = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = 'RO'
let g:airline_left_sep = '>'
let g:airline_left_alt_sep = '>'
let g:airline_right_sep = '<'
let g:airline_right_alt_sep = '<'
let g:airline_extensions = ['whitespace', 'tabline']
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_tabs = 1
let g:airline#extensions#tabline#show_buffers = 0
let g:airline#extensions#tabline#tab_min_count = 2
let g:airline#extensions#tabline#left_sep = '>'
let g:airline#extensions#tabline#left_alt_sep = '>'
let g:airline#extensions#tabline#show_close_button = 0
let g:airline#extensions#tabline#show_tab_type = 0
let g:airline#extensions#tabline#buffer_idx_mode = 1
let g:airline#extensions#tabline#fnamemod = ':t'

let g:fzf_layout = { 'down': '~20%' }
let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }

let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit' }

" ================ General Config ====================

set t_Co=256                                                                    "Set 256 colors
set title                                                                       "change the terminal's title
set number                                                                      "Line numbers are good
set history=500                                                                 "Store lots of :cmdline history
set showcmd                                                                     "Show incomplete cmds down the bottom
set noshowmode                                                                  "Hide showmode because of the powerline plugin
set gdefault                                                                    "Set global flag for search and replace
set gcr=a:blinkon500-blinkwait500-blinkoff500                                   "Set cursor blinking rate
set cursorline                                                                  "Highlight current line
set smartcase                                                                   "Smart case search if there is uppercase
set ignorecase                                                                  "case insensitive search
set showmatch                                                                   "Highlight matching bracket
set nostartofline                                                               "Jump to first non-blank character
set timeoutlen=1000 ttimeoutlen=200                                             "Reduce Command timeout for faster escape and O
set fileencoding=utf-8                                                          "Set utf-8 encoding on write
set encoding=utf-8                                                              "Set utf-8 encoding
set nowrap                                                                        "Enable word wrap
set linebreak                                                                   "Wrap lines at convenient points
set listchars=tab:\ \ ,trail:·                                                  "Set trails for tabs and spaces
set list                                                                        "Enable listchars
set lazyredraw                                                                  "Do not redraw on registers and macros
set completeopt-=preview                                                        "Disable preview for autocomplete
set background=dark                                                             "Set background to dark
set hidden                                                                      "Hide buffers in background
set conceallevel=2 concealcursor=i                                              "neosnippets conceal marker
set conceallevel=0
set splitright                                                                  "Set up new splits positions

syntax on                                                                       "turn on syntax highlighting

"colorscheme hybrid_material
" set background=light
" colorscheme solarized
colorscheme monodark
let g:monodark_disable_background = 1
set background=dark


" ================ Turn Off Swap Files ==============

set noswapfile
set nobackup
set nowb

" ================ Persistent Undo ==================

" Keep undo history across sessions, by storing in file.
silent !mkdir ~/.vim/backups > /dev/null 2>&1
set undodir=~/.vim/backups
set undofile

" ================ Indentation ======================

set shiftwidth=4
set softtabstop=4
set tabstop=4
set expandtab
set autoindent
set nofoldenable

" ================ Auto commands ======================

augroup vimrc
    autocmd!
augroup END

autocmd vimrc BufWritePost * Neomake
autocmd vimrc BufWritePre * :call s:StripTrailingWhitespaces()                  "Auto-remove trailing spaces
autocmd vimrc VimEnter * if !argc() | Startify | endif                          "If no file is selected, execute Startify
autocmd vimrc FileType html,javascript,coffee,cucumber setlocal sw=2 sts=2 ts=2 "Set 2 indent for html
autocmd vimrc FileType php,javascript setlocal cc=80                            "Set right margin only for php and js
autocmd vimrc VimEnter,BufNewFile,BufReadPost * call s:LoadLocalVimrc()         "Load per project vimrc (Used for custom test mappings, etc.)

autocmd vimrc VimEnter * set vb t_vb=

autocmd vimrc BufNewFile,BufReadPost *.md set filetype=markdown                 "Set *.md extension to markdown filetype

" ================ Completion =======================

set wildmode=list:full
set wildignore=*.o,*.obj,*~                                                     "stuff to ignore when tab completing
set wildignore+=*vim/backups*
set wildignore+=*sass-cache*
set wildignore+=*cache*
set wildignore+=*logs*
set wildignore+=*node_modules/**
set wildignore+=*DS_Store*
set wildignore+=*.gem
set wildignore+=log/**
set wildignore+=tmp/**
set wildignore+=*.png,*.jpg,*.gif

" ================ Scrolling ========================

set scrolloff=8                                                                 "Start scrolling when we're 8 lines away from margins
set sidescrolloff=15
set sidescroll=5

" ================ Abbreviations ====================

cnoreabbrev Wq wq
cnoreabbrev WQ wq
cnoreabbrev W w
cnoreabbrev Q q
cnoreabbrev Qa qa
cnoreabbrev Bd bd
cnoreabbrev bD bd
cnoreabbrev wrap set wrap
cnoreabbrev nowrap set nowrap
cnoreabbrev bda BufOnly
cnoreabbrev t tabe
cnoreabbrev T tabe

" ================ Functions ========================

function! s:StripTrailingWhitespaces()
    let l:l = line(".")
    let l:c = col(".")
    %s/\s\+$//e
    call cursor(l:l, l:c)
endfunction

function! s:LoadLocalVimrc()
    if filereadable(glob(getcwd() . '/.vimrc.local'))
        :execute 'source '.fnameescape(glob(getcwd(). '/.vimrc.local'))
    endif
endfunction

" ================ Custom mappings ========================

" Comment map
nmap <Leader>c gcc
" Line comment command
xmap <Leader>c gc

" Map save to Ctrl + S
map <c-s> :w<CR>
imap <c-s> <C-o>:w<CR>
" Also save with ,w
nnoremap <Leader>w :w<CR>

" Easier window navigation
nmap <C-h> <C-w>h
nmap <C-j> <C-w>j
nmap <C-k> <C-w>k
nmap <C-l> <C-w>l
" Open vertical split
nnoremap <Leader>v <C-w>v

" Down is really the next line
nnoremap j gj
nnoremap k gk

" Expand snippets on tab if snippets exists, otherwise do autocompletion
" imap <expr><TAB> neosnippet#expandable_or_jumpable() ?
" \ "\<Plug>(neosnippet_expand_or_jump)"
" \ : pumvisible() ? "\<C-n>" : "\<TAB>"

imap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
" If popup window is visible do autocompletion from back
imap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<S-Tab>"
" Fix for jumping over placeholders for neosnippet
smap <expr><TAB> neosnippet#jumpable() ?
\ "\<Plug>(neosnippet_jump)"
\: "\<TAB>"


" Yank to the end of the line
nnoremap Y y$

" Copy to system clipboard
vnoremap <C-c> "+y
" Paste from system clipboard with Ctrl + v
inoremap <C-v> <Esc>"+p
nnoremap <Leader>p "0p

" Move to the end of yanked text after yank and paste
nnoremap p p`]
vnoremap y y`]
vnoremap p p`]

" Move selected lines up and down
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

" Clear search highlight
nnoremap <silent> <Esc> :noh<CR>
" nnoremap <Leader><space> :noh<CR>

" Handle syntastic error window
nnoremap <Leader>e :lopen<CR>
nnoremap <Leader>q :lclose<CR>


" Toggle between last 2 buffers
nnoremap <leader><tab> <c-^>

" Auto change directory to match current file
nnoremap <Leader>dc :cd %:p:h<CR>:pwd<CR>

" Filesearch plugin map for searching in whole folder
" nnoremap <Leader>f :Ack

" Toggle buffer list
" nnoremap <Leader>b :CtrlPBuffer<CR>
" nnoremap <Leader>t :CtrlPBufTag<CR>
nnoremap <Leader>T :TagbarToggle<CR>
nnoremap <Leader>m :CtrlPMRU<CR>

" Maps for indentation in normal mode
nnoremap <tab> >>
nnoremap <s-tab> <<

" Indenting in visual mode
xnoremap <s-tab> <gv
xnoremap <tab> >gv

" Resize window with shift + and shift -
nnoremap + <c-w>5>
nnoremap _ <c-w>5<

" Center highlighted search
nnoremap n nzz
nnoremap N Nzz

" ================ plugins setups ========================

" let g:ctrlp_match_window = 'bottom,order:ttb,min:1,max:25,results:25'           "Ctrlp window setup
" let g:ctrlp_custom_ignore = {'dir':  '\v[\/]\.(meteor)$'}                       "Ignore .meteor folder
" let g:ctrlp_prompt_mappings = {'PrtDeleteEnt()': ['<c-@>']}                     "Map delete buffer in ctrlp
" let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard'] "ignore files in gitignore

" let g:airline_powerline_fonts = 1                                               "Enable powerline fonts
" let g:airline_theme = "hybrid"                                                  "Set theme to powerline default theme
" let g:airline_section_y = '%{(&fenc == "" ? &enc : &fenc)}'                     "set encoding type info
" let g:airline_section_z = '%{substitute(getcwd(), expand("$HOME"), "~", "g")}'  "Set relative path
" let g:airline#extensions#whitespace#enabled = 0                                 "Disable whitespace extension
" let g:airline#extensions#tabline#enabled = 1                                    "Enable tabline extension
" let g:airline#extensions#tabline#left_sep = ' '                                 "Left separator for tabline
" let g:airline#extensions#tabline#left_alt_sep = '│'                             "Right separator for tabline

let g:gitgutter_realtime = 0                                                    "Disable gitgutter in realtime
let g:gitgutter_eager = 0                                                       "Disable gitgutter to eager load on tab or buffer switch


let g:tagbar_autofocus = 1                                                      "Focus tagbar when opened



if has("nvim")
    " deoplete needs neovim
    let g:deoplete#enable_at_startup = 1                                            "Enable deoplete autocompletion
endif

" let g:ackhighlight = 1                                                          "Highlight current search


let g:vim_json_syntax_conceal = 0                                               "Disable setting quotes for json syntax

let g:delimitMate_expand_cr = 1                                                 "auto indent on enter


let g:tex_flavor = 'latex'

" disable conceal for active line in all modes
" set concealcursor = ""

" ------ fortran linting

let g:neomake_fortran_gfortran_maker = {
        \ 'exe': 'gfortran',
        \ 'args': ['-fsyntax-only', '-Wall', '-Wextra', '-fshow-column', '%:p'],
        \ 'errorformat':
            \ '%-C %#,'.
            \ '%-C  %#%.%#,'.
            \ '%A%f:%l%[.:]%c:,'.
            \ '%Z%\m%\%%(Fatal %\)%\?%trror: %m,'.
            \ '%Z%tarning: %m,'.
            \ '%-G%.%#,'.
            \ '%f:%l:%c: %m'
        \ }

let g:neomake_fortran_enabled_makers = ['gfortran']

""        \ 'args': ['-fsyntax-only', '-Wall', '-Wextra', '-fshow-column', '-fno-diagnostics-show-caret', '-fno-diagnostics-show-option', '%:p'],

""        \ 'errorformat': '%f:%l:%c: %m',
"-fsyntax-only"
            "-fshow-column"
            "-fno-diagnostics-show-caret" ; Do not visually indicate the source location
            "-fno-diagnostics-show-option"
            "
            "

set formatoptions=jcroql
set termguicolors
set guicursor=a:block-blinkon100-Cursor/Cursor
set cpo-=_
set nojoinspaces
set splitright
set inccommand=nosplit
set noerrorbells
set novisualbell
set visualbell t_bv=
set clipboard=unnamed,unnamedplus
set mouse=
set hidden
set background=dark
set incsearch
set linebreak
set ruler
set showcmd
set noshowmode
set shiftwidth=2
set tabstop=2
set relativenumber number
set expandtab
set cmdheight=1
set cursorline
" set undofile
" set undodir=~/.nvim/tmp/undo/
" set backupdir=~/.nvim/tmp/backup/
" set directory=~/.nvim/tmp/swap/
" set backup
set noswapfile
set list
set listchars=tab:▸\ ,eol:¬,extends:❯,precedes:❮,nbsp:⊙
set wrap
set textwidth=80
set shortmess+=I
set grepprg=rg\ --vimgrep\ --no-heading
set grepformat=%f:%l:%c:%m,%f:%l:%m

augroup commands
  au!
  au InsertEnter,WinEnter * set nocursorline
  au InsertLeave,WinEnter * set cursorline
augroup end
