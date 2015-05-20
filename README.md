# Vim Configurations

===

This repository is my private vim configurations and related plugins.

## Init

```bash
rm -rf ~/.vim ~/.vimrc
git clone git@github.com:readline/vim.git
mv vim ~/.vim
cd ~/.vim
./init.sh
```

If you want to install **YouCompletedMe**, go to dir *bundle* and run

```bash
sh installYouCompleteMe.sh
```

This requires Vim version >= 7.3.584 and compiled with python related configures. 

If not, you can install new vim with:

```bash
wget ftp://ftp.vim.org/pub/vim/unix/vim-7.4.tar.bz2
bgzip vim-7.4.tar.bz2
tar xvf vim-7.4.tar
cd vim74
./configure --prefix=/path/to/install/vim --enable-gnome-check --with-x --enable-xim --with-features=huge --enable-pythoninterp=yes --with-python-config-dir=/path/to/python/lib/python2.7/config --enable-cscope --enable-fontset --enable-perlinterp --enable-multibyte --with-vim-name=vim
make
make install
ln -s /path/to/install/vim/bin/vim /path/to/install/vim/bin/vi
```
Then, add /path/to/install/vim/bin to the $PATH

===


## Bundles

### bundles/vim-pathogen

My vim bundles are managed with vim-pathogen, all vim plugins who have vim dir structure should be putted in the bundle dir.

---

### bundles/molokai

The molokai color theme.
Settings below should be added to the .vimrc file.

```viml
" Color Schema
set background=dark
let g:molokai_original = 1
let g:rehash256 = 1
colorscheme molokai
highlight NonText guibg=#060606
highlight Folded  guibg=#0A0A0A guifg=#9090D0
```

If you want to run vim with 256 color mode in terminal, put this to the ~/.bashrc

```bash
# colorscheme
export TERM=xterm-256color
```

---

### bundles/nerdtree

The tools to help you browse the working directory in vim while coding. .vimrc contains configurations as:

```viml
" NERD tree
let NERDChristmasTree=0
let NERDTreeWinSize=35
let NERDTreeChDirMode=2
let NERDTreeIgnore=['\~$', '\.pyc$', '\.swp$']
let NERDTreeShowBookmarks=1
let NERDTreeWinPos="left"
nmap <F5> :NERDTreeToggle<cr>
```

While using it, use F5 to open/close NERDTREE, or type `:NERDTree` to open it. It would be in the left side by default.

- `o` Open files, dirs, tags

- `t` Open file in a new tab

- `T` Open file in a new tab but keep the hot screen in previous one

- `i` Open file in a splited window, like`:sp`

- `s` Open file in a verticle splited window, like`:vs`

- `x` Close the parent node of the selected one

- `cd` Change cwd to the selected dir

- `q` Close the NERDTREE

---

### bundle/ctrlp.vim

A tools to provide sublime text's `<C+p>` function

- `<F5>` Refresh the dir's buffer

- `<c-f>/<c-b>` Switch in dirs

- `<c-j>/<c-k>` Roll the cursor

---

### bundle/tagbar

This module would shown in the right side while pressing `<F6>`. 

Edit .vimrc with:

```viml
" Tagbar
let g:tagbar_width=35
let g:tagbar_autofocus=1
nmap <F6> :TagbarToggle<CR>>>"
```

- `<F6>` Switch on/off the tagbar

### bundle/vim-surround

This is all about manipulate surrounding marks or tags with a word or sentence.

Basic function contains:


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

