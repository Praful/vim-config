"=============================================================================
"
" File: configure-plugins.vim
" Description: Set mappings, etc once plugins have been loaded. 
"              Plugin pre-load work is done in vimrc.
" Author: Praful https://github.com/Praful/vim-config
" Licence: GPL v3
"=============================================================================

let g:airline#extensions#searchcount#enabled = 0
" * enable/disable coc integration >
let g:airline#extensions#coc#enabled = 1
" * change error symbol: >
let airline#extensions#coc#error_symbol = 'E:'
" * change warning symbol: >
let airline#extensions#coc#warning_symbol = 'W:'
" * enable/disable coc status display >
let g:airline#extensions#coc#show_coc_status = 1
" * change the error format (%C - error count, %L - line number): >
let airline#extensions#coc#stl_format_err = '%C(L%L)'
" * change the warning format (%C - error count, %L - line number): >
let airline#extensions#coc#stl_format_warn = '%C(L%L)'

" https://github.com/andymass/vim-matchup#deferred-highlighting
let g:matchup_matchparen_deferred = 1
let g:matchup_delim_stopline      = 5000000 " generally
let g:matchup_matchparen_stopline = 5000000  " for match highlighting only
let g:matchup_matchparen_timeout = 5000
let g:matchup_matchparen_insert_timeout = 2500

" ---------------
" FZF MRU
" ---------------
let g:fzf_mru_case_sensitive = 0

" ---------------
" netrw
" ---------------
"  don't load netrw
let g:netrw_liststyle=3
let g:loaded_netrw= 1
let g:netrw_loaded_netrwPlugin= 1


" ---------------
" Speeddating
" ---------------
if exists("g:loaded_speeddating")
  " 20131105 - now hooked to speeddating in ~\vimfiles\after\plugin\speeddating.vim
  " +/-: Increment number
  " nnoremap + <c-a>
  " nnoremap - <c-x>
  " Disable default key mappings
  let g:speeddating_no_mappings=1
  SpeedDatingFormat %d%[/-]%m%1%Y
  "dd/mm/yyyy hh:mm:ss [timezone] = SQL format 
  SpeedDatingFormat %d%[/-]%m%1%Y%[ T_-]%H:%M:%S%?[Z]  

  " Define some aliases. Defaults to ^A/^X
  nmap  +     <Plug>SpeedDatingUp
  nmap  -     <Plug>SpeedDatingDown

  vmap  +     <Plug>SpeedDatingUp
  vmap  -     <Plug>SpeedDatingDown
endif

" ---------------
" Easytags
" ---------------

if exists("g:loaded_easytags")
  " Tell taglist where Exuberant Tags is installed and map F8 to toggle tag list
  "
  " on and off.
  if has("win32")
    let Tlist_Ctags_Cmd="C:\\apps\\ctags58\\ctags.exe"
  else
    let Tlist_Ctags_Cmd="/usr/local/Cellar/ctags/5.8/bin/ctags"
  end

  let Tlist_GainFocus_On_ToggleOpen=1
  let Tlist_Use_Right_Window = 1
  let Tlist_Close_On_Select = 1
  noremap <leader>tt :TlistToggle<CR>
  "Easytags (enables CTRL=] and CTRL-T) by autotagging
  "set tags=./.tags;,~/.vimtags

  " enable async mode
  let g:easytags_async = 1

  " Allow project specific tags
  " let g:easytags_dynamic_files = 1

  " disable autoupdate
  " let g:easytags_auto_update = 0
  "   use local tag files instead of the global .vimtags
  "let g:easytags_dynamic_files = 1
  "k
  "   enable/disable highlighting
  let g:easytags_auto_highlight = 1
  set updatetime=10000
  "Disable autosync between program and tag list. Commented out for now to see if
  "python version speeds it up.
  "let g:easytags_on_cursorhold = 0
  "Update tag list when file is saves
  "let g:easytags_events = ['BufWritePost']
  " let g:easytags_by_filetype="~/.vim/easytags"
  let g:easytags_python_enabled = 1

  highlight MyTagListFileName guifg=black guibg=orange
  " title eg Function, Method, etc
  highlight MyTagListTitle gui=bold guifg=#92d4ff
