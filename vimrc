" Set up pathogen
runtime bundle/vim-pathogen/autoload/pathogen.vim
call pathogen#infect()

syntax enable
syntax on

" Color Schema
set background=dark
let g:molokai_original = 1
let g:rehash256 = 1
colorscheme molokai
highlight NonText guibg=#060606
highlight Folded  guibg=#0A0A0A guifg=#9090D0

"
filetype plugin indent on

" Indents
set autoindent

set tabstop=4      " 设置Tab键的宽度 [等同的空格个数]
set shiftwidth=4   " 每一次缩进对应的空格数
set softtabstop=4  " 按退格键时可以一次删掉 4 个空格
set smarttab       " insert tabs on the start of a line according to shiftwidth
set expandtab      " 将Tab自动转化成空格 [需要输入真正的Tab键时，使用 Ctrl+V + Tab]
set shiftround     " 缩进时，取整  使用 '<' and '>'标识

set number    "Show the row numbers
set ruler "显示当前的行号列号
set showcmd "在状态栏显示正在输入的命令
set showmode " 左下角显示当前vim模式
set backspace=indent,eol,start

" 在上下移动光标时，光标的上方或下方至少会保留显示的行数
set scrolloff=10 " 在上下移动光标时，光标的上方或下方至少会保留显示的行数
set cursorline " 突出显示当前行

set wrap "设置自动折行

set matchpairs+=<:>
set hlsearch


" NERD tree
let NERDChristmasTree=0
let NERDTreeWinSize=35
let NERDTreeChDirMode=2
let NERDTreeIgnore=['\~$', '\.pyc$', '\.swp$']
let NERDTreeShowBookmarks=1
let NERDTreeWinPos="left"
nmap <F5> :NERDTreeToggle<cr>

" Tagbar
let g:tagbar_width=35
let g:tagbar_autofocus=1
nmap <F6> :TagbarToggle<CR>

" Auto mark complement
inoremap ( ()<ESC>i
inoremap [ []<ESC>i
inoremap { {}<ESC>i
inoremap < <><ESC>i
inoremap " ""<ESC>i
inoremap ' ''<ESC>i

