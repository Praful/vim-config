"=============================================================================
" File: vimrc
" Description: Vim setup file.
" Author: Praful https://github.com/Praful/vim-config
" Licence: GPL v3
" Requires:
" - plugins.vim: contains the plugins that will be loaded after vimrc executes
" - configure-plugins.vim: in Vim 'after' folder. It's called automatically after 
"   plugins have been loaded.
" 
" The vimrc file is stored in ~/vimfiles/ (Windows) or ~/.vim/ (Unix)
" For info about Vim initialisation, type :h startup
" 
" Used in Linux mainly but works in Windows if set up correctly.
"
" A quick, sorted, list of slow plugins is produced by:
"   https://github.com/hyiltiz/vim-plugins-profile
"
"=============================================================================

function! IsOnHost(hostname)
    return match(system("echo -n $HOST"), '^'.a:hostname.'$') >= 0
endfunction

" Set environment variables ---------------------------------------------------
if has("win32")
  let $VIMRUNTIME = $APPS.'/Vim/current/'
  let $PK_VIMFILES = $HOME.'/vimfiles'
else
" let $VIMRUNTIME = '/usr/local/share/vim/vim90/' 
  let $PK_VIMFILES = $HOME.'/.vim'
endif
let $PK_PLUGINS = $PK_VIMFILES.'/plugins.vim'
let $PK_PLUGINS_CONFIG = $PK_VIMFILES.'/after/plugin/configure-plugins.vim'

"Set plugins that will be loaded after vimrc finishes
if (!empty(glob($PK_PLUGINS)))
  source $PK_PLUGINS
endif

" Disable features that slow down viewing/editig of large files
function! HandleLargeFiles()
  let l:max_size = 1 * 1024 * 1024  " 3MB
  let l:filesize = getfsize(@%)

  if l:filesize > l:max_size
    setlocal filetype=  " prevents syntax from loading
    " syntax clear          " clears syntax rules for this buffer
    setlocal synmaxcol=1  " don't highlight anything
    " setlocal syntax=OFF
    setlocal noswapfile
    setlocal noundofile
    setlocal foldmethod=manual
    setlocal nofoldenable
    " setlocal nowrap
    setlocal nospell
    setlocal nocursorline
    setlocal showbreak=NONE
    setlocal noruler

    let b:airline_enabled = 0

    echo "Large file detected: performance mode enabled"
  endif
endfunction

" pk 28/12/2025 removed after switch to uv
" if has("win32")
  " " see DLL installed since vim binary was compiled with ruby 3.0
  " set rubydll=$APPS/ruby/3.1.2-1/bin/x64-ucrt-ruby310.dll
  " set pythonthreedll=$APPS/Python/current/python311.dll
  " set pythonthreehome=$APPS/Python/current
" elseif has('unix')
  " " temporary fix for python3 because package libpython3.12-dev is not available yet for Linux Mint
  " if executable('pyenv')
    " " Construct the path to the libpython file
    " if has('nvim')
      " "TODO how to set python location to pyenv 
      " let g:python3_host_prog = trim(system('pyenv prefix')) . '/bin/python3'
      " let g:ruby_host_prog = '/usr/local/bin/neovim-ruby-host'
    " else
      " let pythonthreedll = trim(system('pyenv prefix')) . '/lib/libpython3.12.so.1.0'
      " if filereadable(pythonthreedll)
        " let &pythonthreedll = pythonthreedll
      " else
        " echomsg "Error: libpython file not found in the active pyenv environment."
      " endif
    " end
  " else
    " echomsg "Error: pyenv is not installed or not in PATH."
  " endif
" endif


" if has("win32")
" behave mswin -> in mwswin-personal
" this has shortcuts like c-x, c-insert. Use for Linux too
so $PK_VIMFILES/mswin-personal.vim
" endif

" Basic options ---------------------------------------------------------------

" 27/11/2024 - move this to vimrc from configure-plugins.vim since it's processed too 
" late to avoid a conflict defining Open command (which a plugin defines first)
" disable netrw
let g:loaded_netrw = 1
let g:loaded_netrwPlugin = 1

" In general, you don't need this because if a (g)vimrc is found in the 
" usual place, it's enabled. But there are edge cases when this doesn't apply,
" eg providing a file with -u.
set nocompatible

