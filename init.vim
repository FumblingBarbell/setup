" ^B       - file explorer
" ^N       - new integrated terminal
" jk       - ESC shortcut
" ALT-hjkl - move between split panes
call plug#begin("~/.vim/plugged")
  " Plugin section
  Plug 'dracula/vim'
  Plug 'scrooloose/nerdtree'
  Plug 'ryanoasis/vim-devicons'
call plug#end()



" Map jk to ESC
:imap jk <Esc>



" Set colorscheme
if (has("termguicolors"))
  set termguicolors
endif
syntax enable
colorscheme dracula



" Configure file explorer
let g:NERDTreeShowHidden = 1
let g:NERDTreeMinimalUI = 1
let g:NERDTreeIgnore = []
let g:NERDTreeStatusline = ''
" Automaticaly close nvim if NERDTree is only thing left open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
" Toggle
nnoremap <silent> <C-b> :NERDTreeToggle<CR>



" Set up integrated terminal
" open new split panes to right and below
set splitright
set splitbelow
" turn terminal to normal mode with escape
tnoremap <Esc> <C-\><C-n>
" start terminal in insert mode
au BufEnter * if &buftype == 'terminal' | :startinsert | endif
" open terminal on ctrl+n
function! OpenTerminal()
  split term://zsh
  resize 10
endfunction
nnoremap <c-n> :call OpenTerminal()<CR>



" use alt+hjkl to move between split/vsplit panels
nnoremap <A-h> <C-w>h
nnoremap <A-j> <C-w>j
nnoremap <A-k> <C-w>k
nnoremap <A-l> <C-w>l



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
