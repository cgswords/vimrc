Vim Patches
================

The patches in this repository change how Vim handles 
lisp-mode indentation and how Vim handles yanking an 
area in the text.

Lisp Mode Indentation
======================

Lisp mode indentation is turned on by using `set lisp`, 
either in the Vim commandline (i.e. at the : prompt).  
It can also be set in your vimrc (you can take a look 
at my vimrc at akeep/vimrc.

The big change is that in the traditional lisp mode all 
non-keywords are setup to indent by the length of the 
item in the function location.  For example, if I write 
a function: my-great-function and I want to call it 
with arguments on multpile lines I get:

    (my-great-function a
                       b c
                       d)

Or I can get:

    (my-great-function
      a b c d)

But what I really want is:

    (my-great-function a
      b c
      d)

In the normal lisp mode, we can use lispwords to control 
this.  So, for instance, we can do `set 
lispwords+=my-great-function` and get the solution we 
want.  But, this quickly gets tiresome, and you end up 
having to update the lispwords each session, or update 
your vimrc each time you use it.

This patch reverses this, and adds a hack to lispwords.  
Instead of assuming we always want to tab things in the 
length of the first function, we now tab in by the 
indent amount at each call.  We have added a `!` to the 
front of lispwords to indicate that these are the things 
we want to indent based on the length of the first 
element.  My default, in the scheme.vim of my akeep/vimrc 
project, I have:
  `if`, `or`, `and`, `+`, `-`, `*`, `/`, `<`, `=`, and `>` 
in there.  This is set with 
  `set lispwords=!if,or,and,+,-,*,/,<,=,>`.

Vim Yank Update
================

By default Vim yank leaves you at the mark that you 
yanked to, rather than the location you yanked from.  
For instance, if you have the following mark set:

| marks | code              |
|-------|-------------------|
| m     | (let ([x e] ---)  |
|       |   ---             |
|       |   ---)            |
|       |                   |
| >     | (foo ---)         |

Where `m` is your mark and `>` is your cursor, using 
Vim yank will leave your cursor at `m`.  Our patch 
allows you to tell Vim to leave your cursor at `>`. This 
is set by using `set yankleavecursor=1`.  If you don't 
like this, but you still want to apply the patch, just 
leave the yankleavecursor unset or set to 0 and you will 
get Vim's normal behavior with this.

Applying the patches
=====================

These patches have been tested with Vim 7.3 on Linux and 
with MacVim on Mac OS X, and applied successfully to 
both.  You should be aware that building Vim from source 
can be a bit of a pain if you are trying to make sure 
you get things like gvim, etc.  The trick here is really 
that you need to tell the configure script to look for 
the GUI interface (like X11, Gnome, Gtk+, etc.) that you 
want it to try.

If you are using a different version of Vim, and the 
patches fail for you, and you cannot get them to work, 
let me know.  (If you figure out how to fix it and want 
to send me the fix, that is also good.)

I have included the patches in two different ways:

1. A unified patch with all the changes in it, based on 
   the vim-7.3 tar ball
2. Individual file patches organized by the directory 
   that they fall in.  (This is the original version of 
   the patches and included here in case some parts
   give you fits.)

If you are using the combined patch (vim-patches.patch) 
you should be able to do the following within the vim73 
directory:

    patch -p2 < vim-patches.patch

Where the `-p2` strips off the first two levels of 
directories in the patch.

If you are individually patching the files you can do 
something like:

    patch normal.c < normal.c.patch

For each of the individual files.
