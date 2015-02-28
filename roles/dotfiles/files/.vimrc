" --------------------------------------------
" Various settings
" --------------------------------------------
syntax on
colorscheme samllight
set showmatch
set ignorecase
set showmode
set nowrap
set hlsearch
set shell=/bin/sh " Needed to get at least Go autocompletion to work

" --------------------------------------------
" Convenience mappings
" --------------------------------------------
nmap <C-N> :noh <CR>
" Use jj to get out of insert mode
imap jj <Esc>
" Remap Ctrl + Z to save, in all modes
noremap <silent> <C-Z>      :update<CR>
vnoremap <silent> <C-Z>     :<C-C>:update<CR>
inoremap <silent> <C-Z>     <C-[>:update<CR>
" --------------------------------------------

" --------------------------------------------
" Speed up navigation 4x by holding Ctrl key
" --------------------------------------------
nmap <c-j> 4j
nmap <c-k> 4k
nmap <c-h> 4h
nmap <c-l> 4l
" --------------------------------------------
