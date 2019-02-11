"README ------------------------------------------------------------------{{{
"
"}}}
"Keys --------------------------------------------------------------------{{{
"keys           ||||||||||||||      functions
"
"Ctrl-l         ||||||||||||||  goto end of line in edit mode
"Ctrl-k         ||||||||||||||  close tab
"Ctrl-h         ||||||||||||||  Document wrap, avoid lines overflow
"Ctrl-p         ||||||||||||||  go a paragraph up
"Ctrl-n         ||||||||||||||  go a paragraph down
"Ctrl-a         ||||||||||||||  select all
"Ctrl-d         ||||||||||||||  save and exit
"Ctrl-w         ||||||||||||||  save
"Ctrl-z         ||||||||||||||  hold and exit
"Tab            ||||||||||||||  expand folding
"}}}
"Keybinds ----------------------------------------------------------------{{{
    "Leader ----------------------------------------------------------{{{
    "Leader key
    let mapleader = "-"
    let maplocalleader = "\\"
"}}}
    "Muliple Curser --------------------------------------------------{{{
    "remove the default binding
    let g:multi_cursor_use_default_mapping=0
    "start and next
    let g:multi_cursor_start_word_key      = '<S-n>'
    let g:multi_cursor_select_all_word_key = '<S-u>'
    let g:multi_cursor_start_key           = 'g<S-n>'
    let g:multi_cursor_select_all_key      = 'g<S-a>'
    let g:multi_cursor_next_key            = '<S-n>'
    let g:multi_cursor_prev_key            = '<S-p>' "previous
    let g:multi_cursor_skip_key            = '<S-x>' "escape
    let g:multi_cursor_quit_key            = '<Esc>'
"}}}
    "GitGitter -------------------------------------------------------{{{
noremap <F4> :GitGutterToggle<cr>
"}}}
    "Others ---------------------------------------------------------{{{
