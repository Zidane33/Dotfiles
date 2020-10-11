syntax on
"Settings from 90% of plugins talk on youtube
filetype plugin on
filetype plugin indent on
set noswapfile
set tabstop=4
set shiftwidth=2
set expandtab
set nocompatible
set path+=**
set timeoutlen=200
highlight SpellBad ctermbg=238
highlight MatchParen ctermbg=238
highlight Pmenu ctermbg=238 ctermfg=15
"End 
let mapleader = ','
set number
set showcmd
set relativenumber
filetype indent on
set wildmenu
set showmatch
set incsearch
set hlsearch
imap ,, <right>
nnoremap B ^
nnoremap E $
inoremap jk <Esc>
nnoremap <leader>v :sp ~/.vimrc<CR>
nnoremap <leader>s :w<CR>
nnoremap <leader>q :q<CR>
nnoremap <leader>Q :q!<CR>
nnoremap <leader>f :FZF <CR>
nnoremap <leader>b :Buffers <CR>
nnoremap oo o<Esc>k
nnoremap  <S-o><S-o> <S-o><Esc>j
nnoremap <leader>r :%s///g<Left><Left>
nmap <C-n> :NERDTreeToggle<CR>
set signcolumn=no

"delimters auto-completion
inoremap " ""<left>
inoremap ' ''<left>
inoremap ( ()<left>
inoremap [ []<left>
inoremap { {}<left>
inoremap {<CR> {<CR>}<ESC>O
inoremap {;<CR> {<CR>};<ESC>O

"tab auto-completion
inoremap <silent><expr> <c-space> coc#refresh()
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<CR>"
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

autocmd! CompleteDone * if pumvisible() == 0 | pclose | endif
"end tab completion
"
"statusline config
function! StatusLine(...)
  return crystalline#mode() . ' %f%h%w%m%r '
endfunction
let g:crystalline_statusline_fn = 'StatusLine'
let g:crystalline_theme = 'molokai'
set laststatus=2
"end statusline config

"fzf 
set rtp+=/usr/local/opt/fzf

"vim plugins
call plug#begin()

Plug 'christoomey/vim-tmux-navigator'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'sheerun/vim-polyglot'
Plug 'rbong/vim-crystalline'
Plug 'jaredgorski/spacecamp'
Plug 'romainl/vim-cool'
Plug 'rakr/vim-two-firewatch'
Plug 'OmniSharp/omnisharp-vim'
Plug 'dense-analysis/ale'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

call plug#end()

filetype plugin indent on

"C# ale linter config"
let g:ale_linters = {'cs': ['OmniSharp']}
let g:ale_fixers = {'*': ['remove_trailing_lines', 'trim_whitespace'],'javascript': ['prettier'],}
let g:ale_fix_on_save = 1
