" Buffer shortcuts
nnoremap <silent><leader>b :ls<cr>
nnoremap <silent><leader>bn :bn<cr>
nnoremap <silent><leader>bp :bp<cr>
nnoremap <silent><leader>bd :bdelete<cr>

" Window shortcuts
nnoremap <silent><leader>k :wincmd k<CR>
nnoremap <silent><leader>j :wincmd j<CR>
nnoremap <silent><leader>h :wincmd h<CR>
nnoremap <silent><leader>l :wincmd l<CR>
nnoremap <silent><leader>zi <C-w>_
nnoremap <silent><leader>= <C-w>=
nnoremap <silent><leader>r <C-w>r
nnoremap <silent><leader>R <C-w>R
nnoremap <silent><leader><BS> <C-w><C-x>
nnoremap <silent><leader>> <C-w>>
nnoremap <silent><leader>< <C-w><

" save files and quit
nnoremap <silent><leader>ww :w<cr>
nnoremap <silent><leader>wa :wa<cr>
nnoremap <silent><leader>xx :x<cr>
nnoremap <silent><leader>xa :xa<cr>
nnoremap <silent><leader>qq :q<cr>
nnoremap <silent><leader>qa :qa<cr>

" Split window
nnoremap <silent><leader>vs :vsplit<cr>
nnoremap <silent><leader>hs :split<cr>

" tab shortcuts
nnoremap <silent><leader>tt :tabs<cr>
nnoremap <silent><leader>tn :tabn<cr>
nnoremap <silent><leader>tc :tabnew<cr>
nnoremap <silent><leader>tp :tabp<cr>
nnoremap <silent><silent><leader>td :tabclose<cr>
nnoremap <silent><leader>t<F1> 1gt
nnoremap <silent><leader>t<F2> 2gt
nnoremap <silent><leader>t<F3> 3gt
nnoremap <silent><leader>t<F4> 4gt
nnoremap <silent><leader>t<F5> 5gt
nnoremap <silent><leader>t<F6> 6gt
nnoremap <silent><leader>t<F7> 7gt
nnoremap <silent><leader>t<F8> 8gt
nnoremap <silent><leader>t<F9> 9gt
nnoremap <leader>t<F0> 10gt

"Tags
nnoremap <silent><leader>gf <C-]>zz
nnoremap <silent><leader>gt <C-t>zz
nnoremap <silent><leader>gg :tn<cr>zz
nnoremap <silent><leader>gs <C-w>}
nnoremap <silent><leader>gn :ptnext<cr>
nnoremap <silent><leader>gd :pc<cr>

" Old cursor
nnoremap <silent><leader>o <C-o>
nnoremap <silent><leader>i <C-i>

"visual block
nnoremap <leader>vb <C-v>

" vimrc shortcuts
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr> :echom ".vimrc sourced successfully!"<cr>

"delete previous hilighting turn of hilighting
nnoremap <silent><leader>nh :let @/ = ""<cr>

" Browse from current file path
nnoremap <silent><leader>. :E<cr>

"Make shortcuts
nnoremap <silent><leader>mk :wa<cr>:bo terminal make<CR>
nnoremap <silent><leader>md :wa<cr>:bo terminal make debug<CR>
nnoremap <silent><leader>mr :wa<cr>:bo terminal make run<CR>
nnoremap <silent><leader>mf :wa<cr>:bo terminal make fclean<CR>
nnoremap <silent><leader>mc :wa<cr>:bo terminal make clean<CR>
nnoremap <silent><leader>mn :cn<CR>
nnoremap <silent><leader>mp :cp<CR>
nnoremap <silent><leader>me :cw<CR>

"ALE -- Jump between errors
nnoremap <silent><leader>en :ALENext<cr>
nnoremap <silent><leader>ep :ALEPrevious<cr>

" CommandT -- Mapping
nnoremap <silent><leader><cr> :CommandT<cr>
