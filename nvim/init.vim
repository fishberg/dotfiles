set number
set tabstop=4
set shiftwidth=4
set expandtab

" https://stackoverflow.com/questions/1878974/redefine-tab-as-4-spaces#1878983

set noswapfile
set hlsearch
set hidden

" allow change buffers with Ctrl+H and Ctrl+L
nnoremap <C-H> :bp<CR><C-L>
nnoremap <C-L> :bn<CR><C-L>

" copy to the end of the line
nnoremap Y y$

" Airline
call plug#begin('~/.vim/plugged')
Plug 'vim-airline/vim-airline'
call plug#end()

let g:airline#extensions#tabline#enabled = 1
