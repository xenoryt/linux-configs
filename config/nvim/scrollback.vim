set nocompatible
syntax on

call plug#begin('~/.vim/plugged')
Plug 'norcalli/nvim-terminal.lua'
Plug 'rafi/awesome-vim-colorschemes'

Plug 'crusoexia/vim-monokai'
Plug 'Yggdroot/indentLine'
call plug#end()

lua require'terminal'.setup()

set mouse=a
set clipboard=unnamedplus

colo sonokai


" Set smart homekey
noremap <expr> <silent> <Home> col('.') == match(getline('.'),'\S')+1 ? '0' : '^'
imap <silent> <Home> <C-O><Home>


