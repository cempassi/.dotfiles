
if v:progname == 'vi'
  set noloadplugins
endif

if &compatible
  set nocompatible
endif

" Map leader key
let mapleader=" "

" General settings
scriptencoding UTF-8
set encoding=UTF-8
let &packpath = &runtimepath
set clipboard+=unnamedplus
set showcmd
set hlsearch
set hidden
set mouse=a
set scrolloff=10
set textwidth=80
set splitbelow
set ignorecase
set smartcase
set wrap linebreak nolist
set switchbuf="useopen,usetab,uselast"
set timeoutlen=500 
set relativenumber numberwidth=3
set number
set shortmess=atAOIF
set autoread
set autowrite
set autowriteall
set guicursor=
set laststatus=3
set updatetime=300
set laststatus=3
set cursorline

" Define base syntax
filetype plugin indent on
syntax on 

colorscheme nordic

"" Plugin Management
lua require('init')
lua require('after')

set termguicolors
"let g:monochrome_style="subtle"
if !has('gui_running') && &term =~ '^\%(screen\|tmux\)'
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
endif


"Save all the files, all the times
augroup save
  au!
  au FocusLost * wall
augroup END

"python configuration
let g:no_python_maps='true'

" Turn bell off
set belloff=all

if has('nvim')
  set signcolumn=number
endif

"Reload file after external modification
set autoread
au FocusGained * :checktime

" Persistent undo
" Keep undo history across sessions by storing it in a file
" define a path to store persistent_undo files.
let undo_path = expand('~/.local/share/nvim/undodir')

" create the directory and any parent directories
" if the location does not exist.
if !isdirectory(undo_path)
  call mkdir(undo_path, "p")
endif

" Point Vim to the defined undo directory.
let &undodir = undo_path

" Enable undo persistence.
set undofile
set undolevels=1000

" Man page reader
let $PAGER=''

" Path finding
set path=**,/usr/local/include,,

" ignore filetypes
set wildignore=*.o,*.pyc

" Remove system include from completion
set complete-=i

" Folding and windows
set foldmethod=syntax

if has ('folding')
  if has ('windows')
    set fillchars=vert:\│ 			"Box drawing
    set fillchars=vert:\│ 			"Box drawing
    set fillchars+=fold:∙
    set fillchars+=eob:\ 
  endif
  set foldenable
  set foldnestmax=1
  set foldmethod=syntax
  set foldlevelstart=5
endif

" backspace
set backspace=indent,eol,start

" Default Indentation
set autoindent
set tabstop=4
set shiftwidth=4
set expandtab

" Remove trailing whitespaces
function! TrailingWhitespaces()
  :%s/\s\+$//ge
endfunction

autocmd BufRead,BufNewFile *.h,*.c set filetype=c
au BufRead,BufNewFile Dockerfile*  set filetype=dockerfile

"This autocommand jumps to the last known position in a file
"just after opening it, if the '" mark is set:

au BufReadPost *
      \ if line("'\"") > 1 && line("'\"") <= line("$") && &ft !~# 'commit'
      \ |   exe "normal! g`\""
      \ | endif


"Formating options
set formatoptions-=a    " Turn off auto formating.
set formatoptions-=t    " Turn off auto formating.
set formatoptions+=c    " Comment respect textwidth
set formatoptions+=q    " Allow formatting comments w/ gq
set formatoptions-=o    " O and o, don't continue comments
set formatoptions-=r    " But do continue when pressing enter.
set formatoptions+=n    " Indent past the formatlistpat, not underneath it.
set formatoptions+=j    " Auto-remove comments if possible.
set formatoptions-=2    " Useless option
set nojoinspaces        " Useless option 2

" Terminal mapping
tnoremap   jk <C-\><C-n>
tnoremap   <silent>   <leader>tc        <C-\><C-n>:FloatermNew<CR>
tnoremap   <silent>   <leader>q         <C-\><C-n>:FloatermKill<CR>
tnoremap   <silent>   <leader><leader>  <C-\><C-n>:FloatermToggle<CR>

" ------------------------------------- Testing -------------------------------

"" Devicons
let g:webdevicons_enable_startify = 1

if exists("g:loaded_webdevicons")
  call webdevicons#refresh()
endif

" Replace netrw
let g:loaded_netrwPlugin = 1

"nmap <leader>le <Plug>(Luadev-RunLine)
let g:neovide_fullscreen=v:true

highlight! link TelescopeMatching Question 
highlight! link WarningMsg TSWarning
highlight! link vimWarn TSWarning
highlight! link NormalFloat TelescopeBorder
