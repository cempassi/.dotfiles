--                                %@@@@@@@@@@@@@@@@@/
--                         %@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@,
--                     @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
--                 .@@@@@@@@  ,@@@@@@,           &@@@@@@   @@@@@@@@
--               @@@@@@@     @@@@@#                 @@@@@@     @@@@@@@
--             @@@@@@       @@@@@     @@@@@@@   .     @@@@@       @@@@@@
--           @@@@@@        &@@@@     @@@@@@@&    @     @@@@,        @@@@@@
--         &@@@@@          @@@@@    %@@@@@@@@@@@@@,    @@@@&          @@@@@*
--           @@@@@@        &@@@@     @@@@@@@@@@@@@     @@@@         @@@@@@
--             @@@@@@       @@@@@      @@@@@@@@@      @@@@@      ,@@@@@@
--               @@@@@@@     @@@@@@                 @@@@@@    *@@@@@@@
--                  @@@@@@@@   @@@@@@@           @@@@@@@  ,@@@@@@@@
--                     @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@(
--                          @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
--                                 @@@@@@@@@@@@@@@@%

_G.load_config = function()
	require("config.options")
end


vim.opt.encoding = "UTF-8"
--vim.opt.scriptencoding = "UTF-8"
vim.opt.showcmd = true
vim.opt.clipboard:append('unnamedplus')
vim.opt.hlsearch = true
vim.opt.hidden = true
vim.opt.mouse = 'a'
vim.opt.scrolloff = 10
vim.opt.textwidth = 80
vim.opt.splitbelow = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.wrap = true
vim.opt.linebreak = true
vim.opt.switchbuf = "useopen,usetab,uselast"
vim.opt.timeoutlen = 500
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.numberwidth = 3
vim.opt.shortmess = "atAOIF"
vim.opt.autoread = true
vim.opt.autowrite = true
vim.opt.autowriteall = true
vim.opt.guicursor = ""
vim.opt.laststatus = 3
vim.opt.updatetime = 300
vim.opt.cursorline = true
vim.opt.termguicolors = true
vim.opt.belloff = "all"
vim.opt.signcolumn = "number"
vim.opt.autoread = true
vim.opt.undofile = true
vim.opt.autoindent = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.formatoptions:append("c") -- Comment respect textwidth
vim.opt.formatoptions:append("q") -- Allow formatting comments w/ gq
vim.opt.formatoptions:append("n") -- Indent past the formatlistpat, not underneath it.
vim.opt.formatoptions:remove("a") -- Turn off auto formating.
vim.opt.formatoptions:remove("t") -- Turn off auto formating.
vim.opt.formatoptions:remove("o") -- O and o, don't continue comments
vim.opt.formatoptions:remove("r") -- But do continue when pressing enter.

vim.cmd [[colorscheme nordic]]

require('init')
require('after')

vim.cmd ([[

if v:progname == 'vi'
  set noloadplugins
endif

if &compatible
  set nocompatible
endif

" Map leader key
let mapleader=" "

" General settings
let &packpath = &runtimepath


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
]])

load_config()
