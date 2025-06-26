-- Base settings
vim.opt.expandtab = true
vim.opt.smarttab = true
.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.number = true
vim.opt.background = 'dark'
vim.opt.foldcolumn = '2'
vim.opt.syntax = 'on'
vim.opt.compatible = false
vim.opt.errorbells = false
vim.opt.visualbell = false
vim.opt.clipboard = 'unnamedplus'
vim.opt.mouse = 'a'

-- Setting up buffers
vim.keymap.set('v', '<Leader>y', ':\'<,\'>w !wl-copy<CR>')
vim.keymap.set('n', '<Leader>p', ':r !wl-paste<CR>')
vim.keymap.set('v', '<Leader>y', ':\'<,\'>w !xclip -sel clip<CR>')
vim.keymap.set('n', '<Leader>p', ':r !xclip -o -sel clip<CR>')

-- Deleting words under the cursor
vim.keymap.set('i', '<C-Del>', '<Esc>dwi', { noremap = true, silent = true })
vim.keymap.set('n', '<C-Del>', 'dw', { noremap = true, silent = true })
--Plugins packer.nvim
require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'
  
  use 'preservim/nerdtree'
  use 'fatih/vim-go'
  use 'morhetz/gruvbox'
  use 'tiagofumo/vim-nerdtree-syntax-highlight'
  use 'lambdalisue/suda.vim'
  use 'jiangmiao/auto-pairs'
  use 'w0rp/ale'
  use 'valloric/youcompleteme'
  use 'tpope/vim-sensible'
  use 'mattn/emmet-vim'
  use 'vim-airline/vim-airline'
  use 'vim-airline/vim-airline-themes'
  use 'preservim/nerdcommenter'
  use 'mileszs/ack.vim'
  use 'tpope/vim-fugitive'
  use 'majutsushi/tagbar'
  use 'tpope/vim-commentary'
  use 'ap/vim-css-color'
  use 'junegunn/fzf.vim'
  use 'ryanoasis/vim-devicons'
  use 'vim-syntastic/syntastic'
  use 'airblade/vim-gitgutter'
  use 'vim-python/python-syntax'
  use 'sphamba/smear-cursor.nvim'
  use 'psliwka/vim-smoothie'
end)

-- LSP Server
-- require'lspconfig'.pylsp.setup{}

-- Smear Cursor
require('smear_cursor').enabled = true

-- NERDTree
vim.keymap.set('n', '<C-n>', ':NERDTreeToggle<CR>')

-- Gruvbox
vim.g.gruvbox_italic = 1
vim.g.gruvbox_contrast_dark = 'hard'
vim.o.background = "dark"

vim.cmd([[colorscheme gruvbox]])

-- Term colors
if vim.fn.empty('$TMUX') == 1 and vim.fn.getenv('TERM_PROGRAM') ~= 'Apple_Terminal' then
  if vim.fn.has('nvim') == 1 then
    vim.env.NVIM_TUI_ENABLE_TRUE_COLOR = 1
  end
  if vim.fn.has('termguicolors') == 1 then
    vim.opt.termguicolors = true
  end
end

-- Emmet
vim.g.user_emmet_leader_key = ','

-- Fonts
vim.opt.guifont = 'Fira Code:h20'

-- Airline
vim.g.airline_theme = 'dark'
vim.g.airline_powerline_fonts = 1
vim.g.airline_extensions_tabline_enabled = 1
vim.g.airline_base16_improved_contrast = 1

-- Airline Symbols
vim.g.airline_symbols = {
  linenr = '␊',
  branch = '⎇',
  paste = '∥',
  readonly = '∥',
  whitespace = 'Ξ'
}

-- vim.g.airline_left_sep = ''
-- vim.g.airline_left_alt_sep = ''
-- vim.g.airline_right_sep = ''
-- vim.g.airline_right_alt_sep = ''

-- DevIcons
-- vim.g.WebDevIconsUnicodeDecorateFolderNodes = 1
-- vim.g.WebDevIconsUnicodeDecorateFolderNodeDefaultSymbol = ''
-- vim.g.WebDevIconsUnicodeDecorateFileNodesExtensionSymbols = {nerdtree = ''}

-- Additional settings
vim.opt.smartindent = true
vim.keymap.set('v', '<C-a>', ':<C-u>normal! ggVG<CR>')
vim.cmd('filetype plugin indent on')

-- Custom shortcuts
vim.keymap.set('i', '<M-BS>', '<C-o>daw', {noremap = true})
vim.keymap.set('i', '<C-Delete>', '<C-o>dw', {noremap = true})

vim.cmd([[
  highlight Normal guibg=#000000 ctermbg=16
  highlight NonText guibg=#000000 ctermbg=16
  highlight LineNr guibg=#000000 ctermbg=16
  highlight SignColumn guibg=#000000 ctermbg=16
  highlight EndOfBuffer guibg=#000000 ctermbg=16
]])
