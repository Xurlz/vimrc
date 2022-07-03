" An example for a vimrc file.
"
" Maintainer:	Bram Moolenaar <Bram@vim.org>
" Last change:	2019 Dec 17
"
" To use it, copy it to
"	       for Unix:  ~/.vimrc
"	      for Amiga:  s:.vimrc
"	 for MS-Windows:  $VIM\_vimrc
"	      for Haiku:  ~/config/settings/vim/vimrc
"	    for OpenVMS:  sys$login:.vimrc

" When started as "evim", evim.vim will already have done these settings, bail
" out.
if v:progname =~? "evim"
  finish
endif

" Get the defaults that most users want.
source $VIMRUNTIME/defaults.vim

if &t_Co > 2 || has("gui_running")
  " Switch on highlighting the last used search pattern.
  set hlsearch
endif

" Put these in an autocmd group, so that we can delete them easily.
augroup vimrcEx
  au!

  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=78
augroup END

" Add optional packages.
"
" The matchit plugin makes the % command work better, but it is not backwards
" compatible.
" The ! means the package won't be loaded right away but when plugins are
" loaded during initializtion.
if has('syntax') && has('eval')
  packadd! matchit
endif

set nu
set tabstop=2
set expandtab
set shiftwidth=2
set autoread

call plug#begin()
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'justinmk/vim-sneak'
Plug 'erietz/vim-terminator', { 'branch': 'main' }
Plug 'preservim/nerdtree'
Plug 'tpope/vim-surround'
Plug 'michaeljsmith/vim-indent-object'
Plug 'tpope/vim-commentary'
" Plug 'universal-ctags/ctags'
" Plug 'voldikss/vim-floaterm'
call plug#end()

nnoremap <C-n> :NERDTreeToggle<cr>
nnoremap <C-p> :Commands<cr>
nnoremap <F1> :Commands<cr>
nnoremap <leader>o :Files<cr>
nnoremap <leader>e :Buffers<cr>

