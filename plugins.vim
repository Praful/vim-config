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

" automate installation of vimplug
"
" let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob($PK_VIMFILES . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.$PK_VIMFILES.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin($PK_VIMFILES.'/vimplug')

" Navigation ------------------------------------------------------
"
Plug 'Lokaltog/vim-easymotion'

" After install, turn shell ~/.vim/bundle/vimproc, (n,g)make -f your_machines_makefile
" Plug 'Shougo/vimproc', {'do': 'make'}

Plug 'xolox/vim-easytags'
"required by vim-session
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

" Commands ------------------------------------------------------
" <leader>K to invoke
" Plug 'beloglazov/vim-online-thesaurus'
Plug 'ron89/thesaurus_query.vim'

" Plug 'rhysd/vim-grammarous'

" must set before calling plugin
"  disable default mappings
let g:NERDCreateDefaultMappings = 0
" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1
Plug 'scrooloose/nerdcommenter'

Plug 'tpope/vim-surround'
" Plug 'tpope/vim-fugitive'
Plug 'sickill/vim-pasta'
" vim-speeddating:  use CTRL-A/CTRL-X to increment dates, times etc
Plug 'tpope/vim-speeddating'
" Plug "atweiden/vim-dragvisuals")

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

Plug 'pbogut/fzf-mru.vim'

" Bbye allows you to delete buffers (close files) without closing your windows or messing up your layout.
Plug 'moll/vim-bbye'

" Load for gvim only.
" For vim, session changes the position so gvim appears in a different place; also if
" gvim is open and vim is opened, vim gets messages about swap files.
" For nvim the same applies as vim but it's worse because after nvim is used in browser with 
" firenvim, the session manager sets the windows to whatever the text area was
" and this results in nvim taking on the same dimensions in the terminal
if has('gui_running') && !has('nvim')
  " Plug 'xolox/vim-session', has('vim') ? {} : {'on': []}
  Plug 'xolox/vim-session'
endif
" Plug 'xolox/vim-session'
" Plug 'tpope/vim-obsession'

"automatic closing of quotes, parentheses, etc
Plug 'Raimondi/delimitMate'

" General language plugins ------------------------------------------------------ 

" Like Github copilot
"   Clear current suggestion C-]
"   Next suggestion	<M-]
"   Previous suggestion	<M-[
"   Insert suggestion	<Tab>
"   Manually trigger suggestion	<M-Bslash>
Plug 'Exafunction/codeium.vim', { 'branch': 'main' }

" Not fast enough yet (comment out for now)
" Setup:
"     sudo docker run --entrypoint /opt/tabby/bin/tabby-cpu -it -p 8080:8080 -v $HOME/.tabby:/data tabbyml/tabby serve --model StarCoder-1B 
"     To stop server: sudo docker stop <container id>  (use docker ps to find container id)
"     Get token from http://localhost:8080/
"     In ~/.tabby-client/agent/config.toml, add section [server] with token.
"
" Plug 'TabbyML/vim-tabby'
" Tabby plugin will not show inline completion automatically, you can trigger the completion manually by pressing <C-\>.
" let g:tabby_trigger_mode = 'manual'
" let g:tabby_keybinding_accept = '<C-F9>'
" let g:tabby_node_binary = '$HOME/.config/nvm/versions/node/v21.5.0/bin/node'

" Plug 'madox2/vim-ai'

" Plug 'sheerun/vim-polyglot'
Plug 'vim-autoformat/vim-autoformat'

Plug 'fladson/vim-kitty'

Plug 'tpope/vim-dispatch'

" Install nightly build, replace ./install.sh with install.cmd on windows
Plug 'neoclide/coc.nvim', {'branch': 'release'}


" <leader>j  - Norma/visual: go to any variable/class/constant/name/symbol 
" <leader>ab - Normal mode: open previous opened file (after jump)
" <leader>al - Normal mode: open last closed search window again
" More help: https://github.com/pechorin/any-jump.vim
" Plug 'pechorin/any-jump.vim'

" Python ------------------------------------------------------
" this was temperamental; replace with vim-slime, which works in kitty
" Plug 'jupyter-vim/jupyter-vim'


" General language plugins ------------------------------------------------------

" sends selected text to terminal; doesn't need to be in any mode
Plug 'jpalardy/vim-slime'

" rainbow parentheses
Plug 'luochen1990/rainbow'
let g:rainbow_active = 1 "set to 0 if you want to enable it later via :RainbowToggle

" colourises #123456 codes
Plug 'chrisbra/Colorizer'

" Ruby ------------------------------------------------------
Plug 'vim-ruby/vim-ruby', {'for': 'ruby'}

" Give text-objects ar and ir eg car to change all block, dir to delete inner block.
" See https://github.com/nelstrom/vim-textobj-rubyblock
Plug 'nelstrom/vim-textobj-rubyblock', {'for':'ruby'}
Plug 'lucapette/vim-ruby-doc', {'for':'ruby'}

"Run Ruby program
"<leader>r runs current file or selected lines - no need to save file.
Plug 'hlissner/vim-forrestgump', {'for':'ruby'}

" Ruby style checker
Plug 'ngmy/vim-rubocop', {'for':'ruby', 'on':'RuboCop'}

" Run ruby commands selectively 
Plug 't9md/vim-ruby-xmpfilter', {'for':'ruby'}

" add "end" after typing "begin" in Ruby.
Plug 'vim-scripts/endwise.vim', {'for': 'ruby'}
"
"   JavaScript ------------------------------------------------------
Plug 'pangloss/vim-javascript', {'for':'javascript'}
" Plug 'neoclide/vim-jsx-improve', {'for':'jsx'}
Plug 'leshill/vim-json', {'for':'json'}
" Plug 'w0rp/ale'

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
Plug 'JuliaEditorSupport/julia-vim'
"PowerShell highlighting/help
" Plug 'PProvost/vim-ps1', {'for': 'powershell'}


" Plug 'romainl/vim-devdocs'

" Matching  ------------------------------------------------------
"
" See https://github.com/wellle/targets.vim
Plug 'wellle/targets.vim'

"https://github.com/andymass/vim-matchup#detailed-feature-documentation
Plug 'andymass/vim-matchup'
Plug 'kana/vim-textobj-user'

" Column text object eg
" vic   Visually select a column.
" cic   Change a column.
" dac   Delete a column.
" vicI  Prepend new text to a column.
" vicA  Append new text to a column.
" viC   Visually select a WORD based colunn.
" Plug 'coderifous/textobj-word-column.vim'

" <count>ai	An Indentation level and line above. eg 2vai
" <count>ii	Inner Indentation level (no line above).
" <count>aI	An Indentation level and lines above/below.
" eg >ii indents current level; vii selects current level;
" >ai indents currrent level and line and above.
Plug 'michaeljsmith/vim-indent-object'

" Plug 'nelstrom/vim-visual-star-search', {'for': 'ruby'}

Plug 'tpope/vim-unimpaired'

" search/replace highlighting
Plug 'markonm/traces.vim'

" Libraries ------------------------------------------------------
Plug 'vim-scripts/L9'
Plug 'tpope/vim-repeat'

" Plug 'mattn/webapi-vim'

" makes textboxes in firefoxa and chrome run nvim;
" load for nvim only since it doesn't work with vim
" See https://github.com/junegunn/vim-plug/wiki/tips
Plug 'glacambre/firenvim', has('nvim') ? { 'do': { _ -> firenvim#install(0) } } : {'on': []}

call plug#end()
