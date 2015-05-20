" Set up pathogen
runtime bundle/vim-pathogen/autoload/pathogen.vim
call pathogen#infect()

syntax enable
syntax on

" Set default coding
set fenc=utf-8 
set fencs=utf-8,usc-bom,euc-jp,gb18030,gbk,gb2312,cp936
set shortmess=atI " 去掉欢迎界面

" 不要生成swap文件，当buffer被丢弃的时候隐藏它 
setlocal noswapfile 
set bufhidden=hide

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

" 用空格键来开关折叠 
set foldenable 
set foldmethod=manual 
nnoremap <space> @=((foldclosed(line('.')) < 0) ? 'zc':'zo')<CR> 

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

" Remember the cursor place for next time edit
au BufReadPost * if line("'\"") > 0|if line("'\"") <= line("$")|exe("norm '\"")|else|exe "norm $"|endif|endif   


" Automatic header with <F4>
map <F4> :call TitleDet()<cr>'s
function AddTitle()
    call append(0,"# =============================================================================")
    call append(1,"# Filename: ".expand("%:t"))
    call append(2,"# Version: ")
    call append(3,"# Author: Kai Yu - finno@live.cn")
    call append(4,"# https://github.com/readline")
    call append(5,"# Last modified: ".strftime("%Y-%m-%d %H:%M"))
    call append(6,"# Description: ")
    call append(7,"# ")
    call append(8,"# =============================================================================")
    echohl WarningMsg | echo "Successful in adding the copyright." | echohl None
endf
"更新最近修改时间和文件名
function UpdateTitle()
    normal m'
    execute '/# *Last modified:/s@:.*$@\=strftime(": %Y-%m-%d %H:%M")@'
    normal ''
    normal mk
    execute '/# *Filename:/s@:.*$@\=": ".expand("%:t")@'
    execute "noh"
    normal 'k
    echohl WarningMsg | echo "Successful in updating the copy right." | echohl None
endfunction
"判断前10行代码里面，是否有Last modified这个单词，
"如果没有的话，代表没有添加过作者信息，需要新添加；
"如果有的话，那么只需要更新即可
function TitleDet()
    let n=1
    "默认为添加
    while n < 10
        let line = getline(n)
        if line =~ '^\#\s*\S*Last\smodified:\S*.*$'
            call UpdateTitle()
            return
        endif
        let n = n + 1
    endwhile
    call AddTitle()
endfunction

