# VIM CONFIGURATION

*(By Cameron Swords, with select contributions from Andy Keep and Jaime Guerrero)*

This vimrc is a set of vim bindings for developing code. It started when I
was using [Petite Chez Scheme](http://www.scheme.com/petitechezscheme.html) and
[Racket](http://racket-lang.org/). More recently, I've turned to Pathogen and
expanded it a bit more.

# Installation

First, you'll need to install [pathogen](https://github.com/tpope/vim-pathogen).

    mkdir -p ~/.vim/autoload ~/.vim/bundle && \
    curl  -Sso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim

Next, pull this file down and move it to be your `.vimrc`:

    curl -Sso ~/.vimrc https://raw.githubusercontent.com/cgswords/vimrc/master/rc.vim

After that you'll need to grab the color schemes, plus some other plugins for
syntactic niceties.

    git clone git@github.com:cgswords/vim-autoclose.git ~/.vim/bundle/vim-autoclose
    git clone git@github.com:cgswords/vim-colors.git ~/.vim/bundle/vim-colors
    git clone git@github.com:godlygeek/csapprox.git ~/.vim/bundle/csapprox
    git clone git@github.com:godlygeek/tabular.git ~/.vim/bundle/tabular
    git clone git@github.com:plasticboy/vim-markdown.git ~/.vim/bundle/vim-markdown
    git clone git@github.com:scrooloose/syntastic.git ~/.vim/bundle/syntastic
    git clone git@github.com:wlangstroth/vim-racket.git ~/.vim/bundle/vim-racket

In order of command, we have:
  
- A customization of Townk's AutoClose that doesn't duplicate `\`` or `'` 
  (because Racket uses these characters for non-strings).
- A small collection of the color schemes mentioned in the .vimrc
- CSApprox, which enables full color in terminal vim
- Tabular, a great auto-alignment library
- Vim Markdown, syntax highlighting for Markdown files in Vim
- Syntastic, which reports all sorts of useful syntax errors (though you may
  want to disable the TeX one)
- Vim Racket, syntax highlighting for Racket in Vim

There are some other things to note here:

- I've rebound `Ctrl+e` to `Ctrl+j` and `Ctrl+y` to `Ctrl+k`; I find that using
  control with the standard keys to move up and down pages feels natural.
- I have rebound `S` to `%`. For the purpose of programming, I find that `%` 
  (which serves as `w/d/l` might, but for a set of paretheses) is far more
  valuable than `S` (which deletes a line and drops into insert mode) as a 
  keystroke right under my hands.
- I prefer tabstop of 2 with no expandtab, though there is a small
  exception to this for Makefiles, which is included in the `.vimrc`
- The `vim_syntax_patch` is from Kent Dybvig, who decided that the standard
  way that Vim indents things was wrong (which is true). It also modifies how
  mark yanking works just a tad. I don't use this patch, but it has some
  serious merit and I would if I were less lazy. The readme is extensive and
  the C code is straight-forward (ha!).

