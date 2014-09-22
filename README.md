# SMALLHAMMER

*(By Cameron Swords, with select contributions from Andy Keep and Jaime Guerrero)*

**Smallhammer** is a set of vim bindings for developing Scheme code for 
[Petite Chez Scheme](http://www.scheme.com/petitechezscheme.html) and
[Racket](http://racket-lang.org/),
along with syntax plugins for BBCode (.bbc), Idris, Markdown (.md), and Ott
(.ott). 

# Installation

**Smallhammer.vim** is a `.vimrc` for you to consider using. Attempst have been made to
document each line, and may be worth reading through. To install it, move it to `~/.vimrc`

You probably want to move `dot_vim`'s folders into into `~/.vim/`

There are some other things to note here:

- I've rebound `Ctrl+j` to `Ctrl+e` and `Ctrl+k` to `Ctrl+y`; I find that using
  control with the standard keys to move up and down pages feels natural.
- I have rebound `S` to `%`. For the purpose of programming, I find that `%` 
  (which serves as `w/d/l` might, but for a set of paretheses) is far more
  valuable than `S` (which deletes a line and drops into insert mode) as a 
  keystroke right under my hands.
- I prefer tabstop of 2 with no expandtab, though there is a small
  exception to this for Makefiles, which is included in the `.vimrc`
- The files in the `plugin` folder can be moved to `~/.vim/plugin/`, but
  they are separate since I didn't write them. They are:
    - `CSApprox` allows for full color support in terminals, for using the
      color themes included.
    - `autoclose` types a `)` every time you type a `(` (it also does this for
      `[` and `{`). The documentation says that `\a` will turn it off, but
      `paste` mode also suppresses it (and I find is usually what I actually
      wanted in the first place). Right now I dislike how it handles nested
      braces, but not enough to hack on it. I may in the future.
- The `vim_syntax_patch` is from Kent Dybvig, who decided that the standard
  way that Vim indents things was wrong (which is true). It also modifies how
  mark yanking works just a tad. I don't use this patch, but it has some
  serious merit and I would if I were less lazy. The readme is extensive and
  the C code is straight-forward (ha!).

# Lisensing

Redistribution and use in source and binary forms, with or without
modification, are permitted.

*This software is provided by the regents and contributors ``as is'' and
any express or implied warranties, including, but not limited to, the
implied warranties of merchantability and fitness for a particular purpose
are disclaimed.  In no event shall the regents or contributors be liable
for any direct, indirect, incidental, special, exemplary, or consequential
damages (including, but not limited to, procurement of substitute goods
or services; loss of use, data, or profits; or business interruption)
however caused and on any theory of liability, whether in contract, strict
liability, or tort (including negligence or otherwise) arising in any way
out of the use of this software, even if advised of the possibility of
such damage.*

Smallhammer is in no way  affiliated with Cadence Research Systems or Racket and
is developed independently.


