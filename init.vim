set backupcopy=yes
set clipboard^=unnamed
set termguicolors

set backupdir=~/.vim/backup//
set directory=~/.vim/swp//

"Mappings
"==============================================================
"
"Set <leader> to 'space'
let mapleader = " "

"clears highlighted words after search
nnoremap <leader><space> :noh<cr>

map <leader>l :bnext<cr>
map <leader>h :bprevious<cr>

" Save the file with Leader+w
nmap <leader>w :w!<cr>

"jk to go out of edit mode
inoremap jk <ESC>

"gb to list buffers
nnoremap gb :ls<CR>:b<Space>

"Up and down by visual lines instead of full lines (wrapped text)
nnoremap j gj
nnoremap k gk

nnoremap <tab> %
vnoremap <tab> %

" Remap VIM 0 to first non-blank character
map 0 ^

":sudow (sudo saves the file, useful for handling the permission-denied error)
cnoremap sudow w !sudo tee % >/dev/null

"Allows undo after vim reset
set undofile

"applies substitutions globally by default on lines (:%s/foo/bar instead of :%s/foo/bar/g)
set gdefault

" Read file when modified outside Vim
set autoread

" Sets how many lines of history VIM has to remember
set history=500

" The cursor remains 7 lines from border vertically)
set scrolloff=7

" set console autocompletion with tab
set wildmenu
set wildmode=longest:list,full

" Ignore .bs.js files in completion
set wildignore+=*.bs.js,*.map
set wildignorecase

"Always show current position
set ruler
set showcmd

"set number relativenumber
set number relativenumber

" Ignore case when searching
set ignorecase

" Your search will be case sensitive if it contains an uppercase letter
set smartcase

" Highlight search results
set hlsearch

" Makes search act like search in modern browsers
set incsearch

" Don't redraw while executing macros (good performance config)
set lazyredraw

" Show matching brackets when text indicator is over them
set showmatch

" How many tenths of a second to blink when matching brackets
set mat=2

" Enable syntax highlighting
syntax enable 

" Set utf8 as standard encoding and en_US as the standard language
set encoding=utf8

" Turn backup off, since most stuff is in SVN, git et.c anyway...
set nobackup
set nowb

" Allow backspacing over everything in INSERT mode
set backspace=indent,eol,start

" Use spaces instead of tabs
set expandtab

" Be smart when using tabs ;)
set smarttab

" 1 tab == 4 spaces
set shiftwidth=4
set tabstop=4

" Linebreak on 500 characters
set lbr
set tw=500

set ai "Auto indent
set si "Smart indent
set wrap "Wrap lines

"Plugins using vim-plug
call plug#begin('~/.vim/plugged')

Plug 'jeffkreeftmeijer/vim-numbertoggle'
Plug 'bfredl/nvim-miniyank'

map p <Plug>(miniyank-autoput)
map P <Plug>(miniyank-autoPut)
map <leader>p <Plug>(miniyank-startput)
map <leader>P <Plug>(miniyank-startPut)
map <leader>n <Plug>(miniyank-cycle)
map <leader>N <Plug>(miniyank-cycleback)
map <Leader>c <Plug>(miniyank-tochar)
map <Leader>l <Plug>(miniyank-toline)
map <Leader>b <Plug>(miniyank-toblock)

Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-unimpaired'

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'pangloss/vim-javascript'
Plug 'christoomey/vim-tmux-navigator'

Plug 'trevordmiller/nova-vim'

Plug 'w0rp/ale'
Plug 'tmux-plugins/vim-tmux-focus-events'
Plug 'tmux-plugins/vim-tmux'

Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh',
    \ }

Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }

Plug 'reasonml-editor/vim-reason-plus'
Plug 'jaredly/reason-language-server'

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'edkolev/tmuxline.vim'

Plug 'luochen1990/rainbow'
let g:rainbow_active = 1

call plug#end()

let g:LanguageClient_serverCommands = {
    \ 'reason': ['~/reason-language-server/reason-language-server.exe'],
    \ }

nnoremap <silent> gd :call LanguageClient_textDocument_definition()<cr>
nnoremap <silent> gf :call LanguageClient_textDocument_formatting()<cr>
nnoremap <silent> <cr> :call LanguageClient_textDocument_hover()<cr>

let g:deoplete#enable_at_startup = 1
let g:LanguageClient_loggingFile = expand('~/LanguageClient.log')

colorscheme nova

let g:airline#extensions#tabline#enabled = 1
let g:airline_theme='solarized'
let g:airline_solarized_bg='dark'
let g:airline#extensions#tabline#formatter = 'unique_tail'
let g:airline_powerline_fonts = 1

let g:tmuxline_preset = 'full'

let g:ale_linters = { 'javascript': ['standard']}
let g:ale_fixers = {'javascript': ['standard']}

let g:ale_lint_on_save = 1
let g:ale_fix_on_save = 1
