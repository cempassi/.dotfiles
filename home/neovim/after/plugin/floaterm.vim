" Floaterm config

let g:floaterm_rootmarkers = ['.project', '.git', '.hg', '.svn', '.root', '.gitignore'] 

let g:floaterm_autoclose = 0

let g:floaterm_gitcommit = 'vsplit'

let g:floaterm_opener = 'split'

let g:floaterm_width = 0.8
let g:floaterm_height = 0.8

function s:open_in_normal_window() abort
  let f = findfile(expand('<cfile>'))
  if !empty(f) && has_key(nvim_win_get_config(win_getid()), 'anchor')
    FloatermHide
    execute 'e ' . f
  endif
endfunction
