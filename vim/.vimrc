"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set history=500 " Sets how many lines of history VIM has to remember

" Default leader key is backslash \
" Uncomment to remap
let mapleader = ","

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => VIM user interface
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set ruler " Always show current position
set cmdheight=1 " Height of the command bar
set ignorecase " Ignore case when searching
set hlsearch " Highlight search results
set incsearch " Makes search act like search in modern browsers
set showmatch " Show matching brackets when text indicator is over them set showmatch
set number " Show line numbers
set relativenumber " Show relative line numbers
set showcmd " Show command in bottom bar
set showmode " Show current mode
set cursorline " highlight current line
set wildmenu " visual autocomplete for command menu
set nostartofline " Keep cursor on same column
set lazyredraw " redraw only when we need to
set report=0 " Report the number of lines changed

nnoremap <leader><space> :nohlsearch<CR> " turn off search highlight

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Colors & Fonts
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Use 24-bit (true-color) mode in Vim/Neovim when outside tmux.
"If you're using tmux version 2.2 or later, you can remove the outermost $TMUX check and use tmux's 24-bit color support
"(see < http://sunaku.github.io/tmux-24bit-color.html#usage > for more information.)
if (empty($TMUX))
  if (has("nvim"))
    "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif
  "For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
  "Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
  " < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
  if (has("termguicolors"))
    set termguicolors
  endif
endif

syntax on " Enable syntax highlighting
colorscheme onedark " Color scheme
set background=dark " Set background

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Files, backups and undo
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Turn backup off, since most stuff is in SVN, git etc. anyway...
set nobackup
set nowb
set noswapfile

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Text, tab and indent related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set expandtab " Use spaces instead of tabs
set smarttab " Be smart when using tabs

" 2 space tabs
set shiftwidth=2
set tabstop=2
set softtabstop=2

set ai " Auto indent
set si " Smart indent
set wrap " Wrap lines

" Linebreak on 500 characters
set lbr
set tw=500

""""""""""""""""""""""""""""""
" => Status line
""""""""""""""""""""""""""""""
set laststatus=2 " Always show the status line

" Format the status line
set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l\ \ Column:\ %c

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Key Mappings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Move a line of text using SHIFT+[j/k/Up/Down]
nnoremap <S-j> :m .+1<CR>==
nnoremap <S-k> :m .-2<CR>==
nnoremap <S-Up> :m .-2<CR>==
nnoremap <S-Down> :m .+1<CR>=

vnoremap <S-j> :m '>.+1<CR>gv=gv
vnoremap <S-k> :m '<.-2<CR>gv=gv
vnoremap <S-Up> :m '<.-2<CR>gv=gv
vnoremap <S-Down> :m '>.+1<CR>gv=gv

" Duplicate line(s) of text via SHIFT+ALT+[j/k/Up/Down]
vnoremap <S-A-Down> y'>p
vnoremap <S-A-Up> y'<p
vnoremap <S-A-j> y'>p
vnoremap <S-A-k> y'<p

nnoremap <S-A-Down> yyp
nnoremap <S-A-Up> yyP
nnoremap <S-A-j> yyp
nnoremap <S-A-k> yyP

" Fast saving
nmap <leader>w :w!<cr>
nmap <leader>q :q!<cr>
nmap <leader>wq :wq!<cr>

" Mappings for managing tabs
nnoremap H gT " Switch to previous tab
nnoremap L gt " Switch to next tab

map <leader>nt :tabnew<cr>
map <leader>to :tabonly<cr>
map <leader>ct :tabclose<cr>
map <leader>mt :tabmove
map <leader>t<leader> :tabnext<cr>

" Open a new tab with the current buffer's path
map <leader>te :tabedit <C-r>=expand("%:p:h")<cr>/

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Helper functions
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Returns true if paste mode is enabled
function! HasPaste()
    if &paste
        return 'PASTE MODE  '
    endif
    return ''
endfunction
