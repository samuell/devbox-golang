" --------------------------------------------
" Various settings
" --------------------------------------------
syntax on
colorscheme cyanic
set showmatch
set ignorecase
set showmode
set nowrap
set hlsearch
set shell=/bin/sh " Needed to get at least Go autocompletion to work
set nu

" Settings for using only tabs, not spaces, for indent
set tabstop=4
set shiftwidth=4
set noexpandtab

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

" --------------------------------------------
" Pathogen setup
" --------------------------------------------
execute pathogen#infect()
filetype plugin indent on
