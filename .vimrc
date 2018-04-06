" All system-wide defaults are set in $VIMRUNTIME/archlinux.vim (usually just
" /usr/share/vim/vimfiles/archlinux.vim) and sourced by the call to :runtime
" you can find below.  If you wish to change any of those settings, you should
" do it in this file (/etc/vimrc), since archlinux.vim will be overwritten
" everytime an upgrade of the vim packages is performed.  It is recommended to
" make changes after sourcing archlinux.vim since it alters the value of the
" 'compatible' option.
set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'xuhdev/vim-latex-live-preview'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'edkolev/tmuxline.vim'
Plugin 'altercation/vim-colors-solarized'
call vundle#end()
filetype plugin indent on
" This line should not be removed as it ensures that various options are
" properly set to work with the Vim-related packages.
" runtime! archlinux.vim

" If you prefer the old-style vim functionalty, add 'runtime! vimrc_example.vim'
" Or better yet, read /usr/share/vim/vim80/vimrc_example.vim or the vim manual
" and configure vim to your own liking!

" do not load defaults if ~/.vimrc is missing
"let skip_defaults_vim=1
"
" set t_Co=16
let g:solarized_termtrans = 1
set background=dark
colorscheme solarized
set cursorline

set encoding=utf-8
set fileencoding=utf-8
set tabstop=2
set softtabstop=0 noexpandtab
set shiftwidth=2

set number
"set title
set hidden
syntax on
set mouse=a

set laststatus=2

set grepprg=grep\ -nH\ $*

:highlight ExtraWhitespace ctermbg=red guibg=red
:highlight TabsInText ctermbg=red guibg=red
:highlight SpaceIndent ctermbg=red guibg=red
:autocmd ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=red
:autocmd ColorScheme * highlight TabsInText ctermbg=red guibg=red
:autocmd ColorScheme * highlight SpaceIndent ctermbg=red guibg=red

match ExtraWhitespace /\s\+$/
match SpaceIndent /^\t*\zs \+/
match TabsInText /[^\t]\zs\t\+/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()

let g:tex_flavor='latex'
let g:airline_powerline_fonts = 1
let g:airline_skip_empty_sections = 1
let g:airine#extensions#tmuxline#enabled = 1
let g:airline#extensions#tmuxline#snapshot_file = "~/.tmux-status.conf"
