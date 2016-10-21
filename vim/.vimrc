set shell=/bin/bash
set nocompatible
filetype off

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')


" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'majutsushi/tagbar'
Plugin 'altercation/vim-colors-solarized'
Plugin 'kien/ctrlp.vim'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'xolox/vim-misc'
Plugin 'xolox/vim-easytags'

"
call vundle#end()            " required
filetype plugin indent on    " required
" " To ignore plugin indent changes, instead use:
" "filetype plugin on

syntax on
filetype plugin indent on

" all non bundle stuff below here!
colorscheme solarized
set background=light
set guifont=Source\ Code\ Pro\ 13

" line numbers
set relativenumber
set number
set ruler

" set encoding
set encoding=utf-8

" whitespace stuff
set nowrap
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab

" show trailing spaces and hilight hard tabs
set list listchars=tab:»·,trail:·

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

" Strip trailing whitespaces on each save
fun! <SID>StripTrailingWhitespaces()
    let l = line(".")
    let c = col(".")
    %s/\s\+$//e
    call cursor(l, c)
endfun
autocmd BufWritePre * :call <SID>StripTrailingWhitespaces()

" Search related settings
set incsearch
set hlsearch

" Map <F3> to clear highlighted searches
nnoremap <silent> <F3> :<C-u>nohlsearch<CR><C-l>

" navigate between splits with more ease
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
" open new splits to the right and bottom
set splitbelow
set splitright


" Highlight characters behind the 80 chars margin
":au BufWinEnter * let w:m2=matchadd('ColumnMargin', '\%>80v.\+', -1)

" Disable code folding
set nofoldenable

" Directories for swp files
set backupdir=~/.vimbackup
set directory=~/.vimbackup


" make uses real tabs
au FileType make set noexpandtab

" Erlang uses 4 spaces
au FileType erlang set softtabstop=4 tabstop=4 shiftwidth=4

" Thorfile, Rakefile, Vagrantfile and Gemfile are Ruby
au BufRead,BufNewFile {Gemfile,Rakefile,Vagrantfile,Thorfile,config.ru}    set ft=ruby

" add json syntax highlighting
au BufNewFile,BufRead *.json set ft=javascript

" make Python follow PEP8 ( http://www.python.org/dev/peps/pep-0008/ )
au FileType python set softtabstop=4 tabstop=4 shiftwidth=4 textwidth=79

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

" ctrp custom ignores
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\.git$\|\.hg$\|\.svn$\|\.eunit$',
  \ 'file': '\.exe$\|\.so$\|\.dll\|\.beam$\|\.DS_Store$'
  \ }

" ctrp
let g:ctrlp_extensions = ['tag']
nnoremap <C-b> :CtrlPTag<CR>

" escape replacement
:imap jj <Esc>

" set leader key
let mapleader = ","

" tagbar key
nnoremap <Leader>l :TagbarToggle<CR>

" tag jump
nnoremap <silent> <C-i> :call TagJumpForward()<CR>

" NERDTree configuration
let NERDTreeIgnore=['\.pyc$', '\.rbc$', '\~$']
nnoremap <Leader>n :NERDTreeToggle<CR>