endif


" ---------------
" Bufkill
" ---------------
"close current buffer - use uppercase bufkill plugin command to close buffer without
"closing window
" noremap <leader>q :BD<CR>
nnoremap Q :BD<CR>


" ---------------
" Unimpaired
" ---------------
if exists("g:loaded_unimpaired")
  "Provide aliases for moving lines up/down (m=meta key, which on Windows is Alt)
  nmap <m-k> [e
  nmap <m-j> ]e
  vmap <m-k> [egv
  vmap <m-j> ]egv
endif


" Enable omni completion.

" if has("autocmd")
  " augroup PK4
    " autocmd!
    " autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
    " autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
    " autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
    " autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
    " autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
    " autocmd FileType ruby,eruby setlocal omnifunc=rubycomplete#Complete
  " augroup END
" end

" ---------------
" Ruby
" ---------------
" Execute current buffer as ruby
" This is replaced by forrestgump plugin, which uses <leader>r to run file or selected lines.
"map <leader>rr :w !ruby<CR>map <S-r> :w !ruby<CR>
if has("autocmd")
  augroup PK1
    autocmd!
    autocmd FileType ruby,eruby let g:rubycomplete_buffer_loading = 1
    autocmd FileType ruby,eruby let g:rubycomplete_rails = 1
    autocmd FileType ruby,eruby let g:rubycomplete_classes_in_global = 1

    " Set ruby compiler
    autocmd FileType ruby compiler ruby
  augroup END
endif

" For the vim ruby do plugin, set the command to run a command.
"- RB for Ruby
"- RS for RSpec
"- RR for Rails
let g:ruby_doc_command='explorer.exe '
let ruby_operators = 1

" ---------------
" Shell
" ---------------
" F11 puts vim in full screen; hide menu and toolbar (e hides the tabs)
let g:shell_fullscreen_items='mT'
" disable always on top
let g:shell_fullscreen_always_on_top = 0

" ---------------
" Session
" ---------------
set sessionoptions=resize,winpos,winsize,curdir,folds,help,tabpages,buffers

let g:session_autoload = 'yes'
let g:session_autosave = 'yes'
let g:session_autosave_periodic = 5
let g:session_autosave_silent = "yes"
let g:session_lock_enabled = 0
"
" ---------------
" NERDCommenter
" ---------------

" Note: to set NERDCommenter global vars, do before initialising plugin in 
" plugins.vim
"
"Toggle comments
"https://vi.stackexchange.com/questions/26611/is-it-possible-to-map-control-forward-slash-with-vim
"https://stackoverflow.com/questions/9051837/how-to-map-c-to-toggle-comments-in-vim
nmap <C-/>   <Plug>NERDCommenterToggle
vmap <C-/>   <Plug>NERDCommenterToggle<CR>gv

" ---------------
" Bbye (Buffer Bye)
" ---------------
nnoremap <Leader>bd :Bdelete<CR>

" ---------------
" vim-plug
" ---------------
nnoremap <Leader>bi :PlugInstall<cr>
nnoremap <Leader>bu :PlugUpdate<cr>
"Upgrade plug-in manager
nnoremap <Leader>bp :PlugUpgrade<cr>
" Run :PlugClean. It will detect and remove undeclared plugins.
nnoremap <Leader>bc :PlugClean<cr>

" ---------------
" Search Google using gs
" See https://vi.stackexchange.com/questions/9001/how-do-i-search-google-from-vim
" ---------------
let g:search_engine = "https://www.google.co.uk/search?q="

function! GoogleSearch()
  let searchterm=@x
  let cmd =  "!" . "\"" . Browser() . "\"" . " \"" . g:search_engine . searchterm . "\" "
  " echom "cmd=".cmd
  execute(cmd)
endfunction

" Remove all newlines
function! Chomp(string)
    return substitute(a:string, '\n\+$', '', '')
endfunction


