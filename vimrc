" https://youtu.be/XA2WjJbmmoM

set background=dark

" enter the new millienium
set nocompatible

" enable syntax and plugins for newtr
syntax enable
filetype plugin on

" FINDING FILES
set path+=**      " Provides tab-completion  for all file-related tabs
set wildmenu      " Display all matching files when we complete tab

" NOW WE CAN
" - Hit tab to :find by partial match
" - Use * to make it fuzzy

" THINGS TO CONSIDER
" - :b lets you autocomplete any open buffer

" TAG JUMPING

" Create the 'tags' file after ctags is installed
command! MakeTags !ctags -R .

" NOW WE CAN:
" - Use ^] to jump to tag under cursor
" - Use g^] for ambiguous tags
" - Use ^t to jump back up the tag stack

" THINGS TO CONSIDER:
" - This doesn't help if you want a visual list of tags

" AUTOCOMPLETE

" The good stuff is documented in |ins-completion|

" HIGHLIGHTS:
" - ^x^n for JUST this file
" - ^x^f for filenames (works with our path trick!)
" - ^x^] for tags only
" - ^n for anything specifid by the 'complete' option

" NOW WE CAN:
" - Use ^n and ^p to go back and forth in the suggestion list!

" SHOWING DOTFILES (NETWR)
let g:netrw_list_hide = '\(^\|\s\s\)\zs\.\S\+'









""""""""""""""""""""""""""
""""""""""""""""""""""""""
""" Plugins

call plug#begin('~/.vim/plugged')


""""""""""""""""""""""""""
""" Currently in use

Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'
Plug 'junegunn/vim-easy-align'

Plug 'tpope/vim-sensible'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-surround'

Plug 'terryma/vim-multiple-cursors'
Plug 'godlygeek/tabular'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'lervag/vimtex'

Plug 'dracula/vim', { 'as': 'dracula' }


""""""""""""""""""""""""""
""" Markdown; figure it out!

Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() } }
Plug 'ferrine/md-img-paste.vim'
Plug 'tpope/vim-markdown'
" Plug 'sheerun/vim-polyglot'
" Plug 'plasticboy/vim-markdown', { 'for': 'markdown'}
" Plug 'https://github.com/vim-pandoc/vim-pandoc'
" Plug 'vim-pandoc/vim-pandoc-syntax'
" Plug 'SidOfc/mkdx'

""""""""""""""""""""""""""
""" Currently NOT in use

" Plug 'tpope/vim-vinegar'
" Plug 'tpope/vim-repeat'
" Plug 'tpope/vim-fugitive'
" Plug 'mbbill/undotree'
" Plug 'flazz/vim-colorschemes'
Plug 'elzr/vim-json'
" Plug 'fatih/vim-go'
" Plug 'vimwiki/vimwiki'


call plug#end()




""""""""""""""""""""""""""
""""""""""""""""""""""""""
""" Basic behavior

set number              " show line numbers
set relativenumber      " show relative numbers!
set wrap                " wrap lines
set encoding=utf-8      " set encoding to UTF-8 (default was "latin1")
set mouse=a             " enable mouse support (might not work well on Mac OS X)
set wildmenu            " visual autocomplete for command menu
set lazyredraw          " redraw screen only when we need to
set showmatch           " highlight matching parentheses / brackets [{()}]
set laststatus=2        " always show statusline (even with only single window)
set ruler               " show line and column number of the cursor on right side of statusline
set visualbell          " blink cursor on error, instead of beeping


""""""""""""""""""""""""""
""" Key bindings

" configure other way to escape, as well as leader key
let mapleader=" "
inoremap jk <esc>

" move vertically by visual line (don't skip wrapped lines)
nmap j gj
nmap k gk


""""""""""""""""""""""""""
"""" Vim Appearance

" put colorscheme files in ~/.vim/colors/
" good colorschemes: murphy, slate, molokai, badwolf, solarized

colorscheme badwolf
" let g:dracula_italic = 0

" use filetype-based syntax highlighting, ftplugins, and indentation
" syntax enable
" filetype plugin indent on


""""""""""""""""""""""""""
"""" Tab settings

set tabstop=4           " width that a <TAB> character displays as
set expandtab           " convert <TAB> key-presses to spaces
set shiftwidth=4        " number of spaces to use for each step of (auto)indent
set softtabstop=4       " backspace after pressing <TAB> will remove up to this many spaces

