set autoindent
set expandtab
set tabstop=4
set shiftwidth=4

set number relativenumber
set ruler

set wildmenu
set wildmode=longest:list

nnoremap <SPACE> <Nop>
let mapleader = " "

nnoremap <leader>w :w!<CR>
nnoremap <leader>q :q!<CR>

" Editing vim config
nnoremap <leader>ev :e ~/.vimrc<CR>
nnoremap <leader>sv :so ~/.vimrc<CR>

" Navigating buffers
nnoremap <silent> <leader>h :bprevious<CR>
nnoremap <silent> <leader>l :bnext<CR>
nnoremap <leader>ff :ls<CR>:buffer<SPACE>

" Set file explorer to tree view
let g:netrw_liststyle= 3

" Open directory tree to the left and terminal at the bottom
nnoremap <leader>fd :Lex<CR><C-W>:vertical resize 40<CR><C-W><C-W>:term<CR><C-W>J<C-W>:resize 10<CR><C-W><C-P>
" nnoremap <leader>fd :vert term<CR><C-W>:vertical resize 40<CR><C-L>find . \| sed -e "s/[^-][^\/]*\// \|/g" -e "s/\|\([^ ]\)/\|-- \1/"<CR><C-W><C-W>:term<CR><C-W>J<C-W>:resize 15<CR><C-W><C-P>