" Paste current word or selection in x register
noremap gs "xyiw<Esc> :silent! :call GoogleSearch()<CR>
vnoremap gs "xy<Esc>  :silent! :call GoogleSearch()<CR>

function! FileExists(f)
  return filereadable(a:f)
endfunction

function! Browser()
  "NB: the dot below is a string concatenation operator.
  let browsers = [($LOCALAPPDATA."/Google/Chrome/Application/chrome.exe"), "C:/Program Files (x86)/Google/Chrome/Application/chrome.exe", "C:/Program Files (x86)/Internet Explorer/iexplore.exe"]

  for prog in browsers
    "echoerr prog
    if FileExists(prog)
      return prog
    endif
  endfor

  " echom "No browser found."
  return ""

endfunction
"
" ---------------
" ALE
" ---------------
let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\   'javascript': ['eslint'],
\}

" Enable completion where available.
let g:ale_completion_enabled = 1

" check JSX files with stylelint and eslint
augroup FiletypeGroup
    autocmd!
    au BufNewFile,BufRead *.jsx setlocal filetype=javascript.jsx
augroup END
let g:ale_linters = {'jsx': ['stylelint', 'eslint']}
let g:ale_linter_aliases = {'jsx': 'css'}

" ---------------
" Easymotion
" ---------------
if exists("g:EasyMotion_loaded")
  " noremap <leader>s <Plug>(easymotion-S)

  " Set colour for target letter and background.
  " hi link EasyMotionTarget IncSearch
 hi EasyMotionTarget guifg=red
  " hi EasyMotionShade  guifg=#FFFF80

  " nnoremap <Leader> <Plug>(easymotion-prefix)
  let g:EasyMotion_do_mapping = 0 " Disable default mappings
  nmap s <Plug>(easymotion-overwin-f)

  " Ignore case unless uppercase character specified.
  let g:EasyMotion_smartcase = 1

  " select lines usng c<leader><leader>l - c can be replaced by d, v, or y)
  " use p instead of l to act on two random points instead of the whole line.
  " let g:EasyMotion_do_special_mapping = 1
endif

" ---------------
" Send to terminal
" ---------------
" Calls SlimeConfig then makes the setting the same for all buffers and 
" doesn't ask again.
function! CustomSlimeConfig()
  SlimeConfig
  let g:slime_dont_ask_default = 1
  let g:slime_default_config = b:slime_config
  " echo "SlimeConfig executed"
endfunction

nnoremap <F2> :call CustomSlimeConfig()<CR>

" set deafult kitty tab for slime output from env vars; assumes vim launched from 
" that kitty tab so that the env vars are set 
let g:slime_default_config = {'window_id': $KITTY_WINDOW_ID, 'listen_on': $KITTY_LISTEN_ON}
let g:slime_dont_ask_default = 1
" disable default slime mapping
let g:slime_no_mappings = 1
let g:slime_target = "kitty"
let g:slime_bracketed_paste = 1
nmap <silent> <C-ENTER> :SlimeSendCurrentLine<cr>
" send selected text to terminal
xmap <silent> <C-ENTER> <Plug>SlimeRegionSend

" Previousl used jupyter-vim; replaced by slime above
" jupyter-vim: Send current line to jupyter console 
" nnoremap <buffer> <silent> <F3> :JupyterSendCode getline('.')<CR>
"
" let g:jupyter_highlight_cells=1
" let g:jupyter_cell_separators=''

" nnoremap <silent> <F2> :JupyterConnect<CR>
" nnoremap <silent> <C-ENTER> :JupyterSendCode getline('.')<CR>
" vmap <silent> <C-ENTER> <plug>JupyterRunVisual
"
" ---------------
" vim-dragvisual
" ---------------
" Block dragging mappings
" runtime dragvisuals.vim
" vmap   <expr> H  DVB_Drag('left')
" vmap   <expr> L  DVB_Drag('right')
" vmap   <expr> J  DVB_Drag('down')
" vmap   <expr> K  DVB_Drag('up')
" vmap   <expr> D  DVB_Duplicate()
"
" ---------------
"  LLMs:
"
"
" codeium
"
" disable tab mapping since coc uses it
let g:codeium_no_map_tab = v:true
" use c-o, which we also use in zsh to accept suggestion
imap <script><silent><nowait><expr> <C-o> codeium#Accept()

