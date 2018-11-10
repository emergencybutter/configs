set nocompatible

set autoindent
set autoread
set background=dark
set backspace=indent,eol,start
set display+=lastline
set formatoptions+=j " Delete comment character when joining commented lines
set history=1000
set hlsearch
set incsearch
set laststatus=2
set nrformats-=octal
set ruler
set scrolloff=1
set sessionoptions-=options
set shell=/bin/bash
set sidescrolloff=5
set smarttab
set tabpagemax=50
set ttimeout
set ttimeoutlen=100
set undodir=~/.vim/undo
set undofile
set viminfo^=!
set wildmenu
set wildmode=list:longest

map Q gq

if has('path_extra')
  setglobal tags-=./tags tags-=./tags; tags^=./tags;
endif

" Allow color schemes to do bright colors without forcing bold.
if &t_Co == 8 && $TERM !~# '^linux\|^Eterm'
  set t_Co=16
endif

" Load matchit.vim, but only if the user hasn't installed a newer version.
if !exists('g:loaded_matchit') && findfile('plugin/matchit.vim', &rtp) ==# ''
  runtime! macros/matchit.vim
endif

inoremap <C-U> <C-G>u<C-U>

if &t_Co > 2 || has("gui_running")
	syntax on
	let c_comment_strings=1

	highlight MatchParen ctermbg=blue guibg=lightblue
	highlight ColorColumn ctermbg=237 guibg=blue
	set colorcolumn=+1
endif

autocmd VimEnter * :set visualbell t_vb=
filetype plugin indent on
autocmd FileType text setlocal textwidth=72

autocmd BufReadPost *
  \ if line("'\"") > 0 && line("'\"") <= line("$") |
  \   execute "normal g`\"" |
  \ endif


inoremap <C-l> <esc>
if has('gui_running') || has('nvim') && exists('$DISPLAY')
	noremap <Leader>y "+y
endif
noremap <Leader>p "+p

function! MaybeSource(path)
  let l:expanded = expand(a:path)
  if filereadable(l:expanded)
    execute 'source ' . l:expanded
  endif
endfunction

call MaybeSource("$HOME/.vim/local.vim")
