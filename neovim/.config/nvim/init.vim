"                               %@@@@@@@@@@@@@@@@@/                              
"                        %@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@,                       
"                    @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@                   
"                .@@@@@@@@  ,@@@@@@,           &@@@@@@   @@@@@@@@                
"              @@@@@@@     @@@@@#                 @@@@@@     @@@@@@@             
"            @@@@@@       @@@@@     @@@@@@@   .     @@@@@       @@@@@@           
"          @@@@@@        &@@@@     @@@@@@@&    @     @@@@,        @@@@@@         
"        &@@@@@          @@@@@    %@@@@@@@@@@@@@,    @@@@&          @@@@@*       
"          @@@@@@        &@@@@     @@@@@@@@@@@@@     @@@@         @@@@@@         
"            @@@@@@       @@@@@      @@@@@@@@@      @@@@@      ,@@@@@@           
"              @@@@@@@     @@@@@@                 @@@@@@    *@@@@@@@             
"                 @@@@@@@@   @@@@@@@           @@@@@@@  ,@@@@@@@@                
"                    @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@(                   
"                         @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@                        
"                                @@@@@@@@@@@@@@@@%                               

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
set lazyredraw
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
set shortmess=atAOI
set autoread
set autowrite
set autowriteall
set guicursor=


" Define base syntax
filetype plugin indent on
syntax on 

color default
set guifont=Hasklig\ Light:h15
set termguicolors
let g:monochrome_style="subtle"
colorscheme monochrome
let &t_8f="\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b="\<Esc>[48;2;%lu;%lu;%lum"

"Color scheme for :Term
" let g:terminal_color_0 = '#3B4252' "Black
" let g:terminal_color_1 = '#81A1C1' "Dark Blue
" let g:terminal_color_2 = '#A3BE8C' "Dark Green
" let g:terminal_color_3 = '#88C0D0' "Dark Cyan
" let g:terminal_color_4 = '#BF616A' "Dark Red
" let g:terminal_color_5 = '#B48EAD' "Dark Magenta
" let g:terminal_color_6 = '#EBCB8B' "Dark Yellow/ Brown
" let g:terminal_color_7 = '#E5E9F0' "Light Gray
" let g:terminal_color_8 = '#4C566A' "Black
" let g:terminal_color_9 = '#81A1C1' "Light Blue
" let g:terminal_color_10 = '#A3BE8C' "Light Green
" let g:terminal_color_11 = '#48bfe3' "Light Cyan
" let g:terminal_color_12 = '#BF616A' "Light Red
" let g:terminal_color_13 = '#B48EAD' "Light Magenta
" let g:terminal_color_14 = '#EBCB8B' "Light Yellow/ Brown
" let g:terminal_color_15 = '#ECEFF4' "Light Gray
" let g:terminal_color_45 = '#caf0f8' "Lightest Blue

" let g:terminal_color_0 = '#222222'
" let g:terminal_color_243 = '#767676'
" let g:terminal_color_15 = '#F5F5F5'
" let g:terminal_color_8 = '#424242'
" let g:terminal_color_240 = '#545454'
" let g:terminal_color_20 = '#1F262D'
" let g:terminal_color_236 = '#303030'
" let g:terminal_color_249 = '#999999'
" let g:terminal_color_251 = '#CCCCCC'
" let g:terminal_color_251 = '#E5E5E5'
" let g:terminal_color_1 = '#bb010b'
" let g:terminal_color_1 = '#b23a48'
" let g:terminal_color_1 = '#9EC5E6'
" let g:terminal_color_4 = '#005CA3 '
" let g:terminal_color_153 = '#339CFF'
" let g:terminal_color_45 = '#caf0f8'
" let g:terminal_color_6 = '#005d5d'
" let g:terminal_color_14 = '#48bfe3'
" let g:terminal_color_2 = '#74AA80'
" let g:terminal_color_10 = '#AAf683'
" let g:terminal_color_5 = '#523C79'
" let g:terminal_color_13 = '#6855DE'
" let g:terminal_color_11 = '#F3E430'
" let g:terminal_color_3 = '#FED485'

"" Plugin Management
lua require('init')
lua require('plugins')
lua require('after')
lua require'colorizer'.setup()

"Save all the files, all the times
augroup save
  au!
  au FocusLost * wall
augroup END

"python configuration
let g:python_host_prog='/Users/cempassi/.pyenv/versions/neovim2/bin/python'
let g:python3_host_prog='/Users/cempassi/.pyenv/versions/neovim3/bin/python'

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
if has('persistent_undo')
	" define a path to store persistent_undo files.
	let target_path = expand('~/.vim/undodir/')

	" create the directory and any parent directories
	" if the location does not exist.
	if !isdirectory(target_path)
		call mkdir(target_path, "p")
	endif

	" Point Vim to the defined undo directory.
	let &undodir = target_path

	" Enable undo persistence.
	set undofile
	set undolevels=1000
endif

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

set updatetime=300

" Remove trailing whitespaces
function! TrailingWhitespaces()
	:%s/\s\+$//ge
endfunction

autocmd BufRead,BufNewFile *.h,*.c set filetype=c

let g:colorcoder_enable_filetypes=['c', 'cpp', 'python']

" Get syntax group

function! SynGroup()                                                            
    let l:s = synID(line('.'), col('.'), 1)                                       
    echo synIDattr(l:s, 'name') . ' -> ' . synIDattr(synIDtrans(l:s), 'name')
endfun

nnoremap <leader><F10> :call SynGroup()<CR>

"mutt syntax
autocmd BufNewFile,BufRead *.mutt set syntax=neomuttrc

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
set formatoptions+=r    " But do continue when pressing enter.
set formatoptions+=n    " Indent past the formatlistpat, not underneath it.
set formatoptions+=j    " Auto-remove comments if possible.
set formatoptions-=2    " Useless option
set nojoinspaces        " Useless option 2

" ------------------------------------- Testing -------------------------------

" Unmap Gitmessenger
let g:git_messenger_no_default_mappings = v:true

" Omnisharp configuration
let g:OmniSharp_server_stdio = 1

"" Devicons
let g:webdevicons_enable_startify = 1

if exists("g:loaded_webdevicons")
	call webdevicons#refresh()
endif

au TextYankPost * silent! lua require'vim.highlight'.on_yank{"Substract", 200}

" Replace netrw
let g:loaded_netrwPlugin = 1

"nmap <leader>le <Plug>(Luadev-RunLine)
let g:neovide_fullscreen=v:true
highlight link TelescopeMatching Question

nnoremap <silent> <F5> :lua require'dap'.continue()<CR>
nnoremap <silent> <F10> :lua require'dap'.step_over()<CR>
nnoremap <silent> <F11> :lua require'dap'.step_into()<CR>
nnoremap <silent> <F12> :lua require'dap'.step_out()<CR>
nnoremap <silent> <leader>+ :lua require'dap'.toggle_breakpoint()<CR>
nnoremap <silent> <leader>* :lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>
nnoremap <silent> <leader>lp :lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<CR>
nnoremap <silent> <leader>dr :lua require'dap'.repl.open()<CR>
nnoremap <silent> <leader>dl :lua require'dap'.repl.run_last()<CR>