" Set URL of Tabby server
" didn't work well; try again when it matures
" let g:tabby_server_url = 'http://127.0.0.1:8080'
" let g:tabby_accept_binding = '<C-O>'
" let g:tabby_dismiss_binding = '<C-]>'

" vim_ai
" https://github.com/madox2/vim-ai?tab=readme-ov-file

" :AIChat works but is very slow. Disable for now.
" let g:vim_ai_chat = {
"
" \  "options": {
" \    "model": "gpt-3.5-turbo",
" \    "endpoint_url": "http://localhost:8080/v1/chat/completions",
" \    "temperature": 1,
" \    "enable_auth": 0,
" \    "max_tokens": 50, 
" \		 "request_timeout": 20,
" \  },
" \  "ui": {
" \    "code_syntax_enabled": 1,
" \    "populate_options": 0,
" \    "open_chat_command": "preset_below",
" \    "scratch_buffer_keep_open": 0,
" \    "paste_mode": 1,
" \  },
" \}
" let g:vim_ai_complete = {
" \  "engine": "complete",
" \  "options": {
" \    "model": "gpt-3.5-turbo-instruct",
" \    "endpoint_url": "http://localhost:8080/v1/completions",
" \    "max_tokens": 50,
" \    "temperature": 0.1,
" \    "request_timeout": 20,
" \    "enable_auth": 0,
" \    "selection_boundary": "#####",
" \  },
" \  "ui": {
" \    "paste_mode": 1,
" \  },
" \}

" let g:vim_ai_edit = {
" \  "engine": "complete",
" \  "options": {
" \    "model": "gpt-3.5-turbo-instruct",
" \    "endpoint_url": "http://localhost:8080/v1/completions",
" \    "max_tokens": 50,
" \    "temperature": 0.1,
" \    "request_timeout": 20,
" \    "enable_auth": 0,
" \    "selection_boundary": "#####",
" \  },
" \  "ui": {
" \    "paste_mode": 1,

" \  },
" \}

" ---------------
" coc
" ---------------


"   :CocInstall coc-tsserver coc-html coc-css coc-json coc-emmet coc-powershell coc-lists coc-yank coc-spell-checker coc-pyright
"removed coc-powershell because of the persistent terminal window.
"removed coc-spell-checker because of the constant prompts in irrelevant files
"replace coc-python with coc-pyright
let g:coc_global_extensions = ['coc-html', 'coc-pyright', 'coc-css', 'coc-json']
" TODO add extensions from below list
" let g:coc_global_extensions = ['coc-html', 'coc-pyright', 'coc-css', 'coc-json', 'coc-emmet', 'coc-tsserver',  'coc-flutter', 'coc-solargraph']

" let g:node_client_debug = 1

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
set signcolumn=yes

" Update time for linting
set updatetime=300


" Settings copied from coc help :h coc-completion-example

inoremap <silent><expr> <C-j> coc#pum#visible() ? coc#pum#next(1) : "\<C-j>"
inoremap <silent><expr> <C-k> coc#pum#visible() ? coc#pum#prev(1) : "\<C-k>"

inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation
nmap <silent> gd <Plug>(coc-definition)
" nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" show methods; also ,t and ,T for tags from FZF
nmap <silent> gm :CocList outline methods<cr>
" show symbols in all indexed files
nmap <silent> ga :CocList symbols<cr>

" Use K to show documentation in preview window
nnoremap <silent> gh :call ShowDocumentation()<CR>

function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('gh', 'in')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming
nmap <leader>rn <Plug>(coc-rename)
" Use K to show documentation in preview window
"
augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s)
  autocmd FileType python,typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end


" Remap keys for applying refactor code actions
nmap <silent> <leader>re <Plug>(coc-codeaction-refactor)
xmap <silent> <leader>r  <Plug>(coc-codeaction-refactor-selected)
nmap <silent> <leader>r  <Plug>(coc-codeaction-refactor-selected)

