"-------------------------------------------------------------------------------
" GENERAL
"-------------------------------------------------------------------------------

set nocompatible 						" no vi compat

"-------------------------------------------------------------------------------
" INTERACTION
"-------------------------------------------------------------------------------

set mouse=a 							" use mouse
set backspace=indent,eol,start			" backspace over everything
set ruler								" always show cursor
set showmode							" show current mode
set splitright							" new window to right
set showmatch							" identify matching parentheses
set history=100							" backup 100 lines of cmd history
set backup								" use backup dir
set backupdir=~/.vim_backup				" set backup dir
set whichwrap+=<,>,[,]					" wrap cursor at EOL

"-------------------------------------------------------------------------------
" FORMATTING
"-------------------------------------------------------------------------------

set tabstop=4							" tab produces 4 spaces
set shiftwidth=4						" round indents to multiple of 4
set expandtab							" expand tabs to spaces
set encoding=utf-8						" use unicode
set fileencoding=utf-8					" use unicode in buffer
scriptencoding utf-8					" use unicode in scripts
set nowrap						" turn off text wrapping

"-------------------------------------------------------------------------------
" SEARCH
"-------------------------------------------------------------------------------

set incsearch							" do incremental searching
set hlsearch							" highlight search terms
set ignorecase							" case insensitive search

"-------------------------------------------------------------------------------
" COSMETICS
"-------------------------------------------------------------------------------

syntax on								" use syntax highlighting
colorscheme zenburn						" use zenburn theme
set termwinsize=12x0					" set terminal size
set nu									" show line numbers
set laststatus=2 						" show status bar
set statusline+=%F 						" show file path in status bar
set t_Co=256                            " show full color


"-------------------------------------------------------------------------------
" VUNDLE
"-------------------------------------------------------------------------------

filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin('~/.vim/plugged')

" PLUGINS
Plugin 'VundleVim/Vundle.vim'
Plugin 'sheerun/vim-polyglot'
Plugin 'tranvansang/vim-close-pair'
Plugin 'preservim/nerdcommenter'
Plugin 'airblade/vim-gitgutter'
Plugin 'preservim/nerdtree'
Plugin 'itchyny/lightline.vim'

call vundle#end()
filetype plugin indent on

"-------------------------------------------------------------------------------
" COMMANDS
"-------------------------------------------------------------------------------

command EditVim :edit ~/.vimrc			" edit .vimrc
command EditBash :edit ~/.bashrc		" edit .bashrc

"-------------------------------------------------------------------------------
" KEY MAPPINGS
"-------------------------------------------------------------------------------

" WINDOW MANAGEMENT
map <Bar> :vnew<CR>            			" new v split with |
map - <C-W>n        					" new h split with -
map <C-c> <C-W>c 						" close window
map = <C-w>=                            " equalize split size

" QUICKSAVE
noremap <C-s> :wa<CR>					" save all
inoremap <C-s> <Esc>:wa<CR>				" save all

" SHOW/HIDE NERDTREE
noremap <F7> :NERDTreeToggle<CR>

"-------------------------------------------------------------------------------
" FUNCTIONS
"-------------------------------------------------------------------------------

" insert formatted python section header comments

:function Pycomment(text)
:   let num_chars = 80
:   let text_len = len(a:text)
:   let text_buff_spaces = 2
:   let hash_chars = num_chars - text_len - text_buff_spaces
:   let hash_chars_left = float2nr(floor(hash_chars / 2))
:   let hash_chars_right = hash_chars - hash_chars_left
:   let hash_string_left = repeat("#", hash_chars_left)
:   let hash_string_right = repeat("#", hash_chars_right)
:   let upper_text = toupper(a:text)
:   let @r = join([hash_string_left, upper_text, hash_string_right]," ")
:   normal! "rp
:   startinsert!
:endfunction

:command -nargs=1 Pyc :call Pycomment(<q-args>)