set autoindent          " copy indent from current line when starting a new line
set smartindent         " even better autoindent (e.g. add indent after '{')


""""""""""""""""""""""""""
"""" Search settings

set incsearch           " search as characters are entered
set hlsearch            " highlight matches

" turn off search highlighting with <CR> (carriage-return)
nnoremap <CR> :nohlsearch<CR><CR>

""""""""""""""""""""""""""
"""" Miscellaneous settings that might be worth enabling

"set cursorline         " highlight current line
"set background=dark    " configure Vim to use brighter colors
"set autoread           " autoreload the file in Vim if it has been changed outside of Vim




""""""""""""""""""""""""""
""""""""""""""""""""""""""
""" Other behavior


""""""""""""""""""""""""""
" Automatic tabularization, from Tim Pope

inoremap <silent> <Bar>   <Bar><Esc>:call <SID>align()<CR>a
function! s:align()
        let p = '^\s*|\s.*\s|\s*$'
        if exists(':Tabularize') && getline('.') =~# '^\s*|' && (getline(line('.')-1) =~# p || getline(line('.')+1) =~# p)
                let column = strlen(substitute(getline('.')[0:col('.')],'[^|]','','g'))
                let position = strlen(matchstr(getline('.')[0:col('.')],'.*|\s*\zs.*'))
                Tabularize/|/l1
                normal! 0
                call search(repeat('[^|]*|',column).'\s\{-\}'.repeat('.',position),'ce',line('.'))
        endif
endfunction


""""""""""""""""""""""""""
" Goyo and Limelight options

autocmd! User GoyoEnter Limelight
autocmd! User GoyoLeave Limelight!


""""""""""""""""""""""""""
" Markdown Preview

" Don't close preview tab when switching to other buffers
"let g:mkdp_auto_close = 0

" support front matter of various format
let g:vim_markdown_frontmatter = 1  " for YAML format
let g:vim_markdown_toml_frontmatter = 1  " for TOML format
let g:vim_markdown_json_frontmatter = 1  " for JSON format


""""""""""""""""""""""""""
" Snippets

" Trigger configuration. Do not use <tab> if you use YouCompleteMe
let g:UltiSnipsExpandTrigger = '<tab>'
let g:UltiSnipsJumpForwardTrigger = '<tab>'
let g:UltiSnipsJumpBackwardTrigger = '<s-tab>'

""""""""""""""""""""""""""
" Split

nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

set splitbelow
set splitright

""""""""""""""""""""""""""
" fzf



""""""""""""""""""""""""""
" md image paste

autocmd FileType markdown nmap <silent> <leader>p :call mdip#MarkdownClipboardImage()<CR>
" there are some defaults for image directory and image name, you can change them
let g:mdip_imgdir = 'image-assets'
" let g:mdip_imgname = 'image'

""""""""""""""""""""""""""
" vimtex
let g:tex_flavor='latex'
let g:vimtex_view_method = 'skim'
" let g:vimtex_view_method='zathura'
let g:vimtex_quickfix_mode=0
set conceallevel=1
let g:tex_conceal='abdmg'

" let g:vimtex_view_method = "skim"
" let g:vimtex_view_general_viewer
"             \  = '/Applications/Skim.app/Contents/SharedSupport/displayline'
" let g:vimtex_view_general_options = '-r @line @pdf @tex'
" 
" This adds a callback hook that updates Skim after compilation
" let g:vimtex_compiler_callback_hooks = ['UpdateSkim']
" function! UpdateSkim(status)
"     if !a:status | return | endif
" 
"     let l:out = b:vimtex.out()
"     let l:tex = expand('%:p')
"     let l:cmd = [g:vimtex_view_general_viewer, '-r']
"     if !empty(system('pgrep Skim'))
"     call extend(l:cmd, ['-g'])
"     endif
"     if has('nvim')
"     call jobstart(l:cmd + [line('.'), l:out, l:tex])
"     elseif has('job')
"     call job_start(l:cmd + [line('.'), l:out, l:tex])
"     else
"     all system(join(l:cmd + [line('.'), shellescape(l:out), shellescape(l:tex)], ' '))
"     endif
" endfunction

" NERDtree

nnoremap <Leader>f :NERDTreeToggle<Enter>
let NERDTreeQuitOnOpen = 1

" automatically close if NERDtree is only left standing
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