"}}}
    imap <C-l> <Esc>$a
    map <C-m> :FZF <CR>
    nnoremap <S-f> :find
    nnoremap <S-t> :tabnew<CR>
    nnoremap  <C-k> :tabclose<CR>
    ""Document wrap"
    noremap <C-h> gqG <CR>
    "AutoFormate
    noremap <F3> :Autoformat<CR>
    inoremap <F3>  <Esc> :Autoformat<CR>
    vnoremap <F3>  <Esc> :Autoformat<CR>
    autocmd FileType vim,tex let b:autoformat_autoindent=0
    map <c-b> :call JsBeautify()<cr>
    "Folding
    nnoremap <c-z> mzzMzvzz15<c-e>`z:Pulse<cr>
    " Tab to toggle folds.
    nnoremap <Tab> za
    vnoremap <Tab> za
    " Make zO recursively open whatever fold we're in, even if it's partially open.
    nnoremap zO zczO
    noremap <C-p> {
    noremap <C-n> }
    "delete all
    noremap <leader>d gg<Esc>VGd
    "quit without change
    noremap <leader>q :q!<CR>
    "select all
    nnoremap <C-a> gg<Esc>VG
    inoremap <C-a> gg<Esc>VG
    vnoremap <C-a> gg<Esc>VG
    vnoremap <C-c> "+y
    vnoremap <C-d> "+d
    noremap <C-w> :w <CR>
    inoremap <C-w> <Esc> :w <CR>
    vnoremap <C-w> <Esc> :w <CR>
    vnoremap <C-d> <Esc> :wq <CR>
    inoremap <C-d> <Esc> :wq <CR>
    noremap <C-d>  :wq <CR>
    nnoremap <C-J> <C-W><C-J>
    nnoremap <C-K> <C-W><C-K>
    nnoremap <C-L> <C-W><C-L>
    nnoremap <C-H> <C-W><C-H>
    "this is explicit, it should work without it though, but it doesn't..
    map <C-z> :sus<CR>
    "Open NERDTree
    map <leader>n :NERDTreeToggle<CR>
    nnoremap <leader>f :FlyGrep<cr>

"}}}
"Plugins -----------------------------------------------------------------{{{
    """"git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
""""""""""""""""""""""""""List of Plugins"""""""""""""""""""""""""
Plugin 'VundleVim/Vundle.vim'
" highlights the tags <tag> </tag>
Plugin 'valloric/MatchTagAlways'
Plugin 'wsdjeg/FlyGrep.vim'
Plugin 'dracula/vim'
Plugin 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plugin 'junegunn/fzf.vim'
Plugin 'airblade/vim-gitgutter'
Plugin 'maksimr/vim-jsbeautify'
Plugin 'flazz/vim-colorschemes'
Plugin 'jason0x43/vim-js-indent'
Plugin 'Quramy/vim-js-pretty-template'
Plugin 'Shutnik/jshint2.vim'
Plugin 'jceb/vim-orgmode'
"Syntax highlighting for lots of languages
Plugin 'sheerun/vim-polyglot'
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
Plugin 'scrooloose/nerdtree'
"works with only html tags ()"
Plugin 'alvan/vim-closetag'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'Quramy/tsuquyomi'
Plugin 'w0rp/ale'
Plugin 'leafgarland/typescript-vim'
Plugin 'pangloss/vim-javascript'
Plugin 'tpope/vim-surround'
Plugin 'digitaltoad/vim-pug'
"Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'Chiel92/vim-autoformat'
Plugin 'vim-airline/vim-airline' "Status bar
Plugin 'mattn/emmet-vim' "works in Html and CSS files  only"
Plugin 'jiangmiao/auto-pairs' "add \" for everything"
Plugin 'vim-airline/vim-airline-themes'
Plugin 'enricobacis/vim-airline-clock'
Plugin 'liuchengxu/space-vim-dark'
Plugin 'morhetz/gruvbox' " gruvbox is a theme
call vundle#end()            " required
filetype plugin indent on    " required
"}}}i
"Folding ---------------------------------------------------------------- {{{
    "borrowed from Steve Loch's vim the hard way
function! MyFoldText()
    let line = getline(v:foldstart)

    let nucolwidth = &fdc + &number * &numberwidth
    let windowwidth = winwidth(0) - nucolwidth - 3
    let foldedlinecount = v:foldend - v:foldstart

    " expand tabs into spaces
    let onetab = strpart('          ', 0, &tabstop)
    let line = substitute(line, '\t', onetab, 'g')

    let line = strpart(line, 0, windowwidth - 2 -len(foldedlinecount))
    let fillcharcount = windowwidth - len(line) - len(foldedlinecount)
    return line . '…' . repeat(" ",fillcharcount) . foldedlinecount . '…' . ' '
endfunction
set foldtext=MyFoldText()
" }}}
"vim -------------------------------------------------------------------- {{{
    "borrowed from Steve Loch's vim the hard way
augroup ft_vim
    au!

    au FileType vim setlocal foldmethod=marker
    au FileType help setlocal textwidth=78
    au BufWinEnter *.txt if &ft == 'help' | wincmd L | endif
augroup END

" }}}
"Look --------------------------------------------------------------------{{{
    "Status ----------------------------------------------------------{{{
    "Status-bar Airline
    let g:airline#extensions#tabline#enabled = 1
    let g:airline_powerline_fonts = 1
    let g:airline#extensions#tabline#left_sep = ' '
    let g:airline#extensions#tabline#left_alt_sep = '|'
    let g:airline_theme='base16_colors'
    let g:airline#extensions#tabline#formatter = 'jsformatter'
"}}}
"}}}
"HTML --------------------------------------------------------------------{{{
    "Emmet -----------------------------------------------------------{{{
    let g:user_emmet_install_global = 0
    autocmd FileType html,css EmmetInstall
"}}}
"}}}
"MISC --------------------------------------------------------------------{{{
"
"}}}
"Setting -----------------------------------------------------------------{{{
    """""" for help type eg: :help showcmd
syntax on
set encoding=utf-8
set updatetime=100
set clipboard=unnamedplus
set foldlevelstart=1
set laststatus=2
set foldlevelstart=0
set noswapfile
set wildmenu
set wildmode=full
set showmatch
set nowrap
set path=**
set mouse=a
set foldnestmax=1
set number
set relativenumber
set foldnestmax=10
set foldlevel=2
set listchars=eol:¬,tab:␣·,trail:~,extends:❯,precedes:❮,space:.
set list
set showcmd
set foldmethod=marker
filetype plugin indent on
set tabstop=4
set shiftwidth=4
set expandtab
"}}}
