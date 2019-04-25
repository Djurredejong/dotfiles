" Easy installation of .vim plugins https://github.com/tpope/vim-pathogen
" (just copy the .vim file to ~/.vim/bundle)
filetype off                      " force reloading *after* pathogen loaded
execute pathogen#infect()
execute pathogen#helptags()

set noswapfile                  " I really never used those.

set shell=bash " Change shell

filetype plugin indent on

syntax enable
set background=dark
let g:solarized_termcolors=256
colorscheme solarized           " https://github.com/altercation/Vim-colors-solarized

set scrolloff=3                 " Always keep one line above/below the cursor
set tabstop=2                   " a tab is two spaces
set expandtab                   " expand tabs by default (overloadable per file type later)
set shiftwidth=2                " number of spaces to use for autoindenting
set shiftround                  " use multiple of shiftwidth when indenting with '<' and '>'
set smarttab                    " insert tabs on the start of a line according to shiftwidth, not tabstop
set showmatch                   " set show matching parenthesis
set ignorecase                  " ignore case when searching
set smartcase                   " ignore case if search pattern is all lowercase, case-sensitive otherwise
set pastetoggle=<F2> 		        " when in insert mode, press <F2> to go to
                                "    paste mode, where you can paste mass data
                                "    that won't be autoindented
set autoread 			              " automatically reload files changed outside of Vim

" Got to last line
if has("autocmd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
endif

fun! <SID>StripTrailingWhitespaces()
    let l = line(".")
    let c = col(".")
    %s/\s\+$//e
    call cursor(l, c)
endfun

autocmd FileType c,cpp,java,php,ruby,python,javascript autocmd BufWritePre <buffer> :call <SID>StripTrailingWhitespaces()

" Avoid a end of line at the end of each file
autocmd FileType ruby setlocal expandtab shiftwidth=2 tabstop=2
let g:rubycomplete_buffer_loading = 1
let g:rubycomplete_rails = 1

" Always start the NERD Tree ()
" And make it work for all tabs (https://github.com/jistr/vim-nerdtree-tabs)
"autocmd VimEnter * NERDTree
"autocmd VimEnter * NERDTreeTabsOpen
"autocmd VimEnter * wincmd p
map <C-n> :NERDTreeTabsToggle<CR>
nnoremap <Tab> :bnext<CR>:redraw<CR>:ls<CR>
nnoremap <S-Tab> :bprevious<CR>:redraw<CR>:ls<CR>

" Toggle line numbers
set number                      " always show line numbers
map <C-m> :setlocal number!<cr>
set showcmd             " show command in bottom bar

set wildmenu            " visual autocomplete for command menu

set termencoding=utf-8
set encoding=utf-8
let g:indentLine_color_term = 6

" CtrlP settings
"let g:ctrlp_match_window = 'bottom,order:ttb'  "ordering of files
"let g:ctrlp_switch_buffer = 0                  "open files in new buffer
"let g:ctrlp_working_path_mode = 0              "make changing working path possible
"let g:ctrlp_user_command = 'ag %s -l --nocolor --hidden -g ""'

" yank to the system clipboard
set clipboard=unnamedplus

" Show a colored column, indicating maximum line width
hi ColorColumn ctermbg=darkgrey
set colorcolumn=120
" Show open buffers and prompt for switch
map <F4> :ls<CR>:buffer<space>
