" **************************************************************************** "
"                                                                              "
"                                                         :::      ::::::::    "
"    .vimrc                                             :+:      :+:    :+:    "
"                                                     +:+ +:+         +:+      "
"    By: cempassi <cempassi@student.42.fr>          +#+  +:+       +#+         "
"                                                 +#+#+#+#+#+   +#+            "
"    Created: 2019/08/02 03:50:37 by cempassi          #+#    #+#              "
"    Updated: 2019/08/03 19:27:55 by cempassi         ###   ########.fr        "
"                                                                              "
" **************************************************************************** "

set nocompatible
set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath

" leader settings
let mapleader="-"
let maplocalleader="_"

if &loadplugins
	if has('packages')
		packadd! 42header
		packadd! airline
		packadd! airline-theme
		packadd! ale
		packadd! command-t
		packadd! coc
		packadd! gutentags
		packadd! fugitive
	endif
endif

function! TrailingWhitespaces()
	:%s/\s\+$//ge
endfunction

if has("nvim")
	let g:ruby_host_prog = '/Users/cempassi/.brew/lib/ruby/gems/2.6.0/gems/neovim-0.8.1/exe/neovim-ruby-host'
endif

" System copy-paste
vnoremap <silent><leader>y "*
nnoremap <silent><leader>p "*p
inoremap <silent><leader>p <esc>"*pa

function! Netrw_close_win()
	if &ft ==# "netrw"
		normal! :bwipe<cr>
	endif
endfunction

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
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

autocmd BufLeave * :call Netrw_close_win()

let g:netrw_browse_split = 0
autocmd BufRead,BufNewFile *.h,*.c set filetype=c
filetype plugin indent on
syntax on
