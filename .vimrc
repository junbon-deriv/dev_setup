version 7.0

""" Vundle Entries
" NOTE: comments after Bundle command are not allowed..
set nocompatible               " be iMproved
filetype off                   " required!

set runtimepath+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required! 
Bundle 'gmarik/vundle'

" My Bundles here:
"
" original repos on github
Bundle 'tpope/vim-fugitive'
Bundle 'c9s/perlomni.vim'
Bundle 'kien/ctrlp.vim'
  map <Leader>t :CtrlPBuffer<CR>
  let g:ctrlp_map = '<C-t>'
  let g:ctrlp_working_path_mode = 0 " don’t manage working directory.
  let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v\c\.(git|svn)$|cgi/t/sandbox|cover_db',
  \ 'file': '\v\c\.(swf|bak|png|gif|js|mov|ico|jpg|pdf|jrxml)$',
  \ }
Bundle 'Lokaltog/vim-powerline'
  let g:Powerline_symbols = 'fancy'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'mileszs/ack.vim'
Bundle 'cakebaker/scss-syntax.vim'

" vim-scripts repos
"Bundle 'L9'
"Bundle 'FuzzyFinder'
"  let g:fuf_coveragefile_exclude = '\c\.\(swf\|bak\|png\|gif\|js\|mov\|ico\|jpg\|pdf\|jrxml\)$\|cgi\/t\/sandbox\|\/cover_db\/'
"  map <Leader>t :FufBuffer<CR>
"  map <C-t> :FufCoverageFile<CR>

" non github repos
"Bundle 'git://git.wincent.com/command-t.git'
" ...

filetype plugin indent on     " required!

""" vimrc resumes :-)

set autoindent
set backspace=indent,eol,start
set cindent " set smartindent
set cmdheight=2
set cursorcolumn
set cursorline
set errorformat=\"../../%f\"\\,%*[^0-9]%l:\ %m
set expandtab
set hidden
set hlsearch
set ignorecase
set incsearch
set laststatus=2
set list
"set listchars=tab:>-,trail:-
set listchars=tab:\|\ ,trail:-,extends:>,precedes:<,nbsp:+
set tabstop=4
highlight SpecialKey ctermfg=grey ctermbg=black
set mouse=c
set nowrap
set number
set ruler
set scrolloff=5
set shiftwidth=4
set showcmd
set showmatch
set smarttab
"set statusline=%F%m%r%h%w\ [%{&ff}]\ %y\ [CHR=%b/0x%B]\ [POS=%04l,%03c(%03v)]\ [%p%%]\ [LEN=%L]\ %{fugitive#statusline()}
set t_Co=256
set tags=tags;/
set virtualedit=block
set wrap
syntax on

"colorscheme desert
highlight   CursorColumn  term=NONE    cterm=none ctermbg=232
highlight   CursorLine    term=NONE    cterm=none ctermbg=232
highlight   FoldColumn                            ctermbg=8  ctermfg=14
highlight   Folded                                ctermbg=8  ctermfg=14
highlight   Search        term=reverse cterm=bold ctermbg=11 ctermfg=0
highlight   Visual        term=NONE    cterm=bold ctermbg=10 ctermfg=8
"
"" makes Omni Completion less pinky :P
highlight   Pmenu                                 ctermbg=2  ctermfg=0
highlight   PmenuSel                              ctermbg=7  ctermfg=0
highlight   PmenuSbar                             ctermbg=0  ctermfg=7
highlight   PmenuThumb                            ctermbg=7  ctermfg=0

" :help last-position-jump
autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif

nnoremap <C-L> :noh<CR><C-L>
inoremap jj <Esc>
nnoremap <Leader>r :source ~/.vimrc<CR>
nnoremap <Leader><Leader>r :e ~/.vimrc<CR>

map <Leader>rd :!perl -d %<CR>
map <Leader>sc :!perl -c %<CR>
map <Leader>rc :!perl %<CR>
map <Leader>pt :%! perltidy -pro=/home/git/regentmarkets/cpan/rc/.perltidyrc --backup-and-modify-in-place -bext=tidyup<CR>
map <Leader>gb :Gblame<CR>

map <C-n> :cnext<CR>
map <C-m> :cprevious<CR>
autocmd FileType go nmap <leader>gb  <Plug>(go-build)
autocmd FileType go nmap <leader>gr  <Plug>(go-run)
autocmd FileType go nmap <leader>gt  <Plug>(go-test)
autocmd FileType go nmap <leader>gtf  <Plug>(go-test-func)
autocmd FileType go nmap <leader>gc  <Plug>(go-coverage-toggle)

nmap <F1> <Esc>
imap <F1> <Esc>

call plug#begin()
Plug 'fatih/vim-go', { 'do': ':GoInstallBinaries' }
call plug#end()

set autowrite

"" go stuff

let g:rehash256 = 1
let g:molokai_original = 1
colorscheme desert
let g:coc_disable_startup_warning = 1
" disable all linters as that is taken care of by coc.nvim
let g:go_diagnostics_enabled = 0
let g:go_metalinter_enabled = ['vet', 'golint', 'errcheck']
let g:go_metalinter_autosave = 1

" don't jump to errors after metalinter is invoked
let g:go_jump_to_error = 0

" run go imports on file save
let g:go_fmt_command = "goimports"

" automatically highlight variable your cursor is on
let g:go_auto_sameids = 0

let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_operators = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_build_constraints = 1
let g:go_highlight_generate_tags = 1
let g:go_version_warning = 0
