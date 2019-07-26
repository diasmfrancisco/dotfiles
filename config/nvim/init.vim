" set neovim init.vim file equal to .vimrc file
 
set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath
source ~/.vim/.vimrc


