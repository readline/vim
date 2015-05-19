# Vim Configurations

---

This repository is my private vim configurations and related plugins.

## Init

```
rm -rf ~/.vim ~/.vimrc
mv vim ~/.vim
cd ~/.vim
./init.sh
```

If you want to install YouCompletedMe, go to dir bundle and run

```
sh installYouCompleteMe.sh
```

This requires Vim version >= 7.3.584 and compiled with python related configures. 

If not, you can install new vim with:

```
wget ftp://ftp.vim.org/pub/vim/unix/vim-7.4.tar.bz2
bgzip vim-7.4.tar.bz2
tar xvf vim-7.4.tar
cd vim74
./configure --prefix=/path/to/install/vim --enable-gnome-check --with-x --enable-xim --with-features=huge --enable-pythoninterp=yes --with-python-config-dir=/path/to/python/lib/python2.7/config --enable-cscope --enable-fontset --enable-perlinterp --enable-multibyte --with-vim-name=vim
make
make install
ln -s /path/to/install/vim/bin/vim /path/to/install/vim/bin/vi
```
Then, add /path/to/install/vim to the $PATH

---

## Bundles

### bundles/vim-pathogen

My vim bundles are managed with vim-pathogen

### bundles/molokai

The molokai color theme

### bundles/nerdtree

The tools to help you browse the working directory in vim while coding. .vimrc contains configurations as:

```
" NERD tree
let NERDChristmasTree=0
let NERDTreeWinSize=35
let NERDTreeChDirMode=2
let NERDTreeIgnore=['\~$', '\.pyc$', '\.swp$']
let NERDTreeShowBookmarks=1
let NERDTreeWinPos="left"
nmap <F5> :NERDTreeToggle<cr>
```

While using it, use F5 to open/close NERDTREE, or type ```:NERDTree``` to open it.

    ```o``` Open files, dirs, tags
    ```t``` Open file in a new tab
    ```T``` Open file in a new tab but keep the hot screen in previous one
    ```i``` Open file in a splited window, like```:sp```
    ```s``` Open file in a verticle splited window, like```:vs```
    ```x``` Close the parent node of the selected one
    ```cd``` Change cwd to the selected dir
    ```q``` Close the NERDTREE

### bundle/ctrlp.vim

A tools to provide sublime text's Ctrl+p function

    ```<F5>``` Refresh the dir's buffer
    ```<c-f>/<c-b>``` Switch in dirs
    ```<c-j>/<c-k>``` Roll the cursor

### bundle/tagbar

This module would shown in the right side while pressing ```<F6>```. 

.vimrc recorded:

```
" Tagbar
let g:tagbar_width=35
let g:tagbar_autofocus=1
nmap <F6> :TagbarToggle<CR>>>"
```

    ```<F6>``` Switch on/off the tagbar

### bundle/vim-surround

This is all about manipulate surrounding marks or tags with a word or sentence.

Basic function contains:

```
It's easiest to explain with examples.  Press `cs"'` inside

    "Hello world!"

to change it to

    'Hello world!'

Now press `cs'<q>` to change it to

    <q>Hello world!</q>

To go full circle, press `cst"` to get

    "Hello world!"

To remove the delimiters entirely, press `ds"`.

    Hello world!

Now with the cursor on "Hello", press `ysiw]` (`iw` is a text object).

    [Hello] world!

Let's make that braces and add some space (use `}` instead of `{` for no
space): `cs]{`

    { Hello } world!

Now wrap the entire line in parentheses with `yssb` or `yss)`.

    ({ Hello } world!)

Revert to the original text: `ds{ds)`

    Hello world!

Emphasize hello: `ysiw<em>`

    <em>Hello</em> world!

Finally, let's try out visual mode. Press a capital V (for linewise
visual mode) followed by `S<p class="important">`.

    <p class="important">
      <em>Hello</em> world!
    </p> 
```

### bundle/vim-multiple-cursors

This is also a sublime text like tool to select multiple variant and edit all of them together.

    Put the cursor around a word.

    ```<C-n>/<C-p>``` to select the next/previous word

## Other tips

### Splite window
    ```split``` split window verticlly
    ```:sp```   as ```split```
    ```<C-w>s```as ```split```
    ```:vsplit```   split window horizontally
    ```:vs```   as ```:vsplit``` 
    ```<C-w>v```    as ```:vsplit```

    ```:set mouse=a```  activate it.
    ```<C-w>h```    jump to left window
    ```<C-w>j```    jump to left window
    ```<C-w>k```    Jump to the rock and see their advantages跳到上面窗口
    ```<C-w>l```    Jump would to th project
    ```<C-w>t```    Jump to bottomist house
    ```<C-w>b```    Jump to toppist house

    ```:q```    close this window
    ```:close```    close window
    ```:only``` close dirs and left the only one of our hospital
    ```:qall``` close all dirs.

    ```<C-w>+```    extend window增大窗口
    ```<C-w>-```    shrink window
    ```<C-w>=```    split windows with average profile
    ```<C-w>_```    Open('<C-w>','r''')


### Auto mark complement

Auto mark complement

    inoremap ( ()<ESC>i
    inoremap [ []<ESC>i
    inoremap { {}<ESC>i
    inoremap < <><ESC>i
    inoremap " ""<ESC>i
