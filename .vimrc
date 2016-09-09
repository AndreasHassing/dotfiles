set nocompatible
filetype off

" Include Vundle and init
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'

Plugin 'editorconfig/editorconfig-vim'
Plugin 'tpope/vim-fugitive'	" Nice Git features
Plugin 'fatih/vim-go'		" Golang support
Plugin 'tfnico/vim-gradle'	" Gradle-file support (Groovy)
Plugin 'tpope/vim-sleuth'	" Adjusts tabstop and shiftwidth based on file
Plugin 'tpope/vim-rails' " Rails support
Plugin 'scrooloose/nerdtree'	" File browser in Vim
Plugin 'scrooloose/nerdcommenter' " Easy comment/uncomment of lines
Plugin 'Raimondi/delimitMate'	" Nice delimiters
Plugin 'Valloric/YouCompleteMe' " Autocomplete
Plugin 'python.vim'
Plugin 'scrooloose/syntastic'
Plugin 'fsharp/vim-fsharp'

set shell=/bin/bash
set expandtab
set tabstop=2
set shiftwidth=2
set directory=$HOME/.vimbak	" Throw swap files away!
set undodir=$HOME/.vimbak   " Store undo files

if has("vms")
  set nobackup		" do not keep a backup file, use versions instead
else
  set backup		" keep a backup file (restore to previous version)
  set backupdir=$HOME/.vimbak " store backups in location
  set undofile		" keep an undo file (undo changes after closing)
endif
set history=50		" keep 50 lines of command line history
set ruler		" show the cursor position all the time
set showcmd		" display incomplete commands
set incsearch		" do incremental searching
set number		" Show line-number left

" Don't use Ex mode, use Q for formatting
map Q gq

" CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo,
" so that you can undo CTRL-U after inserting a line break.
inoremap <C-U> <C-G>u<C-U>

" In many terminal emulators the mouse works just fine, thus enable it.
if has('mouse')
  set mouse=a
endif

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
  syntax on
  set hlsearch
  highlight Search ctermbg=black ctermfg=yellow term=underline
endif
set listchars=nbsp:¬,eol:¶,tab:>-,extends:»,precedes:«,trail:•
set term=screen-256color
let delimitMate_expand_cr = 1

filetype plugin indent on

" When editing a file, always jump to the last known cursor position.
" Don't do it when the position is invalid or when inside an event handler
" (happens when dropping a file on gvim).
" Also don't do it when the mark is in the first line, that is the default
" position when opening a file.
autocmd BufReadPost *
      \ if line("'\"") > 1 && line("'\"") <= line("$") |
      \   exe "normal! g`\"" |
      \ endif

set autoindent		" always set autoindenting on