" this tells NERDcommenter what the comment character is for the filetype
filetype plugin on

" load default indents for filetype
filetype plugin indent on

" set all& "reset everything to their defaults
"
set encoding=utf-8

if has("win32")
  " directx allows coloured emoji; the others are trial and error. See:
  " https://docs.microsoft.com/en-gb/windows/win32/api/dwrite/nf-dwrite-idwritefactory-createcustomrenderingparams?redirectedfrom=MSDN
  " https://www.reddit.com/r/vim/comments/2ex6kh/set_renderoptions_windows/
  set rop=type:directx,contrast:1,level:1,geom:1,renmode:4,taamode:1
endif

scriptencoding utf-8

set modelines=0
set showmode
set showcmd
" hidden allows new buffer to be created in current window without prompting you to save current buffer
" set hidden 
"Disable ALT-menu keys so that eg ALT-H (m-h) can be remapped"
set winaltkeys=no 
set visualbell
set cursorline
set ttyfast
set ruler
"backspace over these places
set backspace=indent,eol,start 
set laststatus=2
set history=1000
" Allow undos even after file has been closed and reopened
set undofile 
set undoreload=10000
set nolist
set listchars=tab:▸\ ,eol:¶,extends:❯,precedes:❮,trail:-,nbsp:•
" set shell=/bin/bash
set lazyredraw
" Tenths of a second to show the matching paren, when 'showmatch' is set
set matchtime=3 
" show this char at beginning of line when it is wraps with previous line
set showbreak=↪ 
set fillchars=diff:\
set notimeout
set nottimeout
set autowrite
" keep a backup file
set backup	


"set dictionary=/usr/share/dict/words
" Use ^x^k to look up word.
set dictionary=$PK_VIMFILES/UK.dic
" From http://www.gutenberg.org/dirs/etext02/mthes10.zip. Use ^x^t to invoke or (for 
" thesaurus plugin) <leader>K
set thesaurus=$PK_VIMFILES./mthesaur.txt

" Two trailing slashes tells vim to use whole of file path to create temp files
set directory=$PK_VIMFILES/swap//
set backupdir=$PK_VIMFILES/backup//
set undodir=$PK_VIMFILES/undo//

set nospell "disable spell checking

"set spell "enable spell checking
set spelllang=en_gb

"Enable spell checking for certain files.
"Useful commands:
" ]s - goto next spelling error
" [s - goto prev spelling error
" z= - lists suggestions for current word
" zg - add word to exception list so that it's not spell-checked
" zw - to remove word from spelling dictionary
" zug/zuw - undoes the above two commands

"Don't use this if "set relativenumber" is being used.
set number
" set relativenumber

"Automatically reload a file if it changes - useful for logs
set autoread 

" redefine leader character
let mapleader = " "

" For Windows, caps lock is mapped to ESC in AutoHotKey script.
" Alternative to ESC (in case I've not mapped caps lock to ESC in OS)
inoremap jj <ESC>

"use confirm instead of aborting an action
set confirm


" remember some stuff after quiting vim: marks, registers, searches, buffer list. vim and nvim can't
" share viminfo since they have different formats. nvim uses a shada file; store it in its own (default) directory
" ' =command history; < =lines of history; s =marks and buffer list;
" h =save help history; n =file to save info; % =save/restore buffers
if has('nvim')
  if exists('g:started_by_firenvim') && g:started_by_firenvim
    set shada='100,<80,s100,h
  else
    set shada='100,<80,s100,h,%,n~/.vim/shada
  end
else
  set viminfo='100,<80,s100,h,%,n~/.vim/viminfo
endif

set path=.,./**,$DATA/dev/projects/**

" Show autocomplete menus.
set wildmenu
set wildmode=list:full
" set wildmode=list:longest,full
set wildignore=*.dll,*.o,*.obj,*.bak,*.exe,*.pyc,*.jpg,*.gif,*.png,*.gem,*.swp,*.zip,*.pdf,*~,*/.git,*/.svn,*/.DS_Store,*.class,tags,__pycache__
set wildignorecase

" Any selected text is auto copied to Windows clipboard
" PK 20101013 don't autocopy because we want to select text and replace selected text from clipboard.
" set guioptions+=a

