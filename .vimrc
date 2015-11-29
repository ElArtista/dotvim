" Use Vim settings, rather then Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

" Set the vim user folder in windows to the %USERPROFILE%/.vim/
if has('win32') || has('win64')
    set runtimepath=$HOME/.vim,$VIM/vimfiles,$VIMRUNTIME,$VIM/vimfiles/after,$HOME/.vim/after
endif

" ================ General Config ====================
set nowrap                                  " Don't wrap lines
set autoread                                " Reload files changed outside vim
set backspace=indent,eol,start              " Allow backspace in insert mode
set number                                  " Show line numbers
set showcmd                                 " Show incomplete cmds down the bottom
set showmode                                " Show current mode down the bottom

" No sounds
set noerrorbells visualbell t_vb=
autocmd GUIEnter * set visualbell t_vb=

" Enable syntax highlighting
syntax on

" Enable useful search options
set hlsearch                                " Highlight search terms
set incsearch                               " Show search matches as you type

" Enable useful autocomplete for commands
set wildmenu
set wildmode=list:longest,list:full

" Remove preview window from autocompletion
set completeopt-=preview

" Turn Off Swap Files
set noswapfile
set nobackup
set nowb

" Indentation
set autoindent
set smartindent
set smarttab
set shiftwidth=4
set softtabstop=4
set tabstop=4
set expandtab
filetype plugin indent on

" ================ Appearance ========================
set encoding=utf-8
set guifont=Consolas:h10                    " Set the font
colorscheme molokai                         " Set the color scheme

" ================ Gui options =======================
if has("gui_running")
    "Strip unwanted window stuff
    set guioptions-=m                       " Remove menu bar
    set guioptions-=T                       " Remove toolbar
    set guioptions-=r                       " Remove right-hand scroll bar
    set guioptions-=L                       " Remove left-hand scroll bar
endif

if has('win32') || has('win64')
    au GUIEnter * simalt ~x                 " Maximize gVim window
endif

" ================ Startup ===========================
" Load plugin manager
set runtimepath+=~/.vim/bundle/neobundle.vim/
call neobundle#begin(expand('~/.vim/bundle/'))

" Load plugins

" General
NeoBundle 'bling/vim-airline'
NeoBundle 'jiangmiao/auto-pairs'
NeoBundle 'kien/ctrlp.vim'
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'scrooloose/syntastic'
NeoBundle 'Shougo/neocomplete.vim'
NeoBundle 'Shougo/vimproc.vim'
NeoBundle 'tpope/vim-surround'
NeoBundle 'Valloric/YouCompleteMe'
NeoBundle 'xolox/vim-misc'

" Haskell
NeoBundleLazy 'eagletmt/ghcmod-vim', { 'filetypes': 'haskell' }
NeoBundleLazy 'eagletmt/neco-ghc', { 'filetypes': 'haskell' }

" Java
NeoBundleLazy 'hsanson/vim-android', { 'filetypes': 'java' }
NeoBundleLazy 'artur-shaik/vim-javacomplete2', { 'filetypes': 'java' }

" Lua
NeoBundle 'xolox/vim-lua-ftplugin'

call neobundle#end()

" Check if we are missing plugin bundles
NeoBundleCheck

" ================ Custom commands ===================
fun! TrimWhitespace()
    let l:save_cursor = getpos('.')
    %s/\s\+$//e
    call setpos('.', l:save_cursor)
endfun

" ================ Plugins Conf ======================
for f in split(glob('~/.vim/conf/plugins/*.vim'), '\n')
    exe 'source' f
endfor

