call plug#begin('~/.local/share/nvim/plugged')
Plug 'ghifarit53/tokyonight-vim'
Plug 'vim-airline/vim-airline'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'prettier/vim-prettier', { 'do': 'npm install' }
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
call plug#end()
filetype plugin on

set termguicolors
let g:tokyonight_enable_italic=1
let g:airline_theme="tokyonight"
colorscheme tokyonight

let g:gitgutter_map_keys=0

filetype indent on
" autocommand to save on losing focus
:au FocusLost * !silent update
set autowriteall " It does as it says
set list " shows the invisible characters
set listchars=space:·,tab:>\ ,trail:-
set numberwidth=1 " spacing from the line number
set splitright " new windows appear to the right
set splitbelow " new windows apper at bottom
set showcmd " BEST!!! shows what you type for cmd
set scrolljump=-50 " jumps 50% of screen when hitting bottom
set scrolloff=3 " keeps some lines from top & bottom
set cursorline " puts a line under where you are
set wildmenu " :TAB to pull up wildmenu
set wildmode=list:longest,full " gives you what you want
set wildignore=**/node_modules/** " fuck you node modules
set lazyredraw " smoother faster macros
set number " yay for line numbers!
set ruler " gives you the bar at the bottom
set signcolumn=number " the signcolumn can also have line numbers!
set laststatus=0 " fugly status line neovim default off
set undofile " allows for undoing after saving and before session removed
set undodir=/tmp " without this undofile would not make a file
set updatetime=100 " makes the swap file update
" For programming
set showmatch " show matching bracket
set foldenable " allows folding of code blocks
set foldlevelstart=4 " folds heavily nested blocks
set foldmethod=indent " Python exclusive
set colorcolumn=80 " puts the border for how many characters allowed
" Tabs and spacing
set tabstop=2 " num spaces tab displays
set softtabstop=2 " actual num spaces of tab
set shiftwidth=2 " > and < spaces
set expandtab " convert tab to spaces
set smarttab " insert blanks when hitting tab in front of a line
set smartindent " it's not dumb
set autoindent " what's in a name?
set backspace=indent,eol,start " auto backspace depending on prev char
set nostartofline " an enigma, stops certain movements from being janky ???
" Searching
set incsearch " incomplete search shows
set smartcase " toggles ignorecase depending on your search
" File Explorer netrw
" By default netrw leaves unmoded buffs open. This deletes them.
let g:netrw_liststyle=3
autocmd FileType netrw setl bufhidden=delete " or use :qa!
set nocompatible " Limit search to the project
set path+=** " Search all subdirs and -r

lua require'nvim-treesitter.configs'.setup { highlight = { enable = true } }

source $XDG_CONFIG_HOME/nvim/coc.vim
source $XDG_CONFIG_HOME/nvim/remove_whitespaces.vim
source $XDG_CONFIG_HOME/nvim/key_bindings.vim

