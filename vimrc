" Add this line.
call pathogen#infect()

" Map the leader and reload vim
let mapleader=","
nmap <silent> <leader>ev :e $MYVIMRC<CR>
nmap <silent> <leader>sv :so $MYVIMRC<CR>

"Allows you to open another buffer without closing current
set hidden



" You probably already have these lines. Add them if not:
syntax on
set nu
set expandtab
set shiftwidth=4
set softtabstop=2
set shiftround
set smarttab
set pastetoggle=<F2>

" Gota go hacker style
map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>

" stop jumping lines
nnoremap j gj
nnoremap k gk

"Sudo

cmap w!! w !sudo tee % > /dev/null

" Case sensitivity for search
set smartcase
set hlsearch
set incsearch

"undo buffer and history
set history=1000
set undolevels=1000
set wildignore=*.pyc
set title
set visualbell

" no backup and swap

set nobackup
set noswapfile



set autoindent
set smartindent
inoremap ( ()<Esc>i
inoremap { {}<Esc>i
inoremap [ []<Esc>i
inoremap < <><Esc>i
map <F5> :tabp <CR>
map <F8> :tabn <CR>
map <F6> :tabe
" Special Execution Command

set backspace=indent,eol,start
setlocal spell spelllang=en_us

map <F3> :RainbowParenthesesToggleAll<CR>

" Code folding to make it awesome
:autocmd FileType py setlocal foldmethod=indent
:autocmd FileType cpp setlocal foldmethod=syntax
:autocmd FileType c setlocal foldmethod=syntax

set foldnestmax=10      "deepest fold is 10 levels
set nofoldenable        "dont fold by default
set foldlevel=1         "this is just what i use




"Function closes vim without having to exit NERDTree
function! NERDTreeQuit()
  redir => buffersoutput
  silent buffers
  redir END
"                     1BufNo  2Mods.     3File           4LineNo
  let pattern = '^\s*\(\d\+\)\(.....\) "\(.*\)"\s\+line \(\d\+\)$'
  let windowfound = 0

  for bline in split(buffersoutput, "\n")
    let m = matchlist(bline, pattern)

    if (len(m) > 0)
      if (m[2] =~ '..a..')
        let windowfound = 1
      endif
    endif
  endfor

  if (!windowfound)
    quitall
  endif
endfunction
autocmd WinEnter * call NERDTreeQuit()




func! WordProcessorMode() 
  setlocal formatoptions=1 
  setlocal noexpandtab 
  map j gj 
  map k gk
  setlocal spell spelllang=en_us 
  set thesaurus+=/Users/sbrown/.vim/thesaurus/mthesaur.txt
  set complete+=s
#set formatprg=par
  setlocal wrap 
  setlocal linebreak 
endfu 
com! WP call WordProcessorMode()


colorscheme github
