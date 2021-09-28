" -------------------------------------- Mappings ------------------------------

" leader settings
nnoremap <Space> <nop>

" change escape to jk
inoremap jk <esc>
cnoremap jk <C-c>
tnoremap jk <C-\><C-n>
vnoremap jk <esc>

"Close surrondings
inoremap <> <><Left>
inoremap (( ()<Left>
inoremap {{ {}<Left>
inoremap [[ []<Left>
inoremap "" ""<Left>
inoremap '' ''<Left>
inoremap `` ``<Left>

" Accents and special characters
inoremap <silent>,. <C-k>

" No arrow keys
inoremap <right> <nop>
inoremap <left> <nop>
inoremap <up> <nop>
inoremap <down> <nop>

" Normal mode

"Invert colon and semicolon
nnoremap ; :
nnoremap , ;

" Remap next/previous f or t
nnoremap <Bslash> ,
vnoremap ; :
vnoremap , ;
vnoremap <Bslash> ,

" Buffer shortcuts
nnoremap <silent><tab> :bn<cr>
nnoremap <silent><S-tab> :bp<cr>
nnoremap <silent><leader>bd :bp\|bdelete! #<cr>

" Previous buffer
nnoremap <silent><leader>p <C-^>

" File exploration
nnoremap <silent><leader>fe :Dirvish<CR>

" Registers 
nnoremap <silent><leader>re i<C-r>
nnoremap <silent><leader>rp i<C-r>0<esc>
nnoremap <silent><Leader>rc :let @a=@" \| let @"=@+ \| let @+=@a<CR>

" Window shortcuts
" Move between windows
nnoremap <silent><leader>h :wincmd h<CR>
nnoremap <silent><leader>j :wincmd j<CR>
nnoremap <silent><leader>k :wincmd k<CR>
nnoremap <silent><leader>l :wincmd l<CR>

" Shift panes to horizontal or vertical
nnoremap <silent><leader>H <C-w>K
nnoremap <silent><leader>V <C-w>H
nnoremap <silent><leader>= <C-w>=

"Toogle scrolloff
nnoremap <silent><Leader>_ :let &scrolloff=999-&scrolloff<CR>

"Shift window
nnoremap <silent><leader><BS> <C-w><C-x>
nnoremap <silent><leader>> <C-w>r
nnoremap <silent><leader>< <C-w>R
nnoremap <silent><leader>O <C-w>o

"Sane line moves
noremap <silent> k gk
noremap <silent> j gj
noremap <silent> 0 g0
noremap <silent> $ g$

" Unmap Q
noremap Q <nop>

" save files and quit
nnoremap <silent><leader>x :x<cr>
nnoremap <silent><leader>q :q<cr>
nnoremap <silent><leader>Q :qa!<cr>

" Redo
nnoremap <silent><leader>u <c-r>

" Split window
nnoremap <silent><leader>vs :vsplit<cr>
nnoremap <silent><leader>hs :split<cr>

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

" Goyo
nnoremap <silent> <leader>zz :Goyo<cr>

" Git
nmap <leader>ga :Git add %<cr>
nmap <leader>g<Enter> :Git commit<cr>
nmap <leader>G<Enter> :Git commit --all<cr>
nmap <leader>g<BS> :Git commit --amend --no-edit<cr>
nmap <leader>g<Del> :Git restore %<cr>
nmap <leader><Home> :Gcd<cr>
nmap <leader><PageUp> <cmd>FloatermNew --disposable git push<cr>
nmap <leader><PageDown> <cmd>FloatermNew --disposable git pull<cr>
nmap <leader>gl<leader> <cmd>FloatermNew --disposable git ls<cr>
nmap <leader>gL<leader> <cmd>FloatermNew --disposable git log<cr>
nmap <leader>gf :Git fetch<cr>
nmap <leader>gr :GRename <cr>

"Gitgutter
nmap <leader>ge :GitGutterToggle<cr>
nmap <leader>gh :GitGutterLineHighlightsToggle<cr>

"Preview hunk
nmap <leader>g? <Plug>(GitGutterPreviewHunk)

"Stage or undo hunk
nmap <leader>gs <Plug>(GitGutterStageHunk)
nmap <leader>gu <Plug>(GitGutterUndoHunk)

"Move between hunks
nmap <leader>gj <Plug>(GitGutterNextHunk)
nmap <leader>gk <Plug>(GitGutterPrevHunk)

"Hunk text object
omap ih <Plug>(GitGutterTextObjectInnerPending)
omap ah <Plug>(GitGutterTextObjectOuterPending)
xmap ih <Plug>(GitGutterTextObjectInnerVisual)
xmap ah <Plug>(GitGutterTextObjectOuterVisual)

" Floaterm 
nnoremap   <silent>   <leader>tc        :FloatermNew<CR>
tnoremap   <silent>   <leader>tc        <C-\><C-n>:FloatermNew<CR>
tnoremap   <silent>   <leader>q         <C-\><C-n>:FloatermKill<CR>
 noremap   <silent>   <leader>tp        :FloatermPrev<CR>
tnoremap   <silent>   <leader>tp        <C-\><C-n>:FloatermPrev<CR>
nnoremap   <silent>   <leader>tn        :FloatermNext<CR>
tnoremap   <silent>   <leader>tn        <C-\><C-n>:FloatermNext<CR>
nnoremap   <silent>   <leader><leader>  :FloatermToggle<CR>
tnoremap   <silent>   <leader><leader>  <C-\><C-n>:FloatermToggle<CR>

" Session
nmap <leader>sl :SLoad<cr>
nmap <leader>ss :SSave!<cr>

" AsyncTask 
nnoremap <silent><leader>mk :AsyncTask build<cr>
nnoremap <silent><leader>mK :AsyncTask debug<cr>
nnoremap <silent><leader>mc :AsyncTask clean<cr>
nnoremap <silent><leader>mr :AsyncTask run<cr>
nnoremap <silent><leader>mR :AsyncTask run-debug<cr>
nnoremap <silent><leader>mt :AsyncTask test<cr>
nnoremap <silent><leader>ml :AsyncTask lint<cr>
nnoremap <silent><leader>me :AsyncTask -e<cr><cr>
nnoremap <silent><leader>mE :AsyncTask -E<cr><cr>

nnoremap <silent><leader>/n :cn<CR>
nnoremap <silent><leader>/p :cp<CR>
nnoremap <silent><leader>/<leader> :cw<CR>
nnoremap <silent><leader>// :ccl<CR>

" Comment
nnoremap <Leader>cm <Esc>:set opfunc=DoCommentOp<CR>g@
nnoremap <Leader>C <Esc>:set opfunc=UnCommentOp<CR>g@
vnoremap <Leader>cm <Esc>:call CommentMark(1,'<','>')<CR>
vnoremap <Leader>C <Esc>:call CommentMark(0,'<','>')<CR>

" CHADtree
nnoremap _ :CHADopen<cr>

"Dashboard mappings
nmap <Leader>ss :<C-u>SessionSave<CR>
nmap <Leader>sl :<C-u>SessionLoad<CR>

nnoremap <silent> <Leader>fh        :DashboardFindHistory<CR>
nnoremap <silent> <Leader>f<leader> :DashboardFindFile<CR>
nnoremap <silent> <Leader>fc        :DashboardChangeColorscheme<CR>
nnoremap <silent> <Leader>fw        :DashboardFindWord<CR>
nnoremap <silent> <Leader>fb        :DashboardJumpMark<CR>
nnoremap <silent> <Leader>e.        :DashboardNewFile<CR>

" Telescope
nnoremap <Leader>f<leader> <cmd>Telescope find_files find_command=rg,-i,--hidden,--files,-g,!.git<CR>
nnoremap <Leader>o<leader> <cmd>Telescope oldfiles<CR>
nnoremap <Leader>. <cmd>Telescope find_files find_command=rg,-i,--hidden,--files,-g,!.git cwd=~/.dotfiles<CR>
nnoremap <Leader>/ <cmd>Telescope live_grep<CR>
nnoremap <Leader>? <cmd>Telescope help_tags<CR>
nnoremap <leader>b<leader> <cmd>Telescope buffers<cr>
nnoremap <leader>g<leader> <cmd>Telescope git_status<CR>
nnoremap <leader>G<leader> <cmd>FloatermNew --disposable git status<cr>
nnoremap <leader>B<leader> <cmd>Telescope git_branches<CR>
nnoremap <leader>c<leader> <cmd>Telescope git_commits<CR>
nnoremap <leader>v<leader> <cmd>Telescope git_bcommits<CR>
nnoremap <leader>e<leader> <cmd>Telescope lsp_document_diagnostics<CR>
nnoremap <leader>E<leader> <cmd>Telescope lsp_workspace_diagnostics<CR>
nnoremap <leader>m<leader> <cmd>Telescope keymaps<CR>
nnoremap <leader>r<leader> <cmd>Telescope registers<CR>
