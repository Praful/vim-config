"=============================================================================
" File: deep-onyx.vim
" Description: This colour scheme is for gvim only. 
"              Inspired by a theme I found years ago called Neon by Tiza.
" Author: Praful https://github.com/Praful/vim-colour-scheme
" Licence: GPL v3
"
" Good choice of colours here: https://creativebooster.net/blogs/colors/
"=============================================================================


set background=dark
hi clear
if exists("syntax_on")
   syntax reset
endif

let colors_name = "deep-onyx"

" hi Normal       guifg=#ffffff guibg=#303030 " white
" hi Normal       guifg=#FFF6DC guibg=#303030 "off-white 1
hi Normal       guifg=#FAF9F6 guibg=#303030 "off-white 2
"
" Search
hi IncSearch    gui=NONE guifg=#000000 guibg=#FF8000
hi Search    gui=NONE guifg=#000000 guibg=#FFFF80

" Messages
hi ErrorMsg     gui=BOLD guifg=#ffa0ff guibg=NONE
hi WarningMsg   gui=BOLD guifg=#ffa0ff guibg=NONE
hi ModeMsg      gui=BOLD guifg=#a0d0ff guibg=NONE
hi MoreMsg      gui=BOLD guifg=#70ffc0 guibg=#8040ff
hi Question     gui=BOLD guifg=#e8e800 guibg=NONE

" Split area
hi StatusLine   gui=NONE guifg=#000000 guibg=#c4c4c4
hi StatusLineNC gui=NONE guifg=#707070 guibg=#c4c4c4
hi VertSplit    gui=NONE guifg=#707070 guibg=#c4c4c4
hi WildMenu     gui=NONE guifg=#000000 guibg=#ff80c0

" Diff
hi DiffText     gui=NONE guifg=#ff78f0 guibg=#a02860
hi DiffChange   gui=NONE guifg=#e03870 guibg=#601830
hi DiffDelete   gui=NONE guifg=#a0d0ff guibg=#0020a0
hi DiffAdd      gui=NONE guifg=#a0d0ff guibg=#0020a0

" Cursor
"
" for some reason vim terminal underlines the cursor line. Clearing it solves the 
" problem. nvim works fine without clearing it
hi clear CursorLine
hi Cursor       gui=NONE guifg=#000000 guibg=#FF8000
hi lCursor       gui=NONE guifg=#000000 guibg=#FF8000
hi CursorIM       gui=NONE guifg=#000000 guibg=#FF8000
hi CursorLine   gui=NONE guifg=NONE guibg=#282a2e
hi clear CursorLineNR
hi CursorLineNR    gui=NONE guifg=#FFFF80 

" Fold
hi Folded       gui=NONE guifg=#40f0f0 guibg=#006090
hi FoldColumn   gui=NONE guifg=#40c0ff guibg=#404040

" Other
hi Directory    gui=NONE guifg=#c8c8ff guibg=NONE

hi LineNr       gui=NONE guifg=#707070 guibg=NONE
hi SignColumn   gui=NONE guifg=#60f0a8 guibg=#404040
hi NonText      gui=BOLD guifg=#d84070 guibg=#383838
hi SpecialKey   gui=BOLD guifg=#8888ff guibg=NONE
hi Title        gui=BOLD guifg=fg      guibg=NONE
hi Visual       gui=NONE guifg=black guibg=CornflowerBlue
hi VisualNOS    gui=NONE guifg=#ffe8c8 guibg=#c06800

" hi clear SpellBad
" hi SpellBad cterm=underline 
" Set style for gVim for coc-spell-checker
hi SpellBad gui=undercurl

" Syntax group
hi Comment      gui=ITALIC  guifg=#A0A0A0 guibg=NONE
hi String       gui=BOLD guifg=#8CBC7C guibg=NONE
" hi Constant     gui=BOLD guifg=#89CFF0 guibg=NONE
hi Constant     gui=BOLD guifg=#d75f87 guibg=NONE 
hi Character    gui=NONE guifg=#D86868 guibg=NONE
hi Error        gui=BOLD guifg=#ffffff guibg=#8000ff
" hi Identifier   gui=BOLD guifg=cornflowerblue guibg=NONE
" hi Identifier   gui=BOLD guifg=#92d4ff guibg=NONE
hi Identifier   gui=BOLD guifg=#89B4FA guibg=NONE
" hi Identifier   gui=BOLD guifg=#569cd6 guibg=NONE
hi Delimiter    gui=BOLD guifg=#FFFF80 guibg=NONE
" hi Delimiter    gui=BOLD guifg=#F8B453 guibg=NONE
hi Operator     gui=BOLD guifg=#F8B453 guibg=NONE
hi Ignore       gui=NONE guifg=bg      guibg=NONE
hi PreProc      gui=NONE guifg=#D86868 guibg=NONE
" hi Special      gui=BOLD guifg=#FFFF80 guibg=NONE
hi Special      gui=BOLD guifg=#74C7EC guibg=NONE
" hi SpecialChar  gui=BOLD guifg=#FFFF80 guibg=NONE
hi SpecialChar  gui=BOLD guifg=#BAC2DE guibg=NONE
hi Statement    gui=BOLD guifg=#F8B453 guibg=NONE
hi Todo         gui=BOLD,UNDERLINE guifg=red guibg=NONE
hi Type         gui=BOLD guifg=#F393FF guibg=NONE
" hi Type         gui=BOLD,ITALIC guifg=#FFFF80 guibg=NONE
" hi Type         gui=BOLD,ITALIC guifg=#F8B453 guibg=NONE
hi Underlined   gui=UNDERLINE guifg=CornflowerBlue guibg=NONE
hi Macro        gui=NONE guifg=#CC6666 guibg=NONE

" used to highlight unused variables in Python
hi Conceal      gui=NONE guifg=#FFFFFF guibg=#707070

hi htmlBold gui=BOLD
hi htmlItalic gui=ITALIC
hi htmlLink gui=UNDERLINE guifg=white guibg=NONE
" Angled brackets' colour
hi htmlTag gui=BOLD guifg=#92d4ff guibg=NONE
hi htmlEndTag gui=BOLD guifg=#92d4ff guibg=NONE
hi Tag gui=NONE guifg=#92d4ff guibg=NONE
hi link htmlStatement Tag
"
"Autocomplete menu
hi Pmenu ctermbg=8 guibg=#606060
hi PmenuSel ctermbg=1 guifg=#000000 guibg=#1f82cd
