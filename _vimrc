
let mapleader = "\<Space>"
let s:is_windows = has('win32') || has('win64')

if !filereadable(expand("~/.vim/autoload/plug.vim"))
    echo "Installing vim-plug and plugins. Restart vim after finishing the process."
    silent call mkdir(expand("~/.vim/autoload", 1), 'p')
    execute "!curl -fLo ".expand("~/.vim/autoload/plug.vim", 1)." https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"
    autocmd VimEnter * PlugInstall
endif

if s:is_windows
  set rtp+=~/.vim
endif

call plug#begin('~/.vim/plugged')
let g:plug_url_format = 'https://github.com/%s.git'

Plug 'ajh17/VimCompletesMe'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'flazz/vim-colorschemes'
Plug 'Raimondi/delimitMate'
Plug 'elzr/vim-json'
Plug 'marijnh/tern_for_vim'
Plug 'walm/jshint.vim'
Plug 'vim-scripts/SyntaxComplete'
Plug 'othree/yajs.vim'
Plug 'bling/vim-airline'

Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' } "{{{
  nnoremap <silent> <F4> :NERDTreeToggle<CR>
  nnoremap <silent> <F5> :NERDTreeFind<CR>
  let NERDTreeShowHidden=1


 call plug#end()

"Sensible Settings..."
set nocompatible
set encoding=utf-8
set listchars=trail:.,tab:>\ ,eol:$
set lazyredraw
set laststatus=2
"set statusline=%-4m%f\ %y\ \ %=%{&ff}\ \|\ %{&fenc}\ \|\ %{virtualenv#statusline()}\ \ [%l:%c]
set incsearch hlsearch
set nonumber
set backspace=indent,eol,start
set nostartofline
set autoread
set scrolloff=3
set wildmenu wildignorecase wildmode=list:longest,full
set cursorline
set ignorecase smartcase
set showmode showcmd
set shortmess+=I
set hidden
set history=1000
set complete-=i completeopt=menu
set splitright splitbelow
set display+=lastline
set foldenable foldmethod=syntax foldlevelstart=99
set ttimeoutlen=50
set switchbuf=useopen
set mouse=a
set breakindent
set number

filetype plugin indent on
syntax on

augroup CustomColors
  autocmd!
  autocmd ColorScheme * highlight CursorLine cterm=bold ctermbg=NONE gui=bold guibg=NONE
augroup END
colorscheme candyman

" better backup, swap and undo storage
set noswapfile
set backup
set undofile

set backupdir=~/.vim/dirs/backup
set undodir=~/.vim/dirs/undo
if !isdirectory(&backupdir)
  call mkdir(&backupdir, "p")
endif
if !isdirectory(&undodir)
  call mkdir(&undodir, "p")
endif


" GUI & Terminal setttings
if has("gui_running")
  if has("gui_macvim")
    set guifont=Consolas:h15
  elseif has("gui_win32")
    autocmd GUIEnter * simalt ~x " open maximize in Windows
    set guifont=Consolas:h11
  endif
  set guioptions= " disable all UI options
  set guicursor+=a:blinkon0 " disable blinking cursor
  autocmd GUIEnter * set visualbell t_vb=
else
  set noerrorbells visualbell t_vb=
  set term=xterm
  set t_ut= " setting for looking properly in tmux
  set t_ti= t_te= " prevent vim from clobbering the scrollback buffer
  let &t_Co = 256
  if s:is_windows " trick to support 256 colors in conemu for Windows
    let &t_AF="\e[38;5;%dm"
    let &t_AB="\e[48;5;%dm"
  endif
endif



" easy window navigation
nnoremap <silent> <c-l> <c-w>l
nnoremap <silent> <c-j> <c-w>j
nnoremap <silent> <c-h> <c-w>h
nnoremap <silent> <c-k> <c-w>k
nnoremap <silent> <leader>\ <c-^>
nnoremap <silent> <leader>q :botright copen<cr>
