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
" set term=screen-256color


noremap <C-n> :NERDTreeToggle<CR>
filetype off
filetype plugin on
set omnifunc=syntaxcomplete#Complete
let g:gruvbox_contrast_dark = 'hard'
" let g:desable_theme_loading=1

set rtp+=~/.vim/bundle/Vundle.vim
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
" Bar
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

Plugin 'preservim/nerdcommenter'
Plugin 'mileszs/ack.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'majutsushi/tagbar'
Plugin 'tpope/vim-commentary'
" Plugin 'ryanoasis/nerd-fonts' " Nerd Fonts

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
" Plug 'itchyny/lightline.vim'    " Status bar
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
"----------
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

if exists('+termguicolors')
    let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
    let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
    set termguicolors
endif

let g:airline_theme='dark'
let g:airline#extensions#tabline#enabled = 1
let g:airline_base16_improved_contrast = 1


" unicode symbols
let g:airline_left_sep = '»'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '«'
let g:airline_right_sep = '◀'
let g:airline_symbols.linenr = '␊'
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.whitespace = 'Ξ'
" airline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''

let g:WebDevIconsUnicodeDecorateFolderNodes = 1
let g:WebDevIconsUnicodeDecorateFolderNodeDefaultSymbol = ''
let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols = {}
let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['nerdtree'] = ''
set guifont=Hack\ Nerd\ Font

"Fonts for the Status Line
let g:airline_powerline_fonts = 1

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

"Unicode symbols for the Status Line
let g:airline_left_alt_sep = '»'
let g:airline_right_alt_sep = '«'
let g:airline_symbols.linenr = '␊'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.readonly = '∥'

let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail'