" Run the Code Lens action on the current line
nmap <leader>cl  <Plug>(coc-codelens-action)

" Add (Neo)Vim's native statusline support
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline
" set statusline+=%3{codeium#GetStatusString()}
set statusline+=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings for CoCList
" Show all diagnostics
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions
nnoremap <silent><nowait> <space>ce  :<C-u>CocList extensions<cr>
" Show commands
nnoremap <silent><nowait> <space>cc  :<C-u>CocList commands<cr>
" Find symbol of current document
nnoremap <silent><nowait> <space>co  :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent><nowait> <space>cs  :<C-u>CocList -I symbols<cr>
" Do default action for next item
" nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item
" nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list
" nnoremap <silent><nowait> <space>cp  :<C-u>CocListResume<CR>



" Issue of persistent floating windows. Press ESC twice to remove
" https://www.reddit.com/r/vim/comments/jzjbdd/coc_auto_suggestions_are_stuck_on_the_screen/
nnoremap <silent> <ESC><ESC> :nohlsearch \| match none \| 2match none \| call coc#float#close_all()<CR>
"
"-----------------------------------------
"FZF and Coc
"-----------------------------------------
"https://github.com/junegunn/fzf#search-syntax
nnoremap ,p  :call fzf#vim#files(0, {'options':'--query=' . expand('%:e') . '$\ '})<CR>
nnoremap ,f  :Files $DATA/dev/projects<cr>
nnoremap ,F  :Files $DATA/

"Rg2 allows :Rg2 <search> <dir>
" https://github.com/junegunn/fzf.vim/issues/837
command! -bang -nargs=* RgDir
  \ call fzf#vim#grep("rg --column --line-number --no-heading --color=always --smart-case ".<q-args>, 1, {'dir': system('git -C '.expand('%:p:h').' rev-parse --show-toplevel 2> /dev/null')[:-2]}, <bang>0)

"Rg3 allows :Rgf <search> <dir> with preview and allows dir completion using <tab> key
" eg Rgf bfs $DATA<tab>
command! -bang -nargs=* -complete=file Rg3
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --color=always --smart-case '.<q-args>, 1,
  \   fzf#vim#with_preview({
  \     'dir': system('git -C '.expand('%:p:h').' rev-parse --show-toplevel 2> /dev/null')[:-2]
  \   }), <bang>0)

nnoremap ,g  :Rg3 

" tags in current buffer
nnoremap ,t  :BTags<CR>
" tags for project
nnoremap ,T  :Tags
nnoremap ,b  :Buffers<CR>
nnoremap ,w  :CocList words<CR>

" command history; similar to :<c-f> but uses FZF
nnoremap ,c :History:<CR> 

" file open history: two ways?
nnoremap ,m  :FZFMru<CR>
" files history from v:oldfiles - above seems to better but haven't 
" thoroughly checked
" nnoremap <leader>m :History<CR>

" history of searches via FZF
nnoremap ,/ :History/<CR>

" ---------------
" YankRing
" ---------------
" nnoremap <leader>y  :RShow<CR>
nnoremap <leader>y  :<C-u>CocList --normal yank<cr>

" ---------------
" online thesaurus
" ---------------
"
if exists("g:loaded_thesaurus_query")
  let g:tq_map_keys = 0
  " "silent!" stops the "Press ENTER or type command to continue" prompt. Can also add an extra <CR>
  " nnoremap <unique> <space>K :silent! OnlineThesaurusCurrentWord<CR>
  " nnoremap <leader>K :OnlineThesaurusCurrentWord<CR><CR>
  nnoremap <Leader>K :ThesaurusQueryReplaceCurrentWord<CR>
  let g:tq_use_vim_autocompletefunc=1
endif

" ---------------
" JS, JSX, etc
" ---------------
" do JSX syntax highlighting in .JS and .JSX files.
let g:jsx_ext_required = 0
" Disable bracket highlighting
let g:loaded_matchparen=1
" Standard JS - automatic formatting on save
" autocmd bufwritepost *.js silent !standard --fix %
" set autoread
"