" Remove menu
set guioptions-=m
" Remove toolbar
set guioptions-=T
" Remove right hand scollbar
set guioptions-=r
" Remove left hand scollbar
set guioptions-=l
" set guioptions+=egmrtL
set guioptions-=L
" remove gui confirm
set guioptions-=c



" not supported by nvim; maybe not required for vim?
" set guioptions+=egk

" Use Windows clipboard as default register for yank, delete, change and put.
" This make * the default register, which is used to access the Windows
" clipboard.
" The first (unnamedplus) works for Linux and the second for Win32.
" set clipboard^=unnamedplus,unnamed
" Changed 20230130 for Linux to allow text selected in kitty to be pasted; it get 
" copied to * reg by xsel (need to sudo apt install xsel).
" See https://stackoverflow.com/questions/23946289/vim-change-default-paste-register 
set clipboard^=unnamed

" Allow using the repeat operator with a visual selection (!)
" http://stackoverflow.com/a/8064607/127816
vnoremap . :normal .<CR>

" Replace highlighted text
vnoremap <C-r> "hy:%s/<C-r>h//gc<left><left><left>

" In many terminal emulators the mouse works just fine, thus enable it.
if has('mouse')
  set mouse=a
  set mousehide  
endif

if has('syntax') && !exists('g:syntax_on')
  syntax enable
endif


" Tabs, spaces, wrapping ---------------------------------------------------------------

set autoindent
" Prevents inserting two spaces after punctuation on a join (J)
set nojoinspaces    
" 20190819 - commented out because lines beginning with # (eg Python comments) don't 
"          get indented when typing >> 
"          See https://vim.fandom.com/wiki/Restoring_indent_after_typing_hash
" set smartindent
" The following are suggested in the above link but don't seem to be required. Omit 
" for now.
" set cindent
" set cinkeys-=0#
" set indentkeys-=0#

set smarttab
set tabstop=2
set shiftwidth=2
set shiftround
set softtabstop=2
set expandtab

"See http://stackoverflow.com/questions/19624105/how-can-i-make-vim-break-lines-only-on-whitespace
"Make softwrap wrap on vim default chars not in middle of word
set nolist wrap linebreak breakat&vim

set textwidth=100
" Autoformat comments only
set formatoptions=qcrn1owj

" always set autoindenting on
set autoindent		
"show next line instead of @ symbols
set display=lastline 

set whichwrap+=<,>,h,l "cursor keys wrap

" Quickreturn
"add new line from anywhere in line in insert mode
inoremap <c-cr> <esc>A<cr>
"
"as above but append colon on line first
inoremap <s-cr> <esc>A:<cr>

" Insert blank line above and below without moving the cursor
noremap <S-ENTER> O<ESC>j
noremap <ENTER> o<ESC>k

command! FormatXml set ft=xml | execute "%!tidy -q -i -xml"
command! FormatHtml set ft=html | execute "%!tidy -q -i -html"
command! FormatJSON %!python -m json.tool

" Searching and positioning ----------------------------------------------------------
"
" See also FZF in configure-plugins.vim


set incsearch
set hlsearch
set showmatch
set ignorecase 
set smartcase 
set gdefault 

if executable('rg')
  set grepprg=rg\ --vimgrep\ --smart-case\ --follow\ --color=never
  set grepformat=%f:%l:%c:%m
endif

" https://stackoverflow.com/questions/2362914/fold-function-in-vim
set foldmethod=indent
set foldlevel=20 " don't fold statements only functions"
set foldclose=all

" shows match position in vim >= 8.1.1270
set shortmess-=S

" Keep search matches in the middle of the window.
" 
" if fold versions of n and N mappings aren't being used, use zv to open
" enough folds to view the cursor line.
"
" these open folds automatically when searching
" TODO: setting these stops vim showing match number ([2/7], etc)
" nnoremap n nzzzv
" nnoremap N Nzzzv

" non-fold version:
" nnoremap <silent> n nzz
" nnoremap <silent> N Nzz
"
nnoremap <silent> * *zz
nnoremap <silent> # #zz
"
nnoremap <silent> g* g*zz
nnoremap <silent> g# g#zz

" search for selected text
vnoremap // y/\V<C-R>=escape(@",'/\')<CR><CR>
"
" Unhighlight search results. 
nmap \\ :noh<return>

" Movement, buffers and windows ---------------------------------------------------------------

set splitbelow
set splitright
set scrolloff=5

" Easy buffer navigation

