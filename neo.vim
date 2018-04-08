" Vundle set up
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.config/nvim/bundle/Vundle.vim
call vundle#begin('~/.config/nvim/bundle')
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
"Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
"Plugin 'L9'
" Git plugin not hosted on GitHub
"Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
"Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
"Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
"Plugin 'ascenator/L9', {'name': 'newL9'}

" gruvbox colorscheme
Plugin 'morhetz/gruvbox'
" nerdtree file browser
Plugin 'scrooloose/nerdtree'
" syntastic
Plugin 'scrooloose/syntastic'
" haskell syntax/indentation
Plugin 'neovimhaskell/haskell-vim'
" haskell hdevtools. Does not provide error reporting, it is provided
" by syntastic with hdevtools checker.
Plugin 'bitc/vim-hdevtools'
" purescript syntax/indentation
Plugin 'raichoo/purescript-vim'
" purescript's ide plugin (build errors, etc.)
Plugin 'FrigoEU/psc-ide-vim'
" paredit for editing s-expressions
Plugin 'vim-scripts/paredit.vim'
" rust support
Plugin 'rust-lang/rust.vim'
" shakespeare templates
Plugin 'pbrisbin/vim-syntax-shakespeare'
" GLSL
Plugin 'tikhomirov/vim-glsl'
" pandoc markdown syntax
Plugin 'vim-pandoc/vim-pandoc-syntax'
" command-t files/buffer/commands/tags fuzzy search
" Plugin 'wincent/command-t'
Plugin 'peterhoeg/vim-qml'
" action script
Plugin 'jeroenbourgois/vim-actionscript'
"
Plugin 'tpope/vim-sleuth'


" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
" End of Vundle set up

set termguicolors   " enable TrueColor / waiting for a new release https://github.com/neovim/neovim/issues/7618 https://github.com/neovim/neovim/issues/7381
set background=dark " dark variant of theme
colorscheme gruvbox " colorscheme
let g:gruvbox_bold=0  " disable bold fonts

let mapleader="," " change the leader to be a comma vs slash

" ctrl-jklm  changes to that split
map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-l> <c-w>l
map <c-h> <c-w>h
" and lets make these all work in insert mode too (<C-O> makes next
" cmd happen as if in command mode)
imap <C-W> <C-O><C-W>

" use jk instead of esc
inoremap jk <esc>
inoremap <esc> <nop>

" Open NerdTree
map <leader>n :NERDTreeToggle<CR>

" Cyrillic
set keymap=russian-jcukenwin
set iminsert=0
set imsearch=0

" Copy/Paste to/from clipboard
map <leader>y "+y
map <leader>p "+p

" Filetype by file extension
autocmd BufNewFile,BufRead *.mako,*.mak,*.jinja2 setlocal ft=html
autocmd BufNewFile,BufRead *.rk setlocal ft=scheme
autocmd BufNewFile,BufRead *.hs setlocal ft=haskell
autocmd BufNewFile,BufRead *.cu,*.cuh setlocal ft=cuda
autocmd BufNewFile,BufRead *.purs setlocal ft=purescript
autocmd BufNewFile,BufRead *.shader setlocal ft=glsl

" Indent options by filetype
autocmd FileType html,xhtml,xml,css,javascript,c,cpp setlocal expandtab shiftwidth=4 tabstop=4 softtabstop=4
autocmd FileType haskell,lisp,racket,purescript setlocal expandtab shiftwidth=2 tabstop=4 softtabstop=2

set colorcolumn=70 " Make it 70 to be sure it will fit in 80 :P
set number         " Display line numbers
set numberwidth=1  " using only 1 column (and 1 space) while possible

set fileencodings=utf-8,cp1251 " Make sure utf8 is tried first and cp1251 is tried at all

" hdevtools bindings
" F1 to highlight and show type of the expression under cursor.
" Repeat to expand expression.
autocmd FileType haskell nnoremap <buffer> <leader>t :HdevtoolsType<CR>
" Clear F1's highlighting
autocmd FileType haskell nnoremap <buffer> <silent> <leader>c :HdevtoolsClear<CR>