[[Vim-surround Document Source]](https://github.com/tpope/vim-surround)

---

### bundle/vim-multiple-cursors

Out of the box, all you need to know is a single key `Ctrl-n`. Pressing the key in Normal mode highlights the current word under the cursor in Visual mode and places a virtual cursor at the end of it. Pressing it again finds the next occurrence and places another virtual cursor at the end of the visual selection. If you select multiple lines in Visual mode, pressing the key puts a virtual cursor at every line and leaves you in Normal mode.

After you've marked all your locations with `Ctrl-n`, you can change the visual selection with normal Vim motion commands in Visual mode. You could go to Normal mode by pressing `v` and wield your motion commands there. Single key command to switch to Insert mode such as `c` or `s` from Visual mode or `i`, `a`, `I`, `A` in Normal mode should work without any issues.

At any time, you can press `<Esc>` to exit back to regular Vim.

Two additional keys are also mapped:

- `Ctrl-p` in Visual mode will remove the current virtual cursor and go back to the previous virtual cursor location. This is useful if you are trigger happy with `Ctrl-n` and accidentally went too far.

- `Ctrl-x` in Visual mode will remove the current virtual cursor and skip to the next virtual cursor location. This is useful if you don't want the current selection to be a candidate to operate on later.

Out of the box, only the single key `Ctrl-n` is mapped in regular Vim's Normal mode and Visual mode to provide the functionality mentioned above. `Ctrl-n`, `Ctrl-p`, `Ctrl-x`, and `<Esc>` are mapped in the special multicursor mode once you've added at least one virtual cursor to the buffer. If you don't like the plugin taking over your favorite key bindings, you can turn off the default with

```viml
let g:multi_cursor_use_default_mapping=0
```

You can then map the 'next', 'previous', 'skip', and 'exit' keys like the following:

```viml
" Default mapping
let g:multi_cursor_next_key='<C-n>'
let g:multi_cursor_prev_key='<C-p>'
let g:multi_cursor_skip_key='<C-x>'
let g:multi_cursor_quit_key='<Esc>'
```

[[Vim-multiple-cursors Document Source]](https://github.com/terryma/vim-multiple-cursors)

---

### bundles/vim-indent-guides

Use `<Leader>ig` to open it                                                                                   

Add this to the vimrc file can set default on.
```viml
let g:indent_guides_enable_on_vim_startup = 1 " default on
```

===

## Other tips

---

### Splite window

- `:split` split window verticlly

- `:sp`   as `split`

- `<C-w>s` as `split`

- `:vsplit`   split window horizontally

- `:vs`   as `:vsplit`

- `<C-w>v`    as `:vsplit`

---
**Switch**

- `:set mouse=a`  activate mouse select.

- `<C-w>h`  jump to left window

- `<C-w>j`    jump to bottom window

- `<C-w>k`    Jump to top window

- `<C-w>l`    Jump to right window

- `<C-w>t`    Jump to most top window

- `<C-w>b`    Jump to most bottom window

---
**Close**

- `:q`    close this window, also use `ZZ`

- `:close`    close window

- `:only` close all windows except the current one

- `:qall` close all windows

---
**Adjust window size**

- `<C-w>+`    extend window size

- `<C-w>-`    shrink window size

- `<C-w>=`    split windows with average size

- `<C-w>_`    extend window as much as it can

- `10 <C-w>+` extend window with 10 rows

---
**Open new window with tab mode**

- `:tab sp` Open a new tab

---

### Auto mark complement

When you type the first mark of paired marks, vim would add the other one automatically

.vmlrc file:

```viml
inoremap ( ()<ESC>i
inoremap [ []<ESC>i
inoremap { {}<ESC>i
inoremap < <><ESC>i
inoremap " ""<ESC>i
```

---

**Indent**

Auto indent settings.

```viml
" Indents
set autoindent

set tabstop=4      " 设置Tab键的宽度 [等同的空格个数]
set shiftwidth=4   " 每一次缩进对应的空格数
set softtabstop=4  " 按退格键时可以一次删掉 4 个空格
set smarttab       " insert tabs on the start of a line according to shiftwidth
set expandtab      " 将Tab自动转化成空格 [需要输入真正的Tab键时，使用 Ctrl+V + Tab]
set shiftround     " 缩进时，取整  使用 '<' and '>'标识
```

But when you want to paste multiple-line strings, the auto indent would add unwanted increasing indent in each row. 

- Avoid this by switching to `:set paste` mode.