"close window eg when displaying help
" nnoremap <leader>Q :BD<CR>
nnoremap <leader>Q <c-w>c
" Q puts into Ex mode, which I don't use.

"Scoll two lines and leave cursor where it is.
nnoremap <C-K> 2<C-y>
inoremap <C-K> 2<C-y>
nnoremap <C-J> 2<C-e>
inoremap <C-J> 2<C-e>

" change cursor position in insert mode
" inoremap <C-h> <left>
" inoremap <C-l> <right>

"Ctrl-{up,down} to scroll.
"The following only works in gvim?
nnoremap <C-up> <C-y>
inoremap <C-up> <C-o><C-y>
nnoremap <C-down> <C-e>
inoremap <C-down> <C-o><C-e>

"let j and k work in wrapped long lines.
"Do this before defining gj/gk below.
nnoremap <DOWN> gj
nnoremap <UP> gk
nnoremap j gj
nnoremap k gk

" Change go to top/bottom since we're remapping those keys below"
nnoremap T H
nnoremap B L

" Go to beginning or end of line regardless of whether line is wrapped on not
nnoremap H g^
nnoremap L g$

" Window Movement
nnoremap <silent> gh :wincmd h<CR>
nnoremap <silent> gj :wincmd j<CR>
nnoremap <silent> gk :wincmd k<CR>
nnoremap <silent> gl :wincmd l<CR>
" Equal Size Windows
nnoremap <silent> g= :wincmd =<CR>
" Swap Windows
" nnoremap <silent> gx :wincmd x<CR>

" _  quick horizontal splits
nnoremap _ :sp<cr>
" |  quick vertical splits
nnoremap <bar> :vsp<cr>


" For gvim, a gui prompt appears if buffer is not saved; this
" replaces with terminal prompt for unsaved buffers only. For
" saved buffers, the buffer is saved because of autocmd that saves 
" when focus is lost.
function! CLI_BufSwitch(direction)
  " direction: 'next' or 'prev'
  if &modified && bufname('%') ==# ''
    echohl WarningMsg
    echo 'Buffer "' . bufname('%') . '" has never been saved Save? [y/n/c]'
    echohl None

    " Get single key without Enter
    let choice = nr2char(getchar())

    if choice ==? 'y'
      write
    elseif choice ==? 'n'
      bd!
    elseif choice ==? 'c' || choice ==? ''
      return
    else
      " Any other key cancels
      return
    endif
  endif

  " Switch buffer
  if a:direction ==# 'next'
    bnext
  elseif a:direction ==# 'prev'
    bprevious
  endif
endfunction

nnoremap <silent> <c-h> :call CLI_BufSwitch('prev')<CR>
nnoremap <silent> <c-l> :call CLI_BufSwitch('next')<CR>
inoremap <silent> <c-h> <esc>:call CLI_BufSwitch('prev')<CR>
inoremap <silent> <c-l> <esc>:call CLI_BufSwitch('next')<CR>

" as above but use alt key because in kitty, we define c-h/c-l as next/prev kitty tab
nnoremap <silent> <m-h> :call CLI_BufSwitch('prev')<CR>
nnoremap <silent> <m-l> :call CLI_BufSwitch('next')<CR>
inoremap <silent> <m-h> <esc>:call CLI_BufSwitch('prev')<CR>
inoremap <silent> <m-l> <esc>:call CLI_BufSwitch('next')<CR>

" Buffers 
noremap <leader>n :enew<CR>
" noremap <c-h> :bprevious<CR>
" noremap <c-l> :bnext<CR>
" inoremap <c-h> <esc>:bprevious<cr>
" inoremap <c-l> <esc>:bnext<cr>

" as above but use alt key because in kitty, we define c-h/c-l as next/prev kitty tab
" noremap <m-h> :bprevious<CR>
" noremap <m-l> :bnext<CR>
" inoremap <m-h> <esc>:bprevious<cr>
" inoremap <m-l> <esc>:bnext<cr>

" Tabs
" we don't use tabs
" noremap <leader>N :tabnew<CR>
"
" noremap <m-h> :tabprevious<CR>
" noremap <m-l> :tabnext<CR>
" inoremap <m-h> <esc>:tabprevious<CR>
" inoremap <m-l> <esc>:tabnext<CR>

