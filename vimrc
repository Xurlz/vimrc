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

set ignorecase
set smartcase
set nu
set tabstop=2
set expandtab
set shiftwidth=2
set ruler
set wrapscan
set scrolloff=1
set mouse=a
set encoding=utf-8

function ReadDate()
  execute 'normal :read !date +\%Y-\%m-\%d\ \%H:\%M' . "\r" | execute 'normal kJ' | execute 'normal 8e'
endfunction

call plug#begin()
Plug 'AndrewRadev/undoquit.vim', {'tag': 'v0.1.0'}
Plug 'NLKNguyen/pipe.vim'
Plug 'TysonAndre/php-vim-syntax'
Plug 'altercation/vim-colors-solarized'
Plug 'chrisbra/vim-xml-runtime'
Plug 'easymotion/vim-easymotion'
Plug 'michaeljsmith/vim-indent-object'
Plug 'nicwest/vim-http',
Plug 'preservim/nerdtree'
Plug 'skywind3000/asyncrun.vim'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-obsession'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'vim-airline/vim-airline'
Plug 'vim-scripts/ReplaceWithRegister'
call plug#end()

let g:vim_http_tempbuffer=1
let g:vim_http_split_vertically=1
let g:netrw_liststyle=3

call togglebg#map("<F5>")
colorscheme solarized
set background=dark

command ReadDate :call ReadDate
command -nargs=* Tests :Pipe ./vendor/bin/phpunit <args>
command Scratch set buftype=nofile
command Errors normal oini_set('display_errors','1');<Esc>
command PhpUnit normal iuse PHPUnit\Framework\TestCase;class FooTest extends TestCase{function test(){}}<Esc>
command Json .!python3 -m json.tool

nnoremap <C-n> :NERDTreeToggle<cr>
map <Leader> <Plug>(easymotion-prefix)
nnoremap \\\fun ifunction foo(){return;}<Esc>kke
nnoremap \\\class iclass Foo{}<Esc>h

