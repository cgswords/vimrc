"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" Start up pathogen before we do anythng else
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
execute pathogen#infect()

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" Set up tabbing to use a tab width of 2 and use spaces instead of
"" tabs., and turn on good indentation (we don't need it with vim patch)
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set tabstop=2
set expandtab
set shiftwidth=2
set smartindent
set autoindent

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" SETTING       | Description                                              "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" showmatch     | shows matching brackets on hover                         "
"" nocompatible  | disables vi compatibility mode; who uses that?!          "
"" noincsearch   | disables incremental search when searching               "
"" formatoptions | attempts to disable comment character                    "
""               | propagation after an insert-mode newline or open         "
"" hidden        | allows :e to move away from files to other files         "
"" ruler         | displays helpful information at the bottom               "
"" textwidth     | set the default column width to 80 (like it's the 1980s) "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" These are mostly personal preference. They make my life easier writing 
"" programs in vim.

set showmatch         
set nocompatible      
set noincsearch       
set formatoptions=cql 
                      
set hidden            
set ruler             
set textwidth=80      

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" USEFUL KEY REBINDINGS
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" S to grab a parenthetical without having to hit shift for a %
:map S %

"" ^X^V<char> to insert special <char> (insert mode)
inoremap <c-x><c-v> <c-v>

"" Map Ctrl-j to moving up, Ctrl-k to moving down
noremap <C-j> <C-e>
noremap <C-k> <C-y>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" SPECIAL CASE FILE OPTIONS
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" true tabs for Makefiles (thanks make)
autocmd FileType make set noexpandtab

"" automatic spellchecking for markdown and latex files
autocmd FileType mkd  set spell spelllang=en_us
autocmd FileType tex  set spell spelllang=en_us

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" COLORS
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" Let's get some syntax highlighting going.
syntax on
filetype on

" For CSApprox; you need CSApprox for these to work without gvim
set t_Co=256

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" COLOR SCHEME
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
colorscheme badwolf       " A gorerous theme that Tim Zakian recommended
"colorscheme ir_black     " Anky Keep's suggestion
"colorscheme darkbone     " An old classic I like
"colorscheme jellybeans   " Jaime Guerrero got me on this one
"colorscheme hemisu-light " Nice black-on-white for presenting
"colorscheme github2      " Alternative black-on-white
"colorscheme mustang      " Another great scheme
