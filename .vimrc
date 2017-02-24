set nocompatible              " required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" Add all your plugins here (note older versions of Vundle used Bundle instead of Plugin)

Plugin 'scrooloose/nerdtree'             " Nice "project" tree
Plugin 'klen/python-mode'                " Python super plugin
Plugin 'w0rp/ale'                        " Asynchronous linter
Plugin 'Chiel92/vim-autoformat'          " Auto format
Plugin 'fisadev/vim-isort'               " Vim plugin to sort python imports using isort
                                         " Just call the :Isort command, and it will reorder the imports of the current python " file. Or select a block of imports with visual mode, and press Ctrl-i to sort them.
                                         " Install dependency with pip2.7 install isort
Plugin 'Valloric/YouCompleteMe'          " Awesome autocomplete plugin
                                         " Needs to be compiled at the folder of installation 
                                         " python ~/.vim/bundle/YouCompleteMe/install.py
Plugin 'tmhedberg/SimpylFold'            " Simple Fold plugin
Plugin 'vim-scripts/indentpython.vim'    " Autoindent will help but in some cases (like when a function signature spans multiple lines), 
Plugin 'jnurmine/Zenburn'                " Color schemes
Plugin 'kien/ctrlp.vim'                  " Super search
Plugin 'nelstrom/vim-visual-star-search' " Search in visual mode
Plugin 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'} " nice Toolbar




" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" ----------------------------------- stuff
map <F2> :NERDTreeToggle<CR>      " Toggle project bar
nnoremap <space> za               " Enable folding with the spacebar
set encoding=utf-8                " For the most part, you should be using UTF8 when working with Python
                                  " White spaces
                                  " python with virtualenv support
let g:pymode = 1                  " Turn on the whole plugin, klen/python-mode
let g:pymode_trim_whitespaces = 1 " Trim unused white spaces on save
let g:pymode_options = 1          " Setup default python options https://github.com/python-mode/python-mode/blob/develop/doc/pymode.txt
let g:pymode_indent = 1           " Enable pymode indentation 
let g:pymode_folding = 1          " Fast and usual python folding in Vim.
set foldlevel=99                  " Quit folding by default... So anoying
let g:pymode_doc = 1              " Turns on the documentation script 
let g:pymode_doc_bind = 'K'       " Bind keys to show documentation for current word (selection)
set clipboard=unnamed             " System clipboard
                                  " Mouse and backspace
set mouse=a                       " on OSX press ALT and click
set bs=2                          " make backspace behave like normal again

" Rebind <Leader> key
" I like to have it here becuase it is easier to reach than the default and
" it is next to ``m`` and ``n`` which I use for navigating between tabs.
" @ref - https://github.com/mbrochh/vim-as-a-python-ide/blob/master/.vimrc#L30
" @ref - https://youtu.be/YhqsjUUHj6g?t=13m5s
let mapleader = ","               " Rebind <Leader>

" Quicksave command typical Cntrl + S of the all life
" Note - Need to put some instrucctions into your bashrc or ~/.zshrc to pass the Cntrl + S to vim
" Note - to zsh is
"           # zsh
"           alias vim="stty stop '' -ixoff ; vim"
"           # `Frozing' tty, so after any command terminal settings will be restored
"           ttyctl -f"
noremap <C-S> :update<CR>         " Quicksave command typical Cntrl + S of the all life
vnoremap <C-S> <C-C>:update<CR>   " Quicksave command typical Cntrl + S of the all life
inoremap <C-S> <C-O>:update<CR>   " Quicksave command typical Cntrl + S of the all life

" Quick quit command
noremap <Leader>q :quit<CR>  " Quit current window :q
noremap <Leader>Q :qa!<CR>   " Quit all windows    :Q

" bind Ctrl+<movement> keys to move around the windows, instead of using Ctrl+w + <movement>
" Every unnecessary keystroke that can be saved is good for your health :)
map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-l> <c-w>l
map <c-h> <c-w>h

" easier moving between tabs
map <Leader>n <esc>:tabprevious<CR>
map <Leader>m <esc>:tabnext<CR>

" New tab with cntrl + t
nnoremap <C-t>     :tabnew<CR>
inoremap <C-t>     <Esc>:tabnew<CR>


" map sort function to a key
vnoremap <Leader>s :sort<CR>


" easier moving of code blocks
" Try to go into visual mode (v), thenselect several lines of code here and
" then press ``>`` several times.
vnoremap < <gv  " better indentation
vnoremap > >gv  " better indentation


" Disable stupid backup and swap files - they trigger too many events
" for file system watchers
set nobackup
set nowritebackup
set noswapfile

" Settings for vim-powerline
set laststatus=2

" Settings for ctrlp
let g:ctrlp_max_height = 30
set wildignore+=*.pyc
set wildignore+=*_build/*
set wildignore+=*/coverage/*

"-----
let g:pymode_virtualenv = 1       " Enable automatic virtualenv detection
let g:pymode_virtualenv_path = $VIRTUAL_ENV
"-----
let NERDTreeIgnore=['\.pyc$', '\~$'] "ignore files in NERDTree

" If you prefer the Omni-Completion tip window to close when a selection is
" made, these lines close it on movement in insert mode or when leaving
" insert mode
autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
autocmd InsertLeave  * if pumvisible() == 0|pclose|endif

" Identation standar
au BufNewFile,BufRead *.js, *.html, *.css
    \ set tabstop=2     |
    \ set softtabstop=2 |    
    \ set shiftwidth=2

" Add a bit of logic to define which scheme to use based upon the VIM mode
if has('gui_running')
  set background=dark
  colorscheme solarized
else
  colorscheme zenburn
endif

let python_highlight_all=1
syntax on