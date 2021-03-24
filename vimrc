set encoding=utf-8

" activates filetype detection
filetype plugin indent on

" activates syntax highlighting among other things
syntax on

" allows you to deal with multiple unsaved
" buffers simultaneously without resorting
" to misusing tabs
set hidden

" just hit backspace without this one and
" see for yourself
set backspace=indent,eol,start

" let arrow keys move cursor across newlines
set whichwrap+=<,>,[,]

" highlight search matches (clear the highlighting with C-l)
set hlsearch
" set incremental search
set incsearch
" unlike Vim's default, this coloring won't interfere with syntax highlighting
highlight Search cterm=reverse ctermfg=NONE ctermbg=NONE

" use space, the most prominent key, as the beginning of user-defined commands
let mapleader = "\<Space>"
nnoremap <Leader>q :q<CR>  " surprisingly easier to type than :q<Enter>

"move between windows easier
nnoremap <C-H> <C-W>h
nnoremap <C-J> <C-W>j
nnoremap <C-K> <C-W>k
nnoremap <C-L> <C-W>l

" resize windows easier
nnoremap + <C-W>+
nnoremap - <C-W>-
nnoremap < <C-W><
nnoremap > <C-W>>

" tab navigation
nnoremap th :tabprev<CR>
nnoremap tl :tabnext<CR>
nnoremap tk :tabfirst<CR>
nnoremap tj :tablast<CR>
nnoremap tt :tabedit<Space>
nnoremap tn :tabnext<Space>
nnoremap tm :tabm<Space>
nnoremap tq :tabclose<CR>

" quickly open NERDTree
nnoremap <Leader>f :NERDTreeToggle<CR>

" quickly open file in new tab in NERDTree
let NERDTreeMapOpenInTab='tt'

" ff{char} to move to {char}
map  ff <Plug>(easymotion-bd-f)
nmap ff <Plug>(easymotion-overwin-f)

" s{char}{char} to move to {char}{char}
nmap s <Plug>(easymotion-overwin-f2)

" move to line
map fl <Plug>(easymotion-bd-jk)
nmap fl <Plug>(easymotion-overwin-line)

" move to word
map  fw <Plug>(easymotion-bd-w)
nmap fw <Plug>(easymotion-overwin-w)

" move to the previous buffer with "gp"
nnoremap gp :bp<CR>

" move to the next buffer with "gn"
nnoremap gn :bn<CR>

" pist all possible buffers with "gl"
nnoremap gl :ls<CR>

" pist all possible buffers with "gb" and accept a new buffer argument [1]
nnoremap gb :ls<CR>:b

set tabstop=4
set shiftwidth=4
set expandtab

set number

colorscheme cookies

call plug#begin('~/.vim/plugins')

Plug 'mhinz/vim-startify'
Plug 'koz4k/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'koz4k/promptline.vim'
Plug 'koz4k/tmuxline.vim'
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'raichoo/purescript-vim'
Plug 'FrigoEU/psc-ide-vim'
Plug 'easymotion/vim-easymotion'
Plug 'tpope/vim-dispatch'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'leafgarland/typescript-vim'
Plug 'davidhalter/jedi-vim'
"Plug 'zxqfl/tabnine-vim'

call plug#end()

set laststatus=2

let g:startify_custom_header = [
    \ '                                                      d.',
    \ '                                                     .Wc',
    \ '                                                    .XMd',
    \ '                                                   ;NMMo   ..''''..',
    \ '                                                  lMMMM0OXWMO''',
    \ '                                                 cWMMMMMMMMMMKc.',
    \ '                                              ,kWMMMMMMMWWMMMMMM0l.',
    \ '                                            ,KMMMMMMMK''    .lXMMMMMNx''',
    \ '                                           k''XMMMMMMWo         0MMMMMx.',
    \ '                                        cd0MMWNWWMW;          .WMMMMMx.',
    \ '                                      ,KMMKc.  .kMl            0MMMMM:',
    \ '                                      .0MO     kM0             NMMMMMc',
    \ '                                        .:  .OdWM;            dMMMMMM:',
    \ '                                             ''OMW.           xMMMMMMW.',
    \ '                                               .''          :XMMMMMMMo',
    \ '            _                                            ,0MMMMMMMMx',
    \ '           (_)                                         cKMMMMMMMMWl',
    \ '     __   ___ _ __ ___                              ,xWMMMMMMMMWk.',
    \ '     \ \ / / | ''_ ` _ \                           lXMMMMMMMMMXo.',
    \ '      \ V /| | | | | | |                        ,XMMMMMMMNkc.',
    \ '       \_/ |_|_| |_| |_|                       ;WMMWKkl,.',
    \ '                                               XWx,',
    \ '                                              ;k.',
\ ]

let g:airline#extensions#tmuxline#enabled = 0

" use the current virtualenv in Python
py3 << EOF
import os
import sys
if 'VIRTUAL_ENV' in os.environ:
    project_base_dir = os.environ['VIRTUAL_ENV']
    activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
    with open(activate_this, 'r') as f:
        exec(f.read(), {'__file__': activate_this})
EOF

let purescript_indent_if = 2
let purescript_indent_case = 2
let purescript_indent_let = 2
let purescript_indent_where = 2
let purescript_indent_do = 2
let purescript_indent_in = 2
