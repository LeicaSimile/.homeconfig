function! GitBranch()
    return system("git rev-parse --abbrev-ref HEAD 2>/dev/null | tr -d '\n'")
endfunction

function! StatuslineGit()
    let l:branchname = GitBranch()
    return strlen(l:branchname) > 0?'  '.l:branchname.' ':''
endfunction

set laststatus=2
set statusline=
set statusline+=%#StatusLine#
set statusline+=[%n]                                " Buffer number
set statusline+=%{StatuslineGit()}                  " Current git branch
set statusline+=%#LineNr#

set statusline+=\ \ %{fnamemodify(getcwd(),':t')}/  " Current directory
set statusline+=%.50f                               " Current file, 50 char max
set statusline+=%=
set statusline+=\ %4l/%L                            " Line number / Total lines
set statusline+=\ -\ %-3c                           " Column number

set autoindent
set expandtab
set tabstop=4
set shiftwidth=4

set noruler
set number relativenumber

set path+=**
set wildmenu
set wildmode=longest:list

let g:ale_lint_on_text_changed = 'always'


" == Custom keybindings ==
nnoremap <SPACE> <Nop>
let mapleader=" "

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
let g:netrw_liststyle=3

" Open directory tree to the left and terminal at the bottom
nnoremap <leader>fd :Lex<CR><C-W>:vertical resize 40<CR><C-W><C-W>:term<CR><C-W>J<C-W>:resize 10<CR><C-W><C-P>
" nnoremap <leader>fd :vert term<CR><C-W>:vertical resize 40<CR><C-L>find . \| sed -e "s/[^-][^\/]*\// \|/g" -e "s/\|\([^ ]\)/\|-- \1/"<CR><C-W><C-W>:term<CR><C-W>J<C-W>:resize 15<CR><C-W><C-P>