" ---------------
" janko-m/vim-test
" ---------------
let test#strategy = "dispatch"
" let test#strategy = "asyncrun_background"
map <leader>rt :TestFile<CR>
map <leader>rs :TestSuite<CR>
map <leader>rl :TestLast<CR>
map <leader>rv :TestVisit<CR>
"
" run current file (unrelated to vim-test
map <leader>rr :!"%:p"<CR>
" noremap <leader>tr :silent !start "1" "%:p"<CR>
" nmap <leader>tr :! start "1" "%:p"<CR>

" ---------------
" Misc functions
" ---------------
"
" To run, type:
"   :call TestLanguages
function! TestLanguages()
  :lua print("lua good")
  :python3 print("Python3 good")
  :perl print("Perl good")
  :ruby print("Ruby good")
  " :python print("Python2 good")
endfunction
" noremap <C-F11> :call TestLanguages()<CR>

"-----------------------

" lets you send output of ex commands to new buffer (see http://vim.wikia.com/wiki/Capture_ex_command_output). For example:
"    :BufferMessage set all      "show set variables
"    :BufferMessage let g:       "show global variables
"    :BufferMessage mess         "show messages
"For more env vars, see https://vim.fandom.com/wiki/Displaying_the_current_Vim_environment
"
function! BufferMessage(cmd)
  redir => message
  silent execute a:cmd
  redir END
  enew
  silent put=message
  set nomodified
endfunction
command! -nargs=+ -complete=command BufferMessage call BufferMessage(<q-args>)
command! -nargs=+ -complete=command B call BufferMessage(<q-args>)
"-----------------------
function! ToggleVerbose()
  if !&verbose
    set verbosefile=$PK_VIMFILES/vim.log
    set verbose=15
  else
    set verbose=0
    set verbosefile=
  endif
endfunction
command! -nargs=+ -complete=command ToggleVerbose call ToggleVerbose()
"-----------------------
if !exists('*StripTrailingWhitespace')
    function! StripTrailingWhitespace()
        if !&binary && &filetype != 'diff'
            let b:win_view = winsaveview()
            silent! keepjumps keeppatterns %s/\s\+$//e
            call winrestview(b:win_view)
        endif
    endfunction
endif
command! Cls call StripTrailingWhitespace()
cnoreabbrev cls Cls
cnoreabbrev StripTrailingSpace Cls
" nnoremap <Leader>s :call StripTrailingWhitespace()
"
"
" Search for a string then type :CopyMatches [reg] to copy to clipboard or reg (if 
" specified
" https://vim.fandom.com/wiki/Copy_search_matches
function! CopyMatches(reg)
  let hits = []
  %s//\=len(add(hits, submatch(0))) ? submatch(0) : ''/gne
  let reg = empty(a:reg) ? '+' : a:reg
  execute 'let @'.reg.' = join(hits, "\n") . "\n"'
endfunction
command! -register CopyMatches call CopyMatches(<q-reg>)
"Autocompletion -----------------------
"Move in omni pop-up with C-j/k
" function! OmniPopup(action)
"
  " if pumvisible()
    " if a:action == 'j'
      " " return "\<DOWN>"
      " return "\<C-N>"
    " elseif a:action == 'k'
      " return "\<C-P>"
      " " return "\<UP>"
    " elseif a:action == 'r'
      " return "\<C-y>"
    " endif
  " endif
  " return a:action
" endfunction
"
" Move down without choosing option
" inoremap <silent><C-j> <C-R>=OmniPopup('j')<CR>
"
" " Move up without choosing option
" inoremap <silent><C-k> <C-R>=OmniPopup('k')<CR>
" " Choose currently highlighted option for autocompletion
" inoremap <silent><C-ENTER> <C-R>=OmniPopup('r')<CR>

"-----------------------
" auto-format plugin
" let g:python3_host_prog="/usr/bin/python"
" let g:python3_host_prog="/home/praful/.pyenv/shims/python3"
noremap <F4> :Autoformat<CR>
