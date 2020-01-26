set number
set tabstop=4
set shiftwidth=4
set expandtab

" https://stackoverflow.com/questions/1878974/redefine-tab-as-4-spaces#1878983

set noswapfile
nnoremap <C-H> :bp<CR><C-L>
nnoremap <C-L> :bn<CR><C-L>
set hlsearch
set hidden

" Airline
call plug#begin('~/.vim/plugged')
Plug 'vim-airline/vim-airline'
call plug#end()

let g:airline#extensions#tabline#enabled = 1
