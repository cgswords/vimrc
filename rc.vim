
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" Settings we should _really_ use

"" Use a tab width of two and use spaces instead of tabs for files. It really
"" should be the default, after all!
set tabstop=2
set expandtab
set shiftwidth=2

"" Turning on auto-indent, which we don't need with hacked vim
set smartindent
set autoindent

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" Other Settings
"" These are mostly personal preference. They make my life easier.

set showmatch          "" showmatch shows matching brackets on hover
set nocompatible       "" nocompatible disables vi compatibility mode; who uses that?!
set noincsearch        "" noincsearch disables incremental search when searching
set formatoptions=cql  "" formatoptions attempts to disable comment character propagation after an
                       ""   insert-mode newline or open command
set hidden             "" hidden allows :e to move away from files to other files
set textwidth=80       "" we set line length to 80 because we live in the 80s!

""set ruler            "" shows a ruler line; try it out!

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" Specific File Options

" Special case tabexpand for Makefiles
autocmd FileType make set noexpandtab

" Automatic spell-checking for markdown and latex files
autocmd FileType mkd  set spell spelllang=en_us
autocmd FileType tex  set spell spelllang=en_us

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" Terminal Colors
"" You need CSApprox for these to work without gvim
"" For CSApprox, we set terminal colors up:
set t_Co=256

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" Color Schemes
"" - ir_black is preferred by Andy Keep
"" - badwolf is preferred by Cam Swords
"" - jellybeans was suggested by Jaime Guerrero
"" - hemisu-light and github2 are both good for black-on-white presenting
colorscheme badwolf
"colorscheme ir_black
"colorscheme darkbone 
"colorscheme jellybeans
"colorscheme hemisu-light
"colorscheme github2 

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" Turn the syntax highlighting on
syntax on
filetype on

"" Option for indent; I don't use it.
""filetype plugin indent on

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" Key Rebindings

"" Dealing with parentheticals
"" S will grab an S-expression without having to hit shift for a %
:map S %

"" Dealing with weird characters
"" ^X^V<char> to insert special <char> (insert mode)
inoremap <c-x><c-v> <c-v>

"" Scrolling up and down
"" It's more natural to use j/k for me, so I rebound them as such.
noremap <C-j> <C-e>
noremap <C-k> <C-y>
