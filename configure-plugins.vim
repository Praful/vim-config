"=============================================================================
"
" File: configure-plugins.vim
" Description: Set mappings, etc once plugins have been loaded. 
"              Plugin pre-load work is done in vimrc.
" Author: Praful https://github.com/Praful/vim-config
" Licence: GPL v3
"=============================================================================

let g:airline#extensions#searchcount#enabled = 0

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
" rainbow
" ---------------
" Doesn't work - probably incompatible with another plugin.
" let g:rainbow_active = 1 "set to 0 if you want to enable it later via :RainbowToggle

" ---------------
" IndexedSearch
" ---------------
" Unhighlight search results. This is here and not vimrc to override IndexedSearch's 
" mapping.
nmap \\ :noh<return>

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
  let Tlist_Close_On_Select = 0
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
" Grepper
" ---------------
nnoremap <leader>g :Grepper<cr>
let g:grepper = { 'next_tool': '<leader>g' }
let g:grepper.tools = ['git', 'rg', 'ag', 'grep']

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
let NERDSpaceDelims=1
"Toggle comments
nmap ,c <Leader>c<Leader>
vmap ,c <Leader>c<Leader>
" control / mappings don't work having tried options on
"https://vi.stackexchange.com/questions/26611/is-it-possible-to-map-control-forward-slash-with-vim
"https://stackoverflow.com/questions/9051837/how-to-map-c-to-toggle-comments-in-vim
" noremap <C-s-/> <Leader>c<Leader>
" vnoremap <C-s-/> Leader>c<Leader>
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
" Python
" ---------------
" call VimTK_default_remap()

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
" coc
" ---------------

"removed coc-powershell because of the persistent terminal window.
"removed coc-spell-checker because of the constant prompts in irrelevant files
let g:coc_global_extensions = ['coc-html', 'coc-python', 'coc-css', 'coc-json', 'coc-emmet', 'coc-tsserver',  'coc-flutter', 'coc-solargraph']

" let g:node_client_debug = 1

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
set signcolumn=yes

"
" Settings copied from coc help :h coc-completion-example


" Map <tab> for trigger completion, completion confirm, snippet expand and jump
" like VSCode: >
inoremap <silent><expr> <TAB>
  \ coc#pum#visible() ? coc#_select_confirm() :
  \ coc#expandableOrJumpable() ?
  \ "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
  \ <SID>check_back_space() ? "\<TAB>" :
  \ coc#refresh()

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

let g:coc_snippet_next = '<tab>'

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif
inoremap <silent><expr> <c-space> coc#refresh()


" Use `[g` and `]g` to navigate diagnostics
" nmap <silent> [g <Plug>(coc-diagnostic-prev)
" nmap <silent> ]g <Plug>(coc-diagnostic-next)
" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gt <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
"
" set keywordprg=:call\ <SID>show_documentation()<CR>
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" coc-spell-checker
" vmap <leader>a <Plug>(coc-codeaction-selected)
" nmap <leader>a <Plug>(coc-codeaction-selected)

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

" Remap for format selected region
" xmap <leader>f  <Plug>(coc-format-selected)
" nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
" xmap <leader>a  <Plug>(coc-codeaction-selected)
" nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap for do codeAction of current line
" nmap <leader>ac  <Plug>(coc-codeaction)
" Fix autofix problem of current line
" nmap <leader>qf  <Plug>(coc-fix-current)

" Create mappings for function text object, requires document symbols feature of languageserver.
" xmap if <Plug>(coc-funcobj-i)
" xmap af <Plug>(coc-funcobj-a)
" omap if <Plug>(coc-funcobj-i)
" omap af <Plug>(coc-funcobj-a)

" Use <C-d> for select selections ranges, needs server support, like: coc-tsserver, coc-python
" nmap <silent> <C-d> <Plug>(coc-range-select)
" xmap <silent> <C-d> <Plug>(coc-range-select)

" Use `:Format` to format current buffer
command! -nargs=0 Format :call CocAction('format')

" Use `:Fold` to fold current buffer
" command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" use `:OR` for organize import of current buffer
" command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add status line support, for integration with other plugin, checkout `:h coc-status`
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Using CocList
" Show all diagnostics
" nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions
" nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands
" nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document
" nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols
" nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
" nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
" nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list
" nnoremap <silent> <space>p  :<C-u>CocListResume<CR>
"
nnoremap <silent> ,o  :<C-u>CocList outline<cr>
nnoremap ,f  :CocFix<CR>

" Update time for linting
set updatetime=300

" Issue of persistent floating windows. Press ESC twice to remove
" https://www.reddit.com/r/vim/comments/jzjbdd/coc_auto_suggestions_are_stuck_on_the_screen/
nnoremap <silent> <ESC><ESC> :nohlsearch \| match none \| 2match none \| call coc#float#close_all()<CR>
"
"-----------------------------------------
"FZF and Coc
"-----------------------------------------
"https://github.com/junegunn/fzf#search-syntax
nnoremap ,p  :call fzf#vim#files(0, {'options':'--query=' . expand('%:e') . '$\ '})<CR>
nnoremap ,f  :Files c:\data\dev\projects<cr>
nnoremap ,F  :Files c:\data\
nnoremap ,g  :Rg<CR>
nnoremap ,G  :call fzf#vim#grep('rg --column --line-number --no-heading --color=always --smart-case ""', 1, {'options':'--exact --delimiter : --nth 4.. --query=<C-r><C-w> +i'})<CR>
nnoremap ,t  :Tags<CR>
nnoremap ,T  :call fzf#vim#tags('^<C-r><C-w> ', {'options':'--exact +i'})<CR>
" nnoremap ,b  :Buffers<CR>
" nnoremap ,b  :CocList --strict buffers<CR>
nnoremap ,b  :CocList buffers<CR>
" nnoremap ,w  :Windows<CR>
nnoremap ,w  :CocList words<CR>
" nnoremap ,m  :History<CR>
" nnoremap ,m  :FZFMru<CR>
nnoremap ,m  :CocList mru -A<CR>
" nnoremap ,m  :CocList --strict mru -A<CR>
nnoremap <leader>m :History<CR>

"

" ---------------
" YankRing
" ---------------
" nnoremap <leader>y  :RShow<CR>
nnoremap <leader>y  :<C-u>CocList --normal yank<cr>
" ---------------
" vim-gtfo
" ---------------
let g:gtfo#terminals = { 'win': 'pwsh -NoLogo -NoExit -Command' }

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
function! OmniPopup(action)
  if pumvisible()
    if a:action == 'j'
      return "\<DOWN>"
      "return "\<C-N>"
    elseif a:action == 'k'
      "return "\<C-P>"
      return "\<UP>"
    elseif a:action == 'r'
      return "\<C-y>"
    endif
  endif
  return a:action
endfunction
"
" Move down without choosing option
inoremap <silent><C-j> <C-R>=OmniPopup('j')<CR>
" Move up without choosing option
inoremap <silent><C-k> <C-R>=OmniPopup('k')<CR>
" Choose currently highlighted option for autocompletion
inoremap <silent><C-ENTER> <C-R>=OmniPopup('r')<CR>

"-----------------------
