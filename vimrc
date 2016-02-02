"First install:
" git clone http://github.com/gmarik/vundle.git vim/bundle/Vundle.vim

set nocompatible
filetype off

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'
Plugin 'vim-scripts/LustyExplorer'
Plugin 'scrooloose/nerdtree'
Plugin 'ervandew/supertab'
Plugin 'scrooloose/syntastic'
Plugin 'bling/vim-airline'
Plugin 'ap/vim-css-color'
Plugin 'tpope/vim-fugitive'
Plugin 'pangloss/vim-javascript'
Plugin 'mustache/vim-mustache-handlebars'
Plugin 'stephpy/vim-yaml'
Plugin 'jnurmine/Zenburn'
Plugin 'mileszs/ack.vim'
Plugin 'beyondwords/vim-twig'
Plugin 'DataWraith/auto_mkdir'
Plugin 'veloce/behat'
Plugin 'kchmck/vim-coffee-script'
Plugin 'airblade/vim-gitgutter'
Plugin 'mtth/scratch.vim'
Plugin 'mattn/gist-vim'
Plugin 'Valloric/YouCompleteMe'
Plugin 'xsbeats/vim-blade'
Plugin 'tpope/vim-vinegar'
Plugin 'majutsushi/tagbar'
Plugin 'vim-php/tagbar-phpctags.vim'
Plugin 'genoma/vim-less'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'arnaud-lb/vim-php-namespace'
Plugin 'vim-scripts/AutoTag'
Plugin '2072/PHP-Indenting-for-VIm'
Plugin 'Rican7/php-doc-modded'
Plugin 'shawncplus/phpcomplete.vim'
Plugin 'stephpy/vim-php-cs-fixer'

call vundle#end()            " required
filetype plugin indent on    " required

set tabstop=4
set shiftwidth=4
"fix bg color erase (tmux)
set t_ut=

silent !rm -rf ~/.vim/backup
silent !rm -rf ~/.vim/swap
silent !rm -rf ~/.vim/undo
silent !mkdir ~/.vim/backup
silent !mkdir ~/.vim/swap
silent !mkdir ~/.vim/undo
set backupdir=~/.vim/backup//
set directory=~/.vim/swap//
set undodir=~/.vim/undo//

set title
set number
set ruler
set wrap
set mouse=a
set scrolloff=3
set expandtab

set ignorecase
set smartcase

set incsearch
set hlsearch

set visualbell
set noerrorbells

set backspace=indent,eol,start

set hidden

syntax enable

filetype on
filetype plugin on
filetype indent on

set t_Co=256
colorscheme zenburn

let mapleader = ","
let g:ctrlp_map = '<leader>c'

" Paramètres par défaut pour ack
let g:ackprg="ack -H --nocolor --nogroup --column"
" Place un marqueur et cherche
nmap <leader>j mA:Ack<space>
" Place un marqueur et cherche le mot sous le curseur
nmap <leader>ja mA:Ack "<C-r>=expand("<cword>")<cr>"
nmap <leader>jA mA:Ack "<C-r>=expand("<cWORD>")<cr>"

set tags=tags,./tags

"airline
let g:airline#extensions#branch#enabled = 1

"syntastic
let g:syntastic_php_checkers = ['php']

nmap <silent> <leader>se :set spelllang=en spell!<CR>
nmap <silent> <leader>sf :set spelllang=fr spell!<CR>

autocmd! BufWritePost $MYVIMRC so $MYVIMRC

"vim-behat
let g:feature_filetype='behat'

"auto set paste
let &t_SI .= "\<Esc>[?2004h"
let &t_EI .= "\<Esc>[?2004l"
inoremap <special> <expr> <Esc>[200~ XTermPasteBegin()

function! XTermPasteBegin()
  set pastetoggle=<Esc>[201~
  set paste
  return ""
endfunction

fun! <SID>StripTrailingWhitespaces()
    let l = line(".")
    let c = col(".")
    %s/\s\+$//e
    call cursor(l, c)
endfun

autocmd BufWritePre * :call <SID>StripTrailingWhitespaces()

nmap <F7> :NERDTreeToggle<CR>
nmap <F8> :TagbarToggle<CR>

"vim-namespace
function! IPhpInsertUse()
    call PhpInsertUse()
    call feedkeys('a',  'n')
endfunction
autocmd FileType php inoremap <Leader>u <Esc>:call IPhpInsertUse()<CR>
autocmd FileType php noremap <Leader>u :call PhpInsertUse()<CR>

function! IPhpExpandClass()
    call PhpExpandClass()
    call feedkeys('a', 'n')
endfunction
autocmd FileType php inoremap <Leader>e <Esc>:call IPhpExpandClass()<CR>
autocmd FileType php noremap <Leader>e :call PhpExpandClass()<CR>

"phpdoc
inoremap <C-P> <ESC>:call PhpDocSingle()<CR>i
nnoremap <C-P> :call PhpDocSingle()<CR>
vnoremap <C-P> :call PhpDocRange()<CR>