" psc-ide bindings
autocmd FileType purescript nnoremap <buffer> <leader>t :PSCIDEtype<CR>
autocmd FileType purescript nnoremap <buffer> <leader>i :PSCIDEimportIdentifier<CR>
autocmd FileType purescript nnoremap <buffer> <leader>h :PSCIDEpursuit<CR>
autocmd FileType purescript nnoremap <buffer> <leader>s :PSCIDEapplySuggestion<CR>
" au FileType purescript nmap <leader>a :PSCIDEaddTypeAnnotation<CR>
" au FileType purescript nmap <leader>r :PSCIDEload<CR>
" au FileType purescript nmap <leader>c :PSCIDEcaseSplit<CR>
" au FileType purescript nmap <leader>qd :PSCIDEremoveImportQualifications<CR>
" au FileType purescript nmap <leader>qa :PSCIDEaddImportQualifications<CR>

" Remove trailing whitespace on <leader>S
nnoremap <leader>S :%s/\s\+$//<cr>:let @/=''<CR>

" displays tabs with :set list & displays when a line runs off-screen
set listchars=tab:·\ ,trail:·,precedes:<,extends:>
set list

" Searching and Patterns
set ignorecase              " Default to using case insensitive searches,
set smartcase               " unless uppercase letters are used in the regex.

" Moving Around/Editing
set cursorcolumn            " have a column indicate the cursor location
set cursorline              " have a line indicate the cursor location
set scrolloff=3             " Keep 3 context lines above and below the cursor (for zt/zb)
set backspace=2             " Allow backspacing over autoindent, EOL, and BOL
set showmatch               " Briefly jump to a paren once it's balanced
set autoindent              " always set autoindenting on
set smartindent             " use smart indent if there is no indent file
set tabstop=4               " <tab> inserts 4 spaces
set shiftwidth=2            " but an indent level is 2 spaces wide.
set softtabstop=4           " <BS> over an autoindent deletes both spaces.
set expandtab               " Use spaces, not tabs, for autoindent/tab key.

" Toggle the tasklist
map <leader>td <Plug>TaskList

" Resize
nmap <a-k> :res +5<CR>
nmap <a-j> :res -5<CR>
nmap <a-h> :vertical res -5<CR>
nmap <a-l> :vertical res +5<CR>

"toggles whether or not the current window is automatically zoomed
" function! ToggleMaxWins()
"   if exists('g:windowMax')
"     au! maxCurrWin
"     wincmd =
"     unlet g:windowMax
"   else
"     augroup maxCurrWin
"         " au BufEnter * wincmd _ | wincmd |
"         "
"         " only max it vertically
"         au! WinEnter * wincmd _
"     augroup END
"     do maxCurrWin WinEnter
"     let g:windowMax=1
"   endif
" endfunction
" nnoremap <leader>z :call ToggleMaxWins()<CR>
nnoremap <C-w>v :85vsplit<CR>

" Files to ignore for NERDTree
let NERDTreeIgnore = ['\~$'] " default
let NERDTreeIgnore+= ['\.o$[[file]]', '\.gch$[[file]]'] " object files
let NERDTreeIgnore+= ['\.py[co]$[[file]]', '^__pycache__$[[dir]]', '\.egg-info$[[dir]]'] " Python
let NERDTreeIgnore+= ['\.hi$[[file]]'] " Haskell

let g:syntastic_cpp_checkers = ['gcc']
let g:syntastic_python_pylint_args = "--disable=missing-docstring,invalid-name,too-few-public-methods"

augroup pandoc_syntax
    au! BufNewFile,BufFilePre,BufRead *.md set filetype=markdown.pandoc
    au! BufNewFile,BufFilePre,BufRead *.page set filetype=markdown.pandoc
augroup END

au! BufNewFile,BufFilePre,BufRead *.rml set filetype=xml
au! BufNewFile,BufFilePre,BufRead *.rcss set filetype=css

map <leader>tt :CommandTTag<CR>