" Command mode
cnoremap <c-a> <home>
cnoremap <c-e> <end>
cnoremap <c-j> <down>
cnoremap <c-k> <up>
cnoremap <c-h> <left>
cnoremap <c-l> <right>
cnoremap <c-x> <delete>
cnoremap <c-o> <backspace>

" Ctrl-v: Paste
cnoremap <c-v> <c-r>"

" reselect visual block after indent
vnoremap < <gv
vnoremap > >gv

" reselect last paste
" nnoremap <expr> gp '`[' . strpart(getregtype(), 0, 1) . '`]'   " doesn't work
" See http://stackoverflow.com/questions/4775088/vim-how-to-select-pasted-block
nnoremap <expr> gV    "`[".getregtype(v:register)[0]."`]"


" Auto-commands ---------------------------------------------------------------

" Only do this part when compiled with support for autocommands.

if has("autocmd")

  " Put these in an autocmd group, so that we can delete them easily.
  augroup PK2
    " see http://stackoverflow.com/questions/15353988/progressively-slower-reloading-time-of-vimrc
    autocmd!


    autocmd BufReadPre * call HandleLargeFiles()
    " autocmd BufEnter * call HandleLargeFiles()

    " Set readonly files to also be non-modifiable by default, and others to be modifiable by default.
    " https://groups.google.com/g/vim_use/c/gpRquKx-HGI?pli=1
    " This allows the autosave when focus is lost below by stopping us changing 
    " a readonly file in the first place.
    autocmd BufRead,BufWinEnter * if &ft!='qf' | let &l:modifiable = (&readonly ? 0 : 1) | endif

    "Autosave file when focus is lost; the silent! ignores the error
    "message that appears when a buffer has never been saved before.
    "- Removed because it causes infinite loop if file is read-only 
    "- 20230627 - re-enabled by adding above autocmd to stop readonly files being changed 
    autocmd BufLeave * silent! wall
    autocmd BufLeave,FocusLost * silent! wall

    " When editing a file, always jump to the last known cursor position.
    " Don't do it when the position is invalid or when inside an event handler
    " (happens when dropping a file on gvim).
    " Also don't do it when the mark is in the first line, that is the default
    " position when opening a file.
    autocmd BufReadPost *
          \ if line("'\"") > 1 && line("'\"") <= line("$") |
          \   exe "normal! g`\"" |
          \ endif

    autocmd BufRead,BufNewFile *.md setlocal spell
    autocmd BufRead,BufNewFile *.txt setlocal spell
  augroup END

endif 

" Open in VS code
"

if has("win32")
  let $vscode = "C:/Program Files/Microsoft VS Code/Code.exe"
else
  let $vscode = "/usr/bin/code"
endif

:command! OpenInVSCode exe "silent !\"" . $vscode . "\" --goto " . expand("%") . ":" . line(".") . ":" . col(".")  | redraw!

nnoremap <c-F10> :OpenInVSCode<CR>
inoremap <c-F10> :OpenInVSCode<CR>

" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
" Only define it when not defined already.
if !exists(":DiffOrig")
  command DiffOrig vert new | set bt=nofile | r # | 0d_ | diffthis
        \ | wincmd p | diffthis
endif


" Misc leader keys and other mappings --------------------------------------


" toggle visible whitespace
nnoremap <silent> <leader>l :set list!<CR>


"underline current line
nnoremap <leader>1 yypVr-

"reselect the text that was just pasted so I can perform commands (like indentation) on it:
" nnoremap <leader>v V`]

nnoremap <leader>ev :e $MYVIMRC<cr>
nnoremap <leader>ep :e $PK_PLUGINS<cr>
nnoremap <leader>ec :e $PK_PLUGINS_CONFIG<cr>
nnoremap <leader>eb :e $HOME/.bashrc<cr>
nnoremap <leader>ez :e $ZDOTDIR/.zshrc<cr>
nnoremap <leader>em :e $HOME/.common_environment<cr>
nnoremap <leader>ea :e $HOME/.common_aliases<cr>
nnoremap <leader>ew :e $DATA/PowerShell/profile.ps1<cr>
nnoremap <leader>et1 :e $MYVIMDIR/zsh-tips-by-zapper.txt<cr>
nnoremap <leader>et2 :e $MYVIMDIR/vim-tips-by-zapper.txt<cr>

