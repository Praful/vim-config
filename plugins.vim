"=============================================================================
" File: plugins.vim
" Description: Defines plugins to be loaded after vimrc executes but before 
"              configure-plugins.vim.
" Author: Praful https://github.com/Praful/vim-config
" Licence: GPL v3
" Convention: Indented Plug statements denote dependency for previous unindented 
"             statment.
"
" The plugin manager has changed from using vundle to neobundle to dein and now 
" vim-plug, which is simple and just works (so far!).
"=============================================================================


call plug#begin($PK_VIMFILES.'/vimplug')

" Navigation ------------------------------------------------------
"
Plug 'Lokaltog/vim-easymotion'

" Plug 'Shougo/denite.nvim'
" Plug 'Shougo/deoplete.nvim'
" Not implemented yet
" Plug 'Shougo/deoppet.nvim'

Plug 'Shougo/defx.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'

" Plug 'Shougo/neoyank.vim'
" Plug 'Shougo/neomru.vim'

" After install, turn shell ~/.vim/bundle/vimproc, (n,g)make -f your_machines_makefile
Plug 'Shougo/vimproc', {'do': 'make'}

Plug 'xolox/vim-easytags'
Plug 'xolox/vim-misc'
Plug 'xolox/vim-shell'

" This has to be installed manually. See
" http://vim-taglist.sourceforge.net/installation.html
" Plug 'taglist.vim'
"
" Use BD, BU, BW to remove buffer without closing window
Plug 'qpkorr/vim-bufkill'

" UI Additions ------------------------------------------------------
Plug 'bling/vim-airline'

" Open File Explorer or command prompt using gof/got (file's dir) or goF/goT (working 
" dir)
Plug 'justinmk/vim-gtfo'

" Commands ------------------------------------------------------
" <leader>K to invoke
" Plug 'beloglazov/vim-online-thesaurus'
Plug 'ron89/thesaurus_query.vim'

Plug 'rhysd/vim-grammarous'

" Plug 'vim-scripts/YankRing.vim'

Plug 'scrooloose/nerdcommenter'
Plug 'tpope/vim-surround'
" Plug 'tpope/vim-fugitive'
Plug 'sickill/vim-pasta'
" vim-speeddating:  use CTRL-A/CTRL-X to increment dates, times etc
Plug 'tpope/vim-speeddating'
" Plug "atweiden/vim-dragvisuals")

Plug 'junegunn/fzf', { 'do': './install --all' } | Plug 'junegunn/fzf.vim'

" Plug 'pbogut/fzf-mru.vim'

" Bbye allows you to delete buffers (close files) without closing your windows or messing up your layout.
Plug 'moll/vim-bbye'

" Automatic Helpers ------------------------------------------------------
" https://github.com/mhinz/vim-grepper/wiki/example-configurations-and-mappings
Plug 'mhinz/vim-grepper', { 'on': ['Grepper', '<plug>(GrepperOperator)'] }

"Tells you where you search: at match n out of m matches. Freeze plugin because it 
"overwrites \\. We're not missing any updates: plugin was last updated 9 years ago.
"Update: no longer frozen because I've put post-plugin config in 
"configure-plugins.vim
" Plug 'vim-scripts/IndexedSearch', {'frozen': 'on'}
Plug 'vim-scripts/IndexedSearch'

Plug 'xolox/vim-session'
" Plug 'tpope/vim-obsession'

"automatic closing of quotes, parentheses, etc
Plug 'Raimondi/delimitMate'

" General language plugins ------------------------------------------------------ 
Plug 'sheerun/vim-polyglot'

" unit testing
Plug 'janko-m/vim-test'

Plug 'tpope/vim-dispatch'

