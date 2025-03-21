set expandtab 
set smarttab
set tabstop=4
set softtabstop=4
set shiftwidth=4
set number
set foldcolumn=2
set bg=dark

syntax on
set noerrorbells
set novisualbell
set mouse=a

noremap <C-n> :NERDTreeToggle<CR>
filetype off
filetype plugin on
set omnifunc=syntaxcomplete#Complete
let g:gruvbox_contrast_dark = 'hard'

set rtp+=~/.vim/bundle/Vundle.vim

" ____VUNDLE____
call vundle#begin()

"--default--"
Plugin 'VundleVim/Vundle.vim'
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}

"--custom--"
Plugin 'preservim/nerdtree'
Plugin 'fatih/vim-go'
Plugin 'morhetz/gruvbox'
Plugin 'tiagofumo/vim-nerdtree-syntax-highlight'
Plugin 'lambdalisue/suda.vim'

"---autocomplite---"
Plugin 'Shougo/neocomplete.vim'
Plugin 'davidhalter/jedi-vim'
Plugin 'jnwhiteh/vim-golang'
Plugin 'jiangmiao/auto-pairs'
Plugin 'w0rp/ale'
Plugin 'valloric/youcompleteme'

Plugin 'tpope/vim-sensible'
Plugin 'nsf/gocode'
Plugin 'townk/vim-qt'
Plugin 'mattn/emmet-vim'

"--gui--"
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'preservim/nerdcommenter'
Plugin 'mileszs/ack.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'majutsushi/tagbar'
Plugin 'tpope/vim-commentary'

Plugin 'c.vim'
Plugin 'rip-rip/clang_complete'
Plugin 'ap/vim-css-color'

call vundle#end() 

" ____PLUG____
call plug#begin('~/.vim/plugged')

Plug 'junegunn/fzf.vim'
Plug 'fisadev/FixedTaskList.vim'
Plug 'lambdalisue/suda.vim'
Plug 'python-mode/python-mode', { 'for': 'python', 'branch': 'develop' }

Plug 'ryanoasis/vim-devicons'   " Иконки файлов
Plug 'vim-syntastic/syntastic' " Проверка синтаксиса
Plug 'airblade/vim-gitgutter' " Индикация изменений в git
Plug 'vim-python/python-syntax' " Подсветка синтаксиса для Python
"below function is needed for ycm:
function! BuildYCM(info)
    if a:info.status == 'installed' || a:info.force
        !./install.py
    endif
endfunction


call plug#end()


"-- START for_colorscheme
let g:gruvbox_italic=1

"Use 24-bit (true-color) mode in Vim/Neovim when outside tmux.
"If you're using tmux version 2.2 or later, you can remove the outermost $TMUX check and use tmux's 24-bit color support
"(see < http://sunaku.github.io/tmux-24bit-color.html#usage > for more information.)
if (empty($TMUX) && getenv('TERM_PROGRAM') != 'Apple_Terminal')
  if (has("nvim"))
    "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif
  "For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
  "Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
  " < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
  if (has("termguicolors"))
    set termguicolors
  endif
endif

source "$HOME/.vim/bundle/gruvbox/gruvbox_256palette.sh"

" Enable packloadall for pack plugins.
packloadall

"-- EMMET CONFIG --
" redefine trigger key
let g:user_emmet_leader_key=','

let g:gruvbox_termcolors=16
"-- END for_colorscheme

let g:suda#prompt = 'Mot de passe: '

"-- START Fonts
set guifont=Fira\ Code:h20
"-- END Fonts 

"-- START Spaces
set tabstop=4
set shiftwidth=4
set smarttab
set expandtab
set smartindent
"-- END Spaces

"-- Shortcuts
vnoremap <C-a> :<C-u>normal! ggVG<CR>
filetype plugin indent on

" Настройка Alt+Backspace для удаления слова в режиме вставки
inoremap <M-BS> <C-o>daw

" Настройка Ctrl+Delete для удаления слова вперед в режиме вставки
inoremap <C-Delete> <C-o>dw
colorscheme gruvbox
highlight Normal guibg=#000000
