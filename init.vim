:imap jk <Esc>

let g:ale_fixers = {
	\	'rust': ['rustfmt'],
	\}

let g:ale_linters = {
	\'rust': ['rls'],
	\}

let g:ale_rust_tls_toolchain = 'nightly'

let g:ale_fix_on_save = 1
let g:airline#extensions#ale#enabled = 1
nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)

packloadall
silent! helptags ALL
