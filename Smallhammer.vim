"Cut the current s-expression
:map <F2> d%                  

"Copy the current s-expression
:map <F3> y%                 

"Swap s-expression with the next one (if there is a space betwween them)
:map <F4> d%/(<Enter>%p

"Run current s-expression through Petite and display the output
:map <F5> !%./petite_strip<Enter>

"Run entire file through Petite and display the output
:map <F6> gg!G./petite_strip<Enter>
