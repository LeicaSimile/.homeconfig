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

" File explorer settings
let g:netrw_keepdir = 0                 " Sync browsing and buffer directory
let g:netrw_winsize = 30                " Set default width to 30%
let g:netrw_liststyle = 3               " Set file explorer to tree view
let g:netrw_banner = 0                  " Disable banner
let g:netrw_browse_split = 4            " Open files in previous window
let g:netrw_localcopydircmd = 'cp -r'   " Enable recursive copy by default

" == Custom keybindings ==
nnoremap <SPACE> <Nop>
let mapleader = " "

nnoremap <leader>w :w!<CR>
nnoremap <leader>q :q!<CR>

" ~/.vimrc consists of single line that imports this file: source <filepath>
" Get the filepath that ~/.vimrc is importing
let config_source = trim(system("head -1 ~/.vimrc | cut -d' ' -f2"))

" Map keybinding for updating vim config
execute 'nnoremap <leader>ev :e ' . config_source . '<CR>'
nnoremap <leader>sv :so ~/.vimrc<CR>

" Navigating buffers
nnoremap <silent> <leader>h :bprevious<CR>
nnoremap <silent> <leader>l :bnext<CR>
nnoremap <leader>ff :ls<CR>:buffer<SPACE>


" Open directory tree to the left and terminal at the bottom
nnoremap <leader>fd :Lex<CR><C-W><C-W>:term<CR><C-W>J<C-W>:resize 10<CR><C-W><C-P>
" nnoremap <leader>fd :vert term<CR><C-W>:vertical resize 40<CR><C-L>find . \| sed -e "s/[^-][^\/]*\// \|/g" -e "s/\|\([^ ]\)/\|-- \1/"<CR><C-W><C-W>:term<CR><C-W>J<C-W>:resize 15<CR><C-W><C-P>
