function! s:floaterm_run(opts)
	if exists(':FloatermNew') != 2
		return s:errmsg('require voldikss/vim-floaterm')
	endif
	if exists('*asyncrun#script_write') == 0
		return s:errmsg('require asyncrun 2.7.8 or above')
	endif
	let cmd = 'FloatermNew '
	if has_key(a:opts, 'wintype')
		let cmd .= ' --wintype=' . fnameescape(a:opts.wintype)
	endif
	if has_key(a:opts, 'position')
		let cmd .= ' --position=' . fnameescape(a:opts.position)
	endif
	if has_key(a:opts, 'width')
		let cmd .= ' --width=' . fnameescape(a:opts.width)
	endif
	if has_key(a:opts, 'height')
		let cmd .= ' --height=' . fnameescape(a:opts.height)
	endif
	if has_key(a:opts, 'title')
		let cmd .= ' --title=' . fnameescape(a:opts.title)
	endif
	let cmd .= ' --autoclose=0'
	let cmd .= ' --silent=' . get(a:opts, 'silent', 0)
	let cwd = (a:opts.cwd == '')? getcwd() : (a:opts.cwd)
	let cmd .= ' --cwd=' . fnameescape(cwd)
	" for precisely arguments passing and shell builtin commands
	" a temporary file is introduced
	let cmd .= ' ' . fnameescape(asyncrun#script_write(a:opts.cmd, 0))
	exec cmd
	if get(a:opts, 'focus', 1) == 0
		stopinsert | noa wincmd p
		augroup close-floaterm-runner
			autocmd!
			autocmd CursorMoved,InsertEnter * ++nested
						\ call timer_start(100, { -> s:floaterm_close() })
		augroup END
	endif
endfunction

function! s:floaterm_close() abort
	if &ft == 'floaterm' | return | endif
	for b in tabpagebuflist()
		if getbufvar(b, '&ft') == 'floaterm' &&
					\ getbufvar(b, 'floaterm_jobexists') == v:false
			execute b 'bwipeout!'
			break
		endif
	endfor
	autocmd! close-floaterm-runner
endfunction

let g:asyncrun_runner = get(g:, 'asyncrun_runner', {})
let g:asyncrun_runner.floaterm = function('s:floaterm_run')
let g:asynctasks_term_pos="floaterm"
