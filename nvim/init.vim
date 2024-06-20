set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath

source ~/.vim/vimrc

" vim and nvim use different formats for undo files
set undodir=$PK_VIMFILES/undo-nvim//
