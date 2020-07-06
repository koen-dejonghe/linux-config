set nocompatible              " required
filetype off                  " required
se ic

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
set rtp+=~/.fzf
call vundle#begin()
"
" " alternatively, pass a path where Vundle should install plugins
" "call vundle#begin('~/some/path/here')
"
" " let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

"
" " add all your plugins here (note older versions of Vundle
" " used Bundle instead of Plugin)
"
Plugin 'tmhedberg/SimpylFold'
Plugin 'Valloric/YouCompleteMe'
Plugin 'vim-syntastic/syntastic'
Plugin 'nvie/vim-flake8'
Plugin 'jnurmine/Zenburn'
Plugin 'altercation/vim-colors-solarized'
Plugin 'scrooloose/nerdtree'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'vim-scripts/indentpython.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'msrose/vim-perpetuloc'
Plugin 'junegunn/fzf.vim'

"
" " All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

let python_highlight_all=1
syntax on
if has('gui_running')
  set background=dark
  colorscheme solarized
else
  colorscheme zenburn
endif


au BufNewFile,BufRead *.py
    \ set tabstop=4 |
    \ set softtabstop=4 |
    \ set shiftwidth=4 |
    \ set textwidth=79 |
    \ set expandtab |
    \ set autoindent |
    \ set fileformat=unix

" au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/

set nu
set encoding=utf-8
set mouse=a

let g:airline_theme='zenburn'
let g:ycm_confirm_extra_conf=0
let g:ycm_autoclose_preview_window_after_completion=1
let g:ycm_always_populate_location_list = 1

" let g:syntastic_python_checkers = ['pycodestyle', 'bandit', 'flake8']
let g:syntastic_python_checkers = ['flake8', 'bandit']
let syntastic_python_flake8_args='--ignore=W291,W293'
let g:syntastic_always_populate_loc_list = 1
let g:airline#extensions#branch#enabled = 1

let NERDTreeIgnore=['\.pyc$', '\~$', '__pycache__'] "ignore files in NERDTree

set showcmd

let mapleader = " "
" toggle tree
nnoremap <leader>t :NERDTreeToggle<CR>
" go to def
nnoremap <leader>g :YcmCompleter GoToDefinitionElseDeclaration<CR>
" next error
nnoremap <leader>n :Lnext<CR> 
" previous error
nnoremap <leader>p :Lprevious<CR>
" open fold
nnoremap <leader>o zo
" close fold
nnoremap <leader>c zc
" open all folds
nnoremap <leader>O zR
" close all folds
nnoremap <leader>C zM
" zoom window
nnoremap <leader>Z <c-w>_
" unzoom window
nnoremap <leader>z <c-w>=
" grep in files
nnoremap <leader>/ :Ag<CR>
" toggle numbers
nnoremap <leader>9 :set invnumber<CR>


" jump to the last position when reopening a file
if has("autocmd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
    \| exe "normal! g`\"" | endif
endif

let &t_SI .= "\<Esc>[?2004h"
let &t_EI .= "\<Esc>[?2004l"
inoremap <special> <expr> <Esc>[200~ XTermPasteBegin()
function! XTermPasteBegin()
  set pastetoggle=<Esc>[201~
  set paste
  return ""
endfunction

