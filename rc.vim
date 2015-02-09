
" Use a tab width of two and use spaces instead of tabs for files. It really
" should be the default, after all!
set tabstop=2
set expandtab
set shiftwidth=2

" These are mostly personal preference. They make my life easier writing Scheme.
" showmatch shows matching brackets on hover
" nocompatible disables vi compatibility mode; who uses that?!
" noincsearch disables incremental search when searching
" formatoptions attempts to disable comment character propagation after an
"   insert-mode newline or open command
" hidden allows :e to move away from files to other files
" ruler is fairly essential in my opinion.
set showmatch
set nocompatible
set noincsearch
set formatoptions=cql
set hidden
""set ruler
set textwidth=80

" Special case tabexpand for Makefiles
autocmd FileType make set noexpandtab

" Turning on auto-indent, which we don't need with hacked vim
set smartindent
set autoindent

" For CSApprox
set t_Co=256
" You need CSApprox for these to work without gvim
" ir_black is preferred by Andy Keep
" darkbone is preferred by Cam Swords
" jellybeans was suggested by Jaime Guerrero
" hemisu-light and github2 are both good for black-on-white presenting
"colorscheme ir_black
"colorscheme darkbone 
colorscheme jellybeans
"colorscheme hemisu-light
"colorscheme github2 
syntax on
filetype on
""filetype plugin indent on

" Some useful keymappings
" S to grap an S-expression without having to hit shift for a %
:map S %
" ^X^V<char> to insert special <char> (insert mode)
inoremap <c-x><c-v> <c-v>

noremap <C-j> <C-e>
noremap <C-k> <C-y>

