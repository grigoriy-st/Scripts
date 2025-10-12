let skip_defaults_vim = 1

"-- Font
set guifont=FiraCode:h8

" Other settings
" set cursorline
set nocompatible
set noerrorbells
set novisualbell
set mouse=
set ttymouse=
set showtabline=2
set nofoldenable
set colorcolumn=80
highlight ColorColumn guifg=NONE guibg=#121212 ctermbg=233

"-- Line warpping START
set wrap
set linebreak
set showbreak=↪\ \ 
"-- Line warpping END

"-- Folding START
set foldmethod=manual
set foldcolumn=2
set foldmethod=syntax
"-- Folding END

"-- Numeration START
set nu rnu
function! ToggleNumbering()
  if &number
    " Выключаем всё
    set nonumber norelativenumber foldcolumn=0
  else
    " Включаем всё
    set number relativenumber foldcolumn=2
  endif
endfunction

nnoremap <F2> :call ToggleNumbering()<CR>
inoremap <F2> <C-o>:call ToggleNumbering()<CR>
"-- Numeration END

"-- Netrw START
let g:netrw_liststyle = 3
let g:netrw_banner = 0
let g:netrw_winsize = 30 
nnoremap <silent> <C-n> :call ToggleNetrw()<CR>
autocmd FileType netrw setlocal number relativenumber

function! ToggleNetrw()
  let l:netrw_win = -1
  for l:win in range(1, winnr('$'))
    if getwinvar(l:win, '&filetype') == 'netrw'
      let l:netrw_win = l:win
      break
    endif
  endfor

  if l:netrw_win != -1

    execute l:netrw_win . 'wincmd w'
    quit
  else

    let l:current_win = winnr()
    silent! Lexplore

    execute l:current_win . 'wincmd w'
  endif
endfunction

"-- Netrw END

"-- Bracket and Quatetion marks Autocompletion

inoremap ( ()<Left>
inoremap [ []<Left>
inoremap { {}<Left>
inoremap " ""<Left>
inoremap ' ''<Left>
inoremap < <><Left>
inoremap <expr> " strpart(getline('.'), col('.')-1, 1) == '"' ? '"' : '""<Left>'
"inoremap <expr> ' strpart(getline('.'), col('.')-1, 1) == "'" ? "'" : "''<Left>'

"-- Syntax highlihting START
colorscheme quiet
set bg=dark
filetype plugin indent on
nnoremap <F4> :if exists("g:syntax_on") <Bar> syntax off <Bar> else <Bar> syntax on <Bar> endif <CR>
"-- Syntax highlihting END

"-- Spaces START
set tabstop=4
set softtabstop=4
set shiftwidth=4
set smarttab
set expandtab
set smartindent
"-- Spaces END

"-- Search START
set incsearch 
set hlsearch  
set ignorecase
set smartcase 
"-- Search END

""-- VUNDLE
set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()
Plugin 'VundleVim/Vundle.vim'

""--default--"
"Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}

""--custom--"
" Plugin 'preservim/nerdtree'
" Plugin 'fatih/vim-go'
" Plugin 'morhetz/gruvbox'
" Plugin 'tiagofumo/vim-nerdtree-syntax-highlight'

""---autocomplite---"
"Plugin 'Shougo/neocomplete.vim'
"Plugin 'davidhalter/jedi-vim'
"Plugin 'jnwhiteh/vim-golang'
" Plugin 'jiangmiao/auto-pairs'
" Plugin 'w0rp/ale'
"Plugin 'valloric/youcompleteme'

"Plugin 'tpope/vim-sensible'
"Plugin 'nsf/gocode'
"Plugin 'townk/vim-qt'
"Plugin 'mattn/emmet-vim'

""--gui--"
"" Bar
"Plugin 'vim-airline/vim-airline'
"Plugin 'vim-airline/vim-airline-themes'

"Plugin 'preservim/nerdcommenter'
"Plugin 'mileszs/ack.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'majutsushi/tagbar'
Plugin 'tpope/vim-commentary'

Plugin 'c.vim'
"Plugin 'rip-rip/clang_complete'
"Plugin 'ap/vim-css-color'

call vundle#end()

"-- C Plugin
let g:C_SourceCodeExtensions = []
let g:C_NoInsertHeader = 1


""-- ____VIM-PLUG____
call plug#begin('~/.vim/plugged')

""Plug 'junegunn/fzf.vim'
""Plug 'fisadev/FixedTaskList.vim'
Plug 'lambdalisue/suda.vim'
""Plug 'python-mode/python-mode', { 'for': 'python', 'branch': 'develop' }

" Plug 'ryanoasis/vim-devicons'
"" Plug 'airblade/vim-gitgutter'
"" Plug 'psliwka/vim-smoothie'

call plug#end()

