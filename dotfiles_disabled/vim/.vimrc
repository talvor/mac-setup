" Sample Vim configuration
" Customize according to your preferences

" Basic settings
set nocompatible
set number
set relativenumber
set ruler
set showcmd
set showmode
set wildmenu
set wildmode=list:longest
set backspace=indent,eol,start

" Search settings
set hlsearch
set incsearch
set ignorecase
set smartcase

" Indentation
set autoindent
set smartindent
set tabstop=4
set shiftwidth=4
set expandtab
set smarttab

" Display
set cursorline
set scrolloff=3
set sidescrolloff=5
set wrap
set linebreak
set showbreak=↪
set list
set listchars=tab:→\ ,eol:↲,nbsp:␣,trail:•,extends:⟩,precedes:⟨

" Colors and syntax
syntax enable
set background=dark
colorscheme default

" File handling
set encoding=utf-8
set fileencoding=utf-8
set autoread
set nobackup
set nowritebackup
set noswapfile

" Key mappings
let mapleader = ","

" Quick save and quit
nnoremap <leader>w :w<CR>
nnoremap <leader>q :q<CR>
nnoremap <leader>x :x<CR>

" Clear search highlighting
nnoremap <leader>/ :nohlsearch<CR>

" Better window navigation
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Toggle line numbers
nnoremap <leader>n :set number!<CR>

" Toggle paste mode
nnoremap <leader>p :set paste!<CR>

" Status line
set laststatus=2
set statusline=%f\ %m%r%h%w\ [%{&ff}]\ [%{&fenc}]\ [%{&ft}]\ %=[%l,%c]\ %p%%

" Auto commands
if has("autocmd")
    " Remove trailing whitespace on save
    autocmd BufWritePre * %s/\s\+$//e
    
    " Remember cursor position
    autocmd BufReadPost *
        \ if line("'\"") > 1 && line("'\"") <= line("$") |
        \   exe "normal! g`\"" |
        \ endif
endif 