" reload vimrc once it's saved (http://vim.wikia.com/wiki/Open_vimrc_file)
autocmd! BufWritePost $MYVIMRC :source $MYVIMRC
autocmd! BufWritePost $PK_PLUGINS :source $PK_PLUGINS
autocmd! BufWritePost $PK_PLUGINS_CONFIG :source $PK_PLUGINS_CONFIG

" Open Quickfix
nnoremap <silent> <Leader>fx :botright copen<CR>

" Map <Leader>ff to display all lines with keyword under cursor
" and ask which one to jump to
nnoremap <Leader>ff [I:let nr = input("Which one: ")<Bar>exe "normal " . nr ."[\t"<CR>

" this command (using vim-shell plugin) broke in vim 9.1.1147 because
" vim has an open plugin. Disable it:
let g:loaded_openPlugin = 1
nnoremap <leader>o :Open<CR>


" Define F3 to paste the results of the last search into a new window
nnoremap <F3> :redir @a<CR>:g//<CR>:redir END<CR>:new<CR>:put! a<CR><CR>

" To save, press ctrl-s.
nnoremap <c-s> :w<CR>
inoremap <c-s> <Esc>:w<CR>a

" Underline the current line with '='
nnoremap <silent> <leader>ul :t.\|s/./-/g\|:nohls<cr>

" Wrap the current line
nnoremap <leader>fw Vgq

" Format whole file then return cursor to current location.
nnoremap <leader>fef mmgg=G'm

" operator pending mapping allows to operate on the whole buffer (A = all)
" with normal mode commands such as, dA, cA, yA,...
" onoremap A :<c-u>normal! ggVG<cr>
" onoremap af :<C-u>normal! mzggVG<CR>`z

" Yank entire buffer with gy
nnoremap gy :%y+<cr>

" delete enter buffer without saving in register or messing up jump list or marks
" nnoremap dy :silent! execute "keepjumps keepmarks 0,$delete _"<CR>
" This version clears then pastes from default register. This is useful for
" pasting from eg chatGPT and removing previous version. Cursor position is saved.
nnoremap dy :let l=line(".")<CR>:%delete _<CR>0"+p<CR>:call cursor(l, col("."))<CR>

" Make Y behave like D and C
nnoremap Y y$

" Alt-shift-J: Duplicate line down
nnoremap <silent> <m-s-j> mzyyp`zj

" Alt-shift-k: Duplicate line up
nnoremap <silent> <m-s-k> mzyyp`z

" Use unimpaired for this now: [e and ]e
" Alt-j: Move current line up
" nnoremap <silent> <m-j> mz:m+<cr>`z==
" Alt-k: Move current line down
" nnoremap <silent> <m-k> mz:m-2<cr>`z==


" mirror ^o/^i which jumps back/forward in jump list
" Alt-o: Jump back in the changelist
nnoremap <m-o> g;
" Alt-i: Jump forward in the changelist
nnoremap <m-i> g,

" Alt-j: Move current line up (insert mode)
inoremap <m-j> <esc><m-j>a
" Alt-k: Move current line down (insert mode)
inoremap <m-k> <esc><m-k>a

" helpers for profiling
nnoremap <silent> <leader>dd :execute 'profile start ' . $TEMP . '/vim-profile.log'<CR>
    \ :execute 'profile func *'<CR>
    \ :execute 'profile file *'<CR>
nnoremap <silent> <leader>dp :exe ":profile pause"<cr>
nnoremap <silent> <leader>dc :exe ":profile continue"<cr>
nnoremap <silent> <leader>dq :exe ":profile pause"<cr>:noautocmd qall!<cr>

" To insert timestamp, press F3.
" nnoremap <F3> a<C-R>=strftime("%Y-%m-%d %a %I:%M %p")<CR><Esc>
" inoremap <F3> <C-R>=strftime("%Y-%m-%d %a %I:%M %p")<CR>
"
" If you search text then type :Filter, the results will be put in a scratch buffer.
" See http://vim.wikia.com/wiki/VimTip1063
command! -nargs=? Filter let @a='' | execute 'g/<args>/y A' | new | setlocal bt=nofile | put! a

" Reverse slashes
nnoremap <silent> <Leader>/ :let tmp=@/<Bar>s:\\:/:e<Bar>let @/=tmp<Bar>noh<CR>
nnoremap <silent> <Leader><Bslash> :let tmp=@/<Bar>s:/:\\:e<Bar>let @/=tmp<Bar>noh<CR>
" Useful if editing file that requires sudo to write.
if has('unix')
  command! -bar -nargs=0 SudoW :silent exe “write !sudo tee % >/dev/null” | silent edit!
endif


" Run program: current buffer (focused) is a program file; result is shown
" in new buffer. The output buffer is a scratch buffer and is reused for
" each run. It's never saved.

function! RunCommandInOutputBuffer(command)
  let filepath = expand('%:p')
  if empty(filepath)
    echo "Buffer not saved! Please save your file first."
    return
  endif

  if isdirectory(filepath)
    echo "Current buffer is a directory, not a file!"
    return
  endif

  " Change to the directory of the file
  execute 'cd ' . fnameescape(fnamemodify(filepath, ':h'))

  let l:cmd_str = a:command
  
  " If command mentions 'python' and venv is active, use venv python
  if exists('$VIRTUAL_ENV') && match(l:cmd_str, "python") >= 0
    " echom "Using venv python" 
    let l:cmd_str = $VIRTUAL_ENV . '/bin/python'
  endif

  let bufname = '__ProgramOutput__'
  let existing_bufnr = bufnr(bufname)

  " If buffer exists and is visible in a window, switch to it
  if existing_bufnr != -1 && bufwinnr(existing_bufnr) != -1
    execute bufwinnr(existing_bufnr) . 'wincmd w'
  " Else if buffer exists but not visible, open it in a split
  elseif existing_bufnr != -1
    execute 'sbuffer ' . existing_bufnr
  " Else buffer doesn't exist: create it
  else
    new
    setlocal buftype=nofile bufhidden=hide noswapfile
    execute 'silent keepalt file ' . bufname
  endif

  " Write output into buffer
  setlocal modifiable
  %delete _
  setlocal nomodified

  call append(0, 'Output of ' . filepath . ' at ' . strftime("%Y-%m-%d %H:%M:%S"))
  call append(1, repeat('=', len(getline(1))))
  " let cmd = a:command . ' ' . shellescape(filepath)
  let cmd = l:cmd_str . ' ' . shellescape(filepath)
  " echom "running " . cmd
  let output = systemlist(cmd)
  call append(2, output)

  normal! 3G
  setlocal nomodifiable nomodified
endfunction

nnoremap <leader>rp :call RunCommandInOutputBuffer('python3')<CR>
nnoremap <leader>rr :call RunCommandInOutputBuffer('ruby')<CR>
nnoremap <leader>rb :call RunCommandInOutputBuffer('bash')<CR>


" Font and colours -------------------------------

if has('nvim')
  if IsOnHost('portegez30-mint')
    set guifont=DejaVuSansMono\ Nerd\ Font\ Mono:h11
  else
    set guifont=DejaVuSansMono\ Nerd\ Font\ Mono:h9
  endif
elseif has("gui_running")
  if has("win32")
    set gfn=DejaVuSansMono_NFM:h9:cANSI
  elseif has('macunix')
    set guifont=DejaVuSansMNF:h13
  elseif has('unix')
    if IsOnHost('portegez30-mint')
      set guifont=DejaVuSansMono\ Nerd\ Font\ Mono\ 11
    else
      set guifont=DejaVuSansMono\ Nerd\ Font\ Mono\ 9
    endif
  endif

else
  set termguicolors
  " the font is set in the terminal emulator
  " set gfn=DejaVuSansMono_NF:h9:cANSI
endif

" color scheme  -----------------------------------------------------------------
" colorscheme deep-onyx
colorscheme catppuccin_macchiato
" override some settings for colorscheme catppuccin_macchiato

hi SpellBad gui=undercurl guisp=red guibg=bg guifg=fg
hi SpellLocal gui=undercurl guisp=red guibg=bg guifg=fg
hi SpellCap gui=undercurl guisp=red guibg=bg guifg=fg
hi SpellRare gui=undercurl guisp=red guibg=bg guifg=fg

" Search
hi IncSearch    gui=NONE guifg=#000000 guibg=#FF8000
hi Search    gui=NONE guifg=#000000 guibg=#FFFF80
hi Comment      gui=ITALIC  guifg=#A0A0A0 guibg=NONE

" Cursor
hi Cursor       gui=NONE guifg=#000000 guibg=#FF8000
hi lCursor       gui=NONE guifg=#000000 guibg=#FF8000
hi CursorIM       gui=NONE guifg=#000000 guibg=#FF8000

hi MatchParen  gui=NONE guifg=#000000 guibg=#FFFF80 

" Status line -----------------------------------------------------------------

set laststatus=2                               " make status line always appear
set statusline=%F%m%r%h%w\[%{strlen(&ft)?&ft:'none'}]\ (%{&ff}/%Y)\ %=line\ %l\/%L,\ col\ %c:\ 0x%-8B\ %<%P

" Show line number, cursor position.
set ruler

let g:prev_lcd = ''

function! UpdateVenvOnBuf()
  let l:cur = expand('%:p:h')
  if l:cur !=# g:prev_lcd
    silent! lcd %:p:h
    call ActivateVenv()
    let g:prev_lcd = l:cur
  endif
endfunction

" Save the original PATH on startup
let g:original_path = $PATH

function! ActivateVenv()
  " Find the nearest .venv in the current directory or parents
  let l:venv = finddir('.venv', '.;')

  if !empty(l:venv)
    let l:venv_path = fnamemodify(l:venv, ':p')
    let l:venv_bin  = l:venv_path . '/bin'
    let l:python    = l:venv_bin . '/python'

    " Update shell environment
    let $PATH = l:venv_bin . ':' . g:original_path
    let $VIRTUAL_ENV = l:venv_path

    " Only reconfigure coc if the venv changed
    if get(g:, 'current_venv', '') !=# l:venv_path
      let g:current_venv = l:venv_path
      let g:coc_python_path = l:python
      silent! call coc#rpc#restart()
    endif

  else
    " No venv found; reset environment
    let $PATH = g:original_path
    unlet! $VIRTUAL_ENV

    " Only reset coc if we previously had a venv
    if exists('g:current_venv')
      unlet g:current_venv
      let g:coc_python_path = exepath('python3')
      silent! call coc#rpc#restart()
    endif
  endif
endfunction

" Call on Vim startup
autocmd VimEnter * call ActivateVenv()

" This doesn't seem to work; try alternative. Now re-instated as least bad option until further investigation.
" Some plugins don't like this. Use alternative
" set autochdir " current directory is always matching the content of the active window
" autocmd! BufEnter * silent! lcd %:p:h
autocmd BufEnter * call UpdateVenvOnBuf()

" Plugins -----------------------------------------------------------------
"
" Plugins are defined in plugins.vim and initialised in configure-plugins.vim in the after 
" folder. Here we do the plugin pre-load stuff. 

" ---------------
" Easytags
" ---------------
if has("win32")
  set tags=~\.vim\vimtags;c:\apps\ruby\2.0-64\tags
  let g:easytags_cmd = "C:\\apps\\ctags58\\ctags.exe"
else
  set tags=~/.vim/vimtags
end

" ---------------
" vim-airline
" ---------------
" if exists("g:loaded_airline")
" add tab bar at top to show opened files
if exists('g:started_by_firenvim') && g:started_by_firenvim
  let g:airline#extensions#tabline#enabled = 0
else
  let g:airline#extensions#tabline#enabled = 1
end

let g:airline_powerline_fonts = 1
" let g:airline#extensions#tabline#formatter = 'unique_tail_improved'
let g:airline#extensions#tabline#formatter = 'unique_tail'
" wordcount can slow down opening large text files
let g:airline#extensions#wordcount#enabled = 0
" let g:airline_theme='bubblegum2'
" let g:airline_theme='wombat2'
" let g:airline_theme='molokai'
let g:airline_theme = 'catppuccin_macchiato'

" percent/total lines/current line/current column/hex character code
" let g:airline_section_z = '%3p%% %L/%#__accent_bold#%4l%#__restore__#:%3c 0x%-3B'
" percent current-line/total-lines : current-column 0x hex-character-code
let g:airline_section_z = '☰ %3p%% %#__accent_bold#%l%#__restore__#/%L :%#__accent_bold#%3c%#__restore__# 0x%-3B'

" Add character value (%B in hex) to status line"
let s:def_statusline = '%3p%% %L/%#__accent_bold#%4l%#__restore__#:%3c 0x%-3B'
" endif


" End of vimrc =====================================================================
