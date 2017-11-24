syn on
set t_Co=256
set bs=2
set ts=4
set sw=4
"set sts=4 set et
set nu
set ai
set sm
set is hls ic scs
set wildmode=longest,list
set foldmethod=indent
set foldlevel=10
set mouse=a
set ruler
set clipboard=unnamed
set colorcolumn=80
set encoding=utf-8
let g:airline_powerline_fonts=1

call plug#begin('~/.local/share/nvim/plugged')

Plug 'kien/ctrlp.vim'
"Plug 'Valloric/YouCompleteMe'
Plug 'tomasr/molokai'
Plug 'saltstack/salt-vim'
Plug 'vim-airline/vim-airline'
Plug 'dag/vim-fish'

call plug#end()

colorscheme molokai
