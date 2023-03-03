"=============================================================================
" File: bubblegum2.vim
" Description: This vim-airline theme was originally based on the bubblegum theme
" Author: Praful https://github.com/Praful/vim-colour-scheme
" Licence: GPL v3
"=============================================================================
" 
"
" Color palette
let s:gui_dark_gray = '#303030'
let s:cterm_dark_gray = 236
let s:gui_med_gray_hi = '#444444'
let s:cterm_med_gray_hi = 238
let s:gui_med_gray_lo = '#3a3a3a'
let s:cterm_med_gray_lo = 237
let s:gui_light_gray = '#b2b2b2'
let s:cterm_light_gray = 249
let s:gui_green = '#afd787'
let s:cterm_green = 150
let s:gui_blue = '#87afd7'
let s:cterm_blue = 110
let s:gui_purple = '#afafd7'
let s:cterm_purple = 146
let s:gui_orange = '#d7af5f'
let s:cterm_orange = 179
let s:gui_red = '#d78787'
let s:cterm_red = 174
let s:gui_pink = '#d7afd7'
let s:cterm_pink = 182

let s:gui_yellow = '#ffff66'
" let s:gui_blue2 = '#1F82CD'
" let s:gui_blue2 = '#738AA8'
let s:gui_blue2 = '#5E99BD'
" let s:gui_green2 = '#BAF187' 
" let s:gui_green2 = '#67C016'
let s:gui_green2 = '#83B973'
let s:gui_black = '#000000'
let s:gui_pink2 = '#ff99ff'
let s:gui_red2 = '#ff3300'
let s:gui_red2 = '#ff0000'
let s:gui_tan = '#cc3300'
  
let g:airline#themes#bubblegum2#palette = {}

" Normal mode
" let s:N1 = [s:gui_dark_gray, s:gui_green, s:cterm_dark_gray, s:cterm_green]
" let s:N2 = [s:gui_light_gray, s:gui_med_gray_lo, s:cterm_light_gray, s:cterm_med_gray_lo]
" leti s:N3 = [s:gui_green, s:gui_med_gray_hi, s:cterm_green, s:cterm_med_gray_hi]
let s:N1 = [s:gui_dark_gray, s:gui_green2, s:cterm_dark_gray, s:cterm_green]
" let s:N2 = [s:gui_black, s:gui_blue2, s:cterm_light_gray, s:cterm_med_gray_lo]
let s:N2 = [s:gui_black, s:gui_blue2, s:cterm_light_gray, s:cterm_med_gray_lo]
let s:N3 = [s:gui_black, s:gui_blue2, s:cterm_green, s:cterm_med_gray_hi]
" let s:N3 = [s:gui_black, s:gui_blue2, s:cterm_green, s:cterm_med_gray_hi]
let g:airline#themes#bubblegum2#palette.normal = airline#themes#generate_color_map(s:N1, s:N2, s:N3)
let g:airline#themes#bubblegum2#palette.normal_modified = {
      \ 'airline_b': [s:gui_black, s:gui_tan, s:cterm_orange, s:cterm_med_gray_hi, ''],
      \ 'airline_c': [s:gui_black, s:gui_tan, s:cterm_orange, s:cterm_med_gray_hi, ''],
      \ }
 
" Insert mode
let s:I1 = [s:gui_dark_gray, s:gui_yellow, s:cterm_dark_gray, s:cterm_green]
let g:airline#themes#bubblegum2#palette.insert = airline#themes#generate_color_map(s:I1, s:N2, s:N3)
let g:airline#themes#bubblegum2#palette.insert_modified = copy(g:airline#themes#bubblegum2#palette.normal_modified)
let g:airline#themes#bubblegum2#palette.insert_paste = {
      \ 'airline_a': [s:gui_black, s:gui_tan, s:cterm_dark_gray, s:cterm_orange, ''],
      \ }

" Replace mode
" let g:airline#themes#bubblegum2#palette.replace = {
      " \ 'airline_a': [s:gui_dark_gray, s:gui_red, s:cterm_dark_gray, s:cterm_red, ''],
      " \ 'airline_c': [s:gui_red, s:gui_med_gray_hi, s:cterm_red, s:cterm_med_gray_hi, ''],
      " \ }
" let g:airline#themes#bubblegum2#palette.replace_modified = copy(g:airline#themes#bubblegum2#palette.insert_modified)
let s:R1 = [s:gui_dark_gray,s:gui_red, s:cterm_dark_gray, s:cterm_green]
let g:airline#themes#bubblegum2#palette.replace = airline#themes#generate_color_map(s:R1, s:N2, s:N3)
let g:airline#themes#bubblegum2#palette.replace_modified = copy(g:airline#themes#bubblegum2#palette.insert_modified)

" Visual mode
" let s:V1 = [s:gui_dark_gray, s:gui_pink, s:cterm_dark_gray, s:cterm_pink]
" let s:V3 = [s:gui_pink, s:gui_med_gray_hi, s:cterm_pink, s:cterm_med_gray_hi]
let s:V1 = [s:gui_dark_gray, s:gui_pink2, s:cterm_dark_gray, s:cterm_green]
let g:airline#themes#bubblegum2#palette.visual = airline#themes#generate_color_map(s:V1, s:N2, s:N3)
let g:airline#themes#bubblegum2#palette.visual_modified = copy(g:airline#themes#bubblegum2#palette.insert_modified)

" Inactive window
" let s:IA = [s:gui_dark_gray, s:gui_med_gray_hi, s:cterm_dark_gray, s:cterm_med_gray_hi, '']
let s:IA = [s:gui_dark_gray, s:gui_blue2, s:cterm_dark_gray, s:cterm_med_gray_hi, '']
let g:airline#themes#bubblegum2#palette.inactive = airline#themes#generate_color_map(s:IA, s:IA, s:IA)
let g:airline#themes#bubblegum2#palette.inactive_modified = {
      \ 'airline_c': [s:gui_yellow, '', s:cterm_orange, '', ''],
      \ }



" For commandline mode, we use the colors from normal mode, except the mode
" indicator should be colored differently, e.g. blue on light green
let s:airline_a_commandline = [ '#0000ff' , '#0cff00' , 63  , 40 ]
let s:airline_b_commandline = [ '#ffffff' , '#444444' , 255 , 238 ]
let s:airline_c_commandline = [ '#9cffd3' , '#202020' , 85  , 234 ]
let g:airline#themes#bubblegum2#palette.commandline = airline#themes#generate_color_map(s:airline_a_commandline, s:airline_b_commandline, s:airline_c_commandline)

" Accents are used to give parts within a section a slightly different look or
" color. Here we are defining a "red" accent, which is used by the 'readonly'
" part by default. Only the foreground colors are specified, so the background
" colors are automatically extracted from the underlying section colors. What
" this means is that regardless of which section the part is defined in, it
" will be red instead of the section's foreground color. You can also have
" multiple parts with accents within a section.
let g:airline#themes#bubblegum2#palette.accents = {
\ 'red': [ '#ff0000' , '' , 160 , ''  ]
\ }



