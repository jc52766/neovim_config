" Options
set background=dark
set clipboard=unnamedplus
set completeopt=noinsert,menuone,noselect
set cursorline
set hidden
set inccommand=split
set mouse=a
set number
set relativenumber
set splitbelow splitright
set title
set ttimeoutlen=0
set wildmenu

" Tabs size
set expandtab
set shiftwidth=2
set tabstop=2

" syntax
filetype plugin indent on
syntax on

" color support
set t_Co=256

" True color if available
let term_program=$TERM_PROGRAM
if $TERM !=? 'xterm-256color'
  set termguicolors
endif

" italics
let &t_ZH="\e[3m"
let &t_ZR="\e[23m"

call plug#begin('~/.config/nvim/plugged')
    " Appearance
    Plug 'vim-airline/vim-airline'
    Plug 'ryanoasis/vim-devicons'

    " Utilities
    Plug 'sheerun/vim-polyglot'
    Plug 'jiangmiao/auto-pairs'
    Plug 'ap/vim-css-color'
    Plug 'preservim/nerdtree'

    " Completion / linters / formatters
    Plug 'neoclide/coc.nvim',  {'branch': 'release'}
    Plug 'plasticboy/vim-markdown'

    " Git
    Plug 'airblade/vim-gitgutter'

    " color schemes
    Plug 'morhetz/gruvbox'
    
    " send to window
    Plug 'karoliskoncevicius/vim-sendtowindow'
    
call plug#end()

" colorscheme
colorscheme gruvbox

" Airline setup
let g:airline_theme='gruvbox'
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1

" File browser
let NERDTreeShowHidden=1

" Start NERDTree and put the cursor back in the other window.
autocmd VimEnter * NERDTree | wincmd p

" Auto Commands
" Auto format py files on save
augroup auto_commands
    autocmd BufWrite *.py call CocAction('format')
augroup END
