call plug#begin('~/.config/nvim/plugins')

" Common plugs
Plug 'vim-airline/vim-airline'
Plug 'ludovicchabant/vim-gutentags'
Plug 'vim-airline/vim-airline-themes'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'jiangmiao/auto-pairs'
Plug 'preservim/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
Plug 'terryma/vim-multiple-cursors'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'ervandew/supertab'
Plug 'chriskempson/base16-vim'
Plug 'ryanoasis/vim-devicons'
Plug 'morhetz/gruvbox'
Plug 'vim-syntastic/syntastic'
Plug 'rhysd/vim-clang-format'
Plug 'OmniSharp/omnisharp-vim'
Plug 'fadein/vim-figlet'
Plug 'iamcco/coc-flutter'
Plug 'dart-lang/dart-vim-plugin'

" Elixir plugs
Plug 'elixir-editors/vim-elixir'
Plug 'mhinz/vim-mix-format'

" Js/Ts plugs
Plug 'pangloss/vim-javascript'
Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'

" VueJS
Plug 'posva/vim-vue'

" Header
Plug 'buminta/vim-header'

" Git
Plug 'apzelos/blamer.nvim'

call plug#end()

let mapleader = " "

" Git blamer setting
let g:blamer_enabled = 1
let g:blamer_delay = 500

" Settings for vim mix format
let g:mix_format_on_save = 1

" Settings for Vim Airline
let g:airline_powerline_fonts = 1
set hidden
let g:Powerline_symbols = 'fancy'
let g:airline_left_alt_sep = ''
let g:airline_right_alt_sep = ''

let g:airline_theme='base16_gruvbox_dark_soft'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline#extensions#tabline#show_buffers = 0
let g:airline#extensions#tabline#show_tab_nr = 1
let g:airline#extensions#tabline#buffer_idx_mode = 1
let g:airline#extensions#tabline#tab_nr_type = 1

" Settings for NERDTree
let NERDTreeIgnore = ['\.beam$', '_build', 'node_modules', 'deps']
let NERDTreeAutoDeleteBuffer = 1 " Auto delete buffer when files/folders are deleted by NERDTree
let NERDTreeQuitOnOpen = 0 " Auto close NERDTree when open a file
let NERDTreeMinimalUI = 1
map <leader>\ :NERDTreeToggle<CR>

" Settings for Coc
" show hints/documentations
nnoremap <silent>? :call CocAction('doHover')<CR>

" Global clipboard
if empty($SSH_CONNECTION) && has('clipboard')
 set clipboard^=unnamed                " Use vim global clipboard register
 if has('unnamedplus') || has('nvim')  " Use system clipboard register
   set clipboard^=unnamedplus
 endif
endif

" Setup for ripgrep, fzf
" To show preview in fashion way, you need to install bat - a cat alternative
" programe
" let $FZF_DEFAULT_OPTS='
"            \ --color=fg:#9CA3AF,bg:#1F2937,hl:#FBBF24
"            \ --color=fg+:#ffffff,bg+:#6B7280,hl+:#f57900
"            \ --color=info:#afaf87,prompt:#d7005f,pointer:#cc0000
"            \ --color=marker:#DB2777,spinner:#af5fff,header:#729fcf'

command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --smart-case --color=never --ignore-case '.shellescape(<q-args>), 1,
  \   <bang>0 ? fzf#vim#with_preview('up:60%')
  \           : fzf#vim#with_preview('right:50%:hidden', 'ctrl-/'),
  \   <bang>0)

"Restore cursor to file position in previous editing session
""http://vim.wikia.com/wiki/Restore_cursor_to_file_position_in_previous_editing_session
"set viminfo='10,\"100,:20,%,n~/.viminfo
" :help last-position-jump
autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif

" Settings for Supertab
let g:SuperTabDefaultCompletionType = "<c-n>"
autocmd FileType javascript let g:SuperTabDefaultCompletionType = "<c-x><c-o>"

" Settings for gutentags
set statusline+=%{gutentags#statusline()}

" Settings for auto-pairs
let g:AutoPairsMultilineClose = 0

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 1
