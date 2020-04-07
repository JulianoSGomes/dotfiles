"  _       _ _         _           
" (_)_ __ (_) |___   _(_)_ __ ___  
" | | '_ \| | __\ \ / / | '_ ` _ \ 
" | | | | | | |_ \ V /| | | | | | |
" |_|_| |_|_|\__(_)_/ |_|_| |_| |_|
"
"

call plug#begin('~/.config/nvim/plugged')
Plug 'souzaramon/dracula-vim', { 'as': 'dracula' }
Plug 'jiangmiao/auto-pairs'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'itchyny/lightline.vim'
Plug 'preservim/nerdtree'
Plug 'sheerun/vim-polyglot'
Plug 'styled-components/vim-styled-components', { 'branch': 'main' }
Plug 'mboughaba/i3config.vim'
Plug 'chemzqm/vim-jsx-improve'
Plug 'elixir-editors/vim-elixir'
Plug 'mhinz/vim-mix-format'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'chrisbra/Colorizer'
Plug 'ap/vim-css-color'
call plug#end()

syntax on
set nohlsearch
set ruler
set hidden
set number
set relativenumber
set inccommand=split
set tabstop=2
set shiftwidth=2
set softtabstop=2
set clipboard=unnamed
set clipboard=unnamedplus
set encoding=UTF-8
set nobackup
set nowritebackup
set cmdheight=1
set updatetime=300
set shortmess+=c
set signcolumn=yes
set splitbelow splitright
set termguicolors
set noshowmode
set lazyredraw
set showmatch
set guifont=Fira\ Code:h1

let mapleader=","

": Plugins

": -souzaramon/dracula-vim
let g:dracula_italic = 0
colorscheme dracula
hi Normal ctermbg=none

": -itchyny/lightline.vim
let g:lightline = {
  \ 'colorscheme': 'wombat'}

let s:palette = g:lightline#colorscheme#{g:lightline.colorscheme}#palette
let s:palette.normal.middle = [ [ 'NONE', 'NONE', 'NONE', 'NONE' ] ]
let s:palette.inactive.middle = s:palette.normal.middle
let s:palette.tabline.middle = s:palette.normal.middle

": -NerdTree
let g:NERDTreeShowHidden = 1
let g:NERDTreeMinimalUI = 1
let g:NERDTreeIgnore = []

map <leader>d :NERDTreeToggle<CR>

autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

": -junegunn/fzf
nnoremap <leader>f :FZF<CR>
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-i': 'split',
  \ 'ctrl-v': 'vsplit'
\}

": -mhinz/vim-mix-format
let g:mix_format_on_save = 1

": -neoclide/coc.nvim
let g:coc_node_path = $HOME.'/.asdf/shims/node'
let g:coc_global_extensions = [
	\'coc-snippets',
	\'coc-pairs',
	\'coc-tsserver',
	\'coc-eslint',
	\'coc-prettier',
	\'coc-json'
\]

command! -nargs=0 Prettier :CocCommand prettier.formatFile

": -nnoremap <leader>d :CocCommand explorer<CR>

nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

inoremap <silent><expr> <c-space> coc#refresh()
nnoremap <silent> K :call <SID>show_documentation()<CR>

inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

aug i3config_ft_detection
  au!
  au BufNewFile,BufRead ~/.config/i3/config set filetype=i3config
aug end
