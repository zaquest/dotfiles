" Vundle set up
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.config/nvim/bundle/Vundle.vim

" Append this to your .vimrc to add merlin to vim's runtime-path:
let g:opamshare = substitute(system('opam config var share'),'\n$','','''')
execute "set rtp+=" . g:opamshare . "/merlin/vim"
" Also run the following line in vim to index the documentation:
execute "helptags " . g:opamshare . "/merlin/vim/doc"

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
" airline statusline
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
" syntastic
" Plugin 'scrooloose/syntastic'
" coc
Plugin 'neoclide/coc.nvim'
" haskell syntax/indentation
Plugin 'neovimhaskell/haskell-vim'
" haskell hdevtools. Does not provide error reporting, it is provided
" by syntastic with hdevtools checker.
" Plugin 'bitc/vim-hdevtools'
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
" JS syntax
Plugin 'othree/yajs.vim'
" python mode
" Plugin 'python-mode/python-mode'
" Nearly grammars
Plugin 'tjvr/vim-nearley'
" TypeScript
Plugin 'Quramy/tsuquyomi'
" Plugin 'Quramy/tsuquyomi-vue'
" zig language
Plugin 'ziglang/zig.vim'
" BuckleScript
Plugin 'reasonml-editor/vim-reason-plus'
" Thrift
Plugin 'solarnz/thrift.vim'
"
Plugin 'Shougo/vimproc.vim'
" easy quotes editing
Plugin 'tpope/vim-surround'
" vue single file component syntax highlighting
Plugin 'posva/vim-vue'
" Plugin 'leafOfTree/vim-vue-plugin'
" vim-vue + syntastic
" Plugin 'sekel/vim-vue-syntastic'
" D language
Plugin 'idanarye/vim-dutyl'
" Pug templates
" Plugin 'digitaltoad/vim-pug'
" python indent
Plugin 'Vimjas/vim-python-pep8-indent'

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
let g:gruvbox_contrast_dark='hard'

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
autocmd BufNewFile,BufRead *.cjs setlocal ft=javascript

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
" autocmd FileType haskell nnoremap <buffer> <leader>t :HdevtoolsType<CR>
" Clear F1's highlighting
" autocmd FileType haskell nnoremap <buffer> <silent> <leader>c :HdevtoolsClear<CR>
" Make hdevtools use stack
" let g:hdevtools_stack = 1

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

" Find closes to `file_path` file `target`, by going up the directory
" tree starting from `file_path`'s directory
function! GetBufferClosest(target)
  let file_path = expand('<afile>:p:h', 1)
  let file_dir = fnamemodify(file_path, ':p:h')
  return findfile(a:target, escape(file_dir, ' ') . ';')
endfunction

" let g:syntastic_c_checkers = ['gcc']
" let g:syntastic_cpp_checkers = ['gcc']
" let g:syntastic_ocaml_checkers = ['merlin']
" 
" autocmd FileType python let b:syntastic_python_pylint_args = '--rcfile=' . GetBufferClosest('.pylintrc')
" let g:syntastic_python_checkers = ['pylint']
" 
" let g:syntastic_c_config_file = '.syntastic_c_config'
" let g:syntastic_cpp_config_file = '.syntastic_cpp_config'

autocmd BufNewFile,BufRead *.ts setlocal filetype=typescript
" let g:tsuquyomi_disable_quickfix = 1
" let g:syntastic_typescript_checkers = ['tsuquyomi', 'eslint']

" syntastic/javascript/eslint

" set eslint to be javascript checker
" let g:syntastic_javascript_checkers=['eslint']

" Finds npm package root directory (the one with package.json) when
" given the path of one of the files in the package. Works by going
" up from the given path and looking for package.json in each
" directory, until package.json is found.
function! GetNPMPackageDir(file_path)
  let file_dir = fnamemodify(a:file_path, ':p:h')
  let package_json = findfile('package.json', escape(file_dir, ' ') . ';')
  return fnamemodify(package_json, ':p:h')
endfunction

function! GetESLintExe(file_path)
  let package_dir = GetNPMPackageDir(a:file_path)
  let eslint_exe = package_dir . '/node_modules/.bin/eslint'
  return 'cd ' . package_dir . ' && ' . eslint_exe
endfunction

" autocmd FileType javascript let b:syntastic_javascript_eslint_exe = GetESLintExe(expand('<afile>:p:h', 1))
" autocmd FileType javascript let b:syntastic_javascript_eslint_fname = expand('<afile>:p', 1)
" autocmd FileType vue let b:syntastic_vue_eslint_exe = GetESLintExe(expand('<afile>:p:h', 1))
" autocmd FileType vue let b:syntastic_vue_eslint_fname = expand('<afile>:p', 1)
" autocmd FileType typescript let b:syntastic_typescript_eslint_exe = GetESLintExe(expand('<afile>:p:h', 1))
" autocmd FileType typescript let b:syntastic_typescript_eslint_fname = expand('<afile>:p', 1)

" Use pandoc markdown for .md and .page files
augroup pandoc_syntax
    au! BufNewFile,BufFilePre,BufRead *.md set filetype=markdown.pandoc
    au! BufNewFile,BufFilePre,BufRead *.page set filetype=markdown.pandoc
augroup END

" What are rml and rcss? might be librocket from warsow
au! BufNewFile,BufFilePre,BufRead *.rml set filetype=xml
au! BufNewFile,BufFilePre,BufRead *.rcss set filetype=css

" Syntastic debug
" let g:syntastic_debug = 1

" enable markdown syntax highlighting
let g:pandoc#syntax#codeblocks#embed#use = 1
let g:pandoc#syntax#codeblocks#embed#langs = ['python']

set grepprg=grep\ --color=never\ --recursive\ --line-number\ --binary-files=without-match\ --exclude-dir=.git\ --exclude-dir=.stack-work


" The following function runs unittests on the current file and
" displays coverage information as a split window bound to left of the source window
function! DTest()
  let l:fn = substitute(expand('%:r'), '/', '-', 'g') . '.lst'
  call delete(l:fn)
  cexpr system('dmd -cov -unittest -main -run ' . expand('%'))
  if filereadable(l:fn)
     normal gg
     execute 'vsplit' l:fn
     normal gg
     set scrollbind
     normal l
     set scrollbind
  endif
endfunction

autocmd FileType d set efm=%*[^@]@%f\(%l\):\ %m,%f\(%l\\,%c\):\ %m,%f\(%l\):\ %m
autocmd FileType d nnoremap <f8> :call DTest()<cr>


" *** Following is CoC example config ***

" TextEdit might fail if hidden is not set.
set hidden

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
" set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Remap <C-f> and <C-b> for scroll float windows/popups.
" Note coc#float#scroll works on neovim >= 0.4.3 or vim >= 8.2.0750
nnoremap <nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
nnoremap <nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
inoremap <nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
inoremap <nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"

" NeoVim-only mapping for visual mode scroll
" Useful on signatureHelp after jump placeholder of snippet expansion
if has('nvim')
  vnoremap <nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#nvim_scroll(1, 1) : "\<C-f>"
  vnoremap <nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#nvim_scroll(0, 1) : "\<C-b>"
endif

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of language server.
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
" set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings for CoCList
" Show all diagnostics.
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>

let g:airline_powerline_fonts = 1

" let g:vim_vue_plugin_load_full_syntax = 1
" let g:vim_vue_plugin_use_pug = 1