" Install nightly build, replace ./install.sh with install.cmd on windows
" Plug 'neoclide/coc.nvim', {'do': './install.cmd nightly'}
" Or install latest release tag
" Plug 'neoclide/coc.nvim', {'tag': '*', 'do': './install.cmd'}
" Or build from source code
" Plug 'neoclide/coc.nvim', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" Plug 'neoclide/coc.nvim', {'tag': '*', 'do': { -> coc#util#install()}} 
" Plug 'yatli/coc-powershell', {'do': { -> coc#powershell#install()} }

" To install Coc extensions, use
"   :CocInstall coc-tsserver
"   :CocInstall coc-html
"   :CocInstall coc-css
"   :CocInstall coc-json
"   :CocInstall coc-emmet
"   :CocInstall coc-python (don't install if pyright installed)
"   :CocInstall coc-pyright (alternative to coc-python)
"   :CocInstall coc-powershell
"   :CocInstall coc-lists
"   :CocInstall coc-yank
"or
"   :CocInstall coc-tsserver coc-html coc-css coc-json coc-emmet coc-python coc-powershell coc-lists coc-yank coc-spell-checker coc-pyright

" <leader>j  - Norma/visual: go to any variable/class/constant/name/symbol 
" <leader>ab - Normal mode: open previous opened file (after jump)
" <leader>al - Normal mode: open last closed search window again
" More help: https://github.com/pechorin/any-jump.vim
Plug 'pechorin/any-jump.vim'

" Python ------------------------------------------------------
" Install following Python modules:
"   pip install ubelt
"   pip install pyperclip
" Plug 'sjl/badwolf'
" Plug 'Erotemic/vimtk'

" Ruby ------------------------------------------------------
Plug 'vim-ruby/vim-ruby', {'for': 'ruby'}

" Give text-objects ar and ir eg car to change all block, dir to delete inner block.
" See https://github.com/nelstrom/vim-textobj-rubyblock
Plug 'nelstrom/vim-textobj-rubyblock', {'for':'ruby'}
" Plug 'ecomba/vim-ruby-refactoring'
Plug 'lucapette/vim-ruby-doc', {'for':'ruby'}

"Run Ruby program
"<leader>r runs current file or selected lines - no need to save file.
Plug 'hlissner/vim-forrestgump', {'for':'ruby'}

" Ruby style checker
Plug 'ngmy/vim-rubocop', {'on':'RuboCop'}

" Run ruby commands selectively 
Plug 't9md/vim-ruby-xmpfilter', {'for':'ruby'}

" https://github.com/zweifisch/pipe2eval - REPL in Vim for Ruby, JS, and other
" languages.
" Press v<space> to evaluate current line, vip<space> to evaluate a paragraph.
" Removed: doesn't work on Windows.
" Plug 'zweifisch/pipe2eval'
"
" add "end" after typing "begin" in Ruby.
Plug 'vim-scripts/endwise.vim', {'for': 'ruby'}
"
"   JavaScript ------------------------------------------------------
Plug 'pangloss/vim-javascript', {'for':'javascript'}
" Plug 'neoclide/vim-jsx-improve', {'for':'jsx'}
Plug 'leshill/vim-json', {'for':'json'}
Plug 'w0rp/ale'

Plug 'leshill/vim-json', {'for':['javascript','json']}
Plug 'leafgarland/typescript-vim', {'for':'typescript'}

"   HTML ------------------------------------------------------
" Plug 'nono/vim-handlebars',  {'autoload':{'filetypes':['html', 'htm']}})
" use <c-y>comma to complete expression eg html:5<c-y>,
" Plug 'mattn/emmet-vim'
Plug 'othree/html5.vim',  {'for':['html', 'htm']}
Plug 'vim-scripts/indenthtml.vim',  {'for':['html', 'htm']}

Plug 'hail2u/vim-css3-syntax', {'for':['css','scss','sass']}

"   Other Languages ------------------------------------------------------
"Plug 'msanders/cocoa.vim'
"Plug 'mutewinter/taskpaper.vim'
"Plug 'mutewinter/nginx.vim'
"Plug 'timcharper/textile.vim'
"Plug 'mutewinter/vim-css3-syntax'
"Plug 'acustodioo/vim-tmux'
"Plug 'mutewinter/vim-markdown'
"Plug 'groenewege/vim-less'
"Plug 'wavded/vim-stylus'
"Plug 'tpope/vim-cucumber'

"PowerShell highlighting/help
Plug 'PProvost/vim-ps1', {'for': 'powershell'}

" Plug 'Shougo/echodoc.vim'

" Plug 'romainl/vim-devdocs'

" Matching  ------------------------------------------------------
"
" See https://github.com/wellle/targets.vim
Plug 'wellle/targets.vim'

Plug 'vim-scripts/matchit.zip'
Plug 'kana/vim-textobj-user'

" Column text object eg
" vic   Visually select a column.
" cic   Change a column.
" dac   Delete a column.
" vicI  Prepend new text to a column.
" vicA  Append new text to a column.
" viC   Visually select a WORD based colunn.
Plug 'coderifous/textobj-word-column.vim'

" <count>ai	An Indentation level and line above.
" <count>ii	Inner Indentation level (no line above).
" <count>aI	An Indentation level and lines above/below.
Plug 'michaeljsmith/vim-indent-object'

Plug 'nelstrom/vim-visual-star-search', {'for': 'ruby'}

Plug 'tpope/vim-unimpaired'

" search/replace highlighting
Plug 'markonm/traces.vim'
" coloured brackets
" Plug 'luochen1990/rainbow'

" Libraries ------------------------------------------------------
Plug 'vim-scripts/L9'
Plug 'tpope/vim-repeat'

Plug 'mattn/webapi-vim'

" makes textboxes in firefoxa and chrome run nvim;
" this sort of worked but I need to add more conditional logic
" in vimrc to differentiate between when firenvim is being 
" loaded.
" Plug 'glacambre/firenvim', { 'do': { _ -> firenvim#install(0) } }

call plug#end()
