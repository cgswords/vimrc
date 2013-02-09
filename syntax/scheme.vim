"""" Based on:

" Vim syntax file
" Language:	Scheme (R5RS + some R6RS extras)
" Last Change:	2009 Nov 27
" Maintainer:	Sergey Khorev <sergey.khorev@gmail.com>
" Original author:	Dirk van Deun <dirk@igwe.vub.ac.be>

" This script incorrectly recognizes some junk input as numerals:
" parsing the complete system of Scheme numerals using the pattern
" language is practically impossible: I did a lax approximation.
 
" MzScheme extensions can be activated with setting is_mzscheme variable

" Suggestions and bug reports are solicited by the author.

"""" Local modifications by akeep@scheme.com and dyb@scheme.com

" Initializing:

" For version 5.x: Clear all syntax items
" For version 6.x: Quit when a syntax file was already loaded
if version < 600
  syntax clear
elseif exists("b:current_syntax")
  finish
endif

" leaving this for now, but shouldn't ignore case for identifiers
syn case ignore

" Fascist highlighting: everything that doesn't fit the rules is an error...

syn match	schemeError	![^ \t()\[\]";#]*!
syn match	schemeError	")"

" Literals

syn region schemeString start=+\%(\\\)\@<!"+ skip=+\\[\\"]+ end=+"+

" This is a useful lax approximation:
syn match	schemeNumber	"[-#+.]\=[0-9][-#+/0-9a-f@i.boxesfdl]*"
syn match	schemeError	![-#+0-9.][-#+/0-9a-f@i.boxesfdl]*[^-#+/0-9a-f@i.boxesfdl \t\[\]()";][^ \t\[\]()";]*!

syn match	schemeBoolean	"#[tf]"
syn match	schemeError	!#[tf][^ \t\[\]()";]\+!

syn match	schemeCharacter	"#\\"
syn match	schemeCharacter	"#\\."
syn match       schemeError	!#\\.[^ \t\[\]()";]\+!
syn match	schemeCharacter	"#\\space"
syn match	schemeError	!#\\space[^ \t\[\]()";]\+!
syn match	schemeCharacter	"#\\newline"
syn match	schemeError	!#\\newline[^ \t\[\]()";]\+!
syn match schemeCharacter "#\\x[0-9a-fA-F]\+"

" Quoted and backquoted stuff

syn region schemeQuoted matchgroup=Delimiter start="['`]" end=![ \t()\[\]";#]!me=e-1 contains=ALLBUT,schemeString,schemeStruc,schemeKwd,schemeVar
syn region schemeQuoted matchgroup=Delimiter start="#['`]" end=![ \t()\[\]";#]!me=e-1 contains=ALLBUT,schemeString,schemeStruc,schemeKwd,schemeVar

syn region schemeQuoted matchgroup=Delimiter start="['`](" matchgroup=Delimiter end=")" contains=ALLBUT,schemeString,schemeStruc,schemeKwd,schemeVar
syn region schemeQuoted matchgroup=Delimiter start="['`]#(" matchgroup=Delimiter end=")" contains=ALLBUT,schemeString,schemeStruc,schemeKwd,schemeVar
syn region schemeQuoted matchgroup=Delimiter start="['`]#vfx(" matchgroup=Delimiter end=")" contains=ALLBUT,schemeString,schemeStruc,schemeKwd,schemeVar
syn region schemeQuoted matchgroup=Delimiter start="['`]#vu8(" matchgroup=Delimiter end=")" contains=ALLBUT,schemeString,schemeStruc,schemeKwd,schemeVar
syn region schemeQuoted matchgroup=Delimiter start="#['`](" matchgroup=Delimiter end=")" contains=ALLBUT,schemeString,schemeStruc,schemeKwd,schemeVar
syn region schemeQuoted matchgroup=Delimiter start="#['`]#(" matchgroup=Delimiter end=")" contains=ALLBUT,schemeString,schemeStruc,schemeKwd,schemeVar
syn region schemeQuoted matchgroup=Delimiter start="#['`]#vfx(" matchgroup=Delimiter end=")" contains=ALLBUT,schemeString,schemeStruc,schemeKwd,schemeVar
syn region schemeQuoted matchgroup=Delimiter start="#['`]#vu8(" matchgroup=Delimiter end=")" contains=ALLBUT,schemeString,schemeStruc,schemeKwd,schemeVar

syn region schemeStrucRestricted matchgroup=Delimiter start="(" matchgroup=Delimiter end=")" contains=ALLBUT,schemeString,schemeStruc,schemeKwd,schemeVar
syn region schemeStrucRestricted matchgroup=Delimiter start="#(" matchgroup=Delimiter end=")" contains=ALLBUT,schemeString,schemeStruc,schemeKwd,schemeVar
syn region schemeStrucRestricted matchgroup=Delimiter start="#vfx(" matchgroup=Delimiter end=")" contains=ALLBUT,schemeString,schemeStruc,schemeKwd,schemeVar
syn region schemeStrucRestricted matchgroup=Delimiter start="#vu8(" matchgroup=Delimiter end=")" contains=ALLBUT,schemeString,schemeStruc,schemeKwd,schemeVar

" Popular Scheme extension:
" using [] as well as ()
syn region schemeStrucRestricted matchgroup=Delimiter start="\[" matchgroup=Delimiter end="\]" contains=ALLBUT,schemeString,schemeStruc,schemeKwd,schemeVar
syn region schemeStrucRestricted matchgroup=Delimiter start="#\[" matchgroup=Delimiter end="\]" contains=ALLBUT,schemeString,schemeStruc,schemeKwd,schemeVar

syn region schemeUnquote matchgroup=Delimiter start="," end=![ \t\[\]()";]!me=e-1 contains=ALLBUT,schemeString,schemeStruc,schemeKwd,schemeVar
syn region schemeUnquote matchgroup=Delimiter start=",@" end=![ \t\[\]()";]!me=e-1 contains=ALLBUT,schemeString,schemeStruc,schemeKwd,schemeVar
syn region schemeUnquote matchgroup=Delimiter start=",(" end=")" contains=ALL
syn region schemeUnquote matchgroup=Delimiter start=",@(" end=")" contains=ALL
syn region schemeUnquote matchgroup=Delimiter start=",#(" end=")" contains=ALLBUT,schemeString,schemeStruc,schemeKwd,schemeVar
syn region schemeUnquote matchgroup=Delimiter start=",@#(" end=")" contains=ALLBUT,schemeString,schemeStruc,schemeKwd,schemeVar
syn region schemeUnquote matchgroup=Delimiter start=",\[" end="\]" contains=ALL
syn region schemeUnquote matchgroup=Delimiter start=",@\[" end="\]" contains=ALL
syn region schemeUnquote matchgroup=Delimiter start=",#\[" end="\]" contains=ALLBUT,schemeString,schemeStruc,schemeKwd,schemeVar
syn region schemeUnquote matchgroup=Delimiter start=",@#\[" end="\]" contains=ALLBUT,schemeString,schemeStruc,schemeKwd,schemeVar

syn region schemeUnquote matchgroup=Delimiter start="#," end=![ \t\[\]()";]!me=e-1 contains=ALLBUT,schemeString,schemeStruc,schemeKwd,schemeVar
syn region schemeUnquote matchgroup=Delimiter start="#,@" end=![ \t\[\]()";]!me=e-1 contains=ALLBUT,schemeString,schemeStruc,schemeKwd,schemeVar
syn region schemeUnquote matchgroup=Delimiter start="#,(" end=")" contains=ALL
syn region schemeUnquote matchgroup=Delimiter start="#,@(" end=")" contains=ALL
syn region schemeUnquote matchgroup=Delimiter start="#,#(" end=")" contains=ALLBUT,schemeString,schemeStruc,schemeKwd,schemeVar
syn region schemeUnquote matchgroup=Delimiter start="#,@#(" end=")" contains=ALLBUT,schemeString,schemeStruc,schemeKwd,schemeVar
syn region schemeUnquote matchgroup=Delimiter start="#,\[" end="\]" contains=ALL
syn region schemeUnquote matchgroup=Delimiter start="#,@\[" end="\]" contains=ALL
syn region schemeUnquote matchgroup=Delimiter start="#,#\[" end="\]" contains=ALLBUT,schemeString,schemeStruc,schemeKwd,schemeVar
syn region schemeUnquote matchgroup=Delimiter start="#,@#\[" end="\]" contains=ALLBUT,schemeString,schemeStruc,schemeKwd,schemeVar

" R5RS Scheme Functions and Syntax:

if version < 600
  set iskeyword=33,35-39,42-58,60-90,94,95,97-122,126,_
else
  setlocal iskeyword=33,35-39,42-58,60-90,94,95,97-122,126,_
endif

" ... so that a single + or -, inside a quoted context, would not be
" interpreted as a number (outside such contexts, it's a schemeVar)

syn match	schemeDelimiter	!\.[ \t\[\]()";]!me=e-1
syn match	schemeDelimiter	!\.$!
" ... and a single dot is not a number but a delimiter

" This keeps all other stuff unhighlighted, except *stuff* and <stuff>:

syn match	schemeOther	,[a-z!$%&*/:<=>?^_~+@%-][-a-z!$%&*/:<=>?^_~0-9+.@%]*,
syn match	schemeError	,[a-z!$%&*/:<=>?^_~+@%-][-a-z!$%&*/:<=>?^_~0-9+.@%]*[^-a-z!$%&*/:<=>?^_~0-9+.@ \t\[\]()";]\+[^ \t\[\]()";]*,

syn match	schemeOther	"\.\.\."
syn match	schemeError	!\.\.\.[^ \t\[\]()";]\+!
" ... a special identifier

syn match	schemeConstant	,\*[-a-z!$%&*/:<=>?^_~0-9+.@]\+\*[ \t\[\]()";],me=e-1
syn match	schemeConstant	,\*[-a-z!$%&*/:<=>?^_~0-9+.@]\+\*$,
syn match	schemeError	,\*[-a-z!$%&*/:<=>?^_~0-9+.@]*\*[^-a-z!$%&*/:<=>?^_~0-9+.@ \t\[\]()";]\+[^ \t\[\]()";]*,

syn match	schemeConstant	,<[-a-z!$%&*/:<=>?^_~0-9+.@]*>[ \t\[\]()";],me=e-1
syn match	schemeConstant	,<[-a-z!$%&*/:<=>?^_~0-9+.@]*>$,
syn match	schemeError	,<[-a-z!$%&*/:<=>?^_~0-9+.@]*>[^-a-z!$%&*/:<=>?^_~0-9+.@ \t\[\]()";]\+[^ \t\[\]()";]*,

" Non-quoted lists:

syn region schemeStruc matchgroup=Delimiter start="(" matchgroup=Delimiter end=")" contains=ALL
syn region schemeStruc matchgroup=Delimiter start="#(" matchgroup=Delimiter end=")" contains=ALL

syn region schemeStruc matchgroup=Delimiter start="\[" matchgroup=Delimiter end="\]" contains=ALL
syn region schemeStruc matchgroup=Delimiter start="#\[" matchgroup=Delimiter end="\]" contains=ALL

" Comments:

syn match schemeComment "[^#];.*$"
syn match schemeComment "^;.*$"
syn match schemeCommentNB "[^#];* NB.*$"
syn match schemeCommentNB "^;* NB.*$"
syn region schemeMultilineComment start="#|" end="|#" contains=schemeMultilineComment

" Datum comments (treated structured ones as ordinary non-quoted lists)
syn match schemeComment "#;"

syn region schemeStruc matchgroup=Comment start="#;\s*(" matchgroup=Comment end=")" contains=ALL
syn region schemeStruc matchgroup=Comment start="#;\s*#(" matchgroup=Comment end=")" contains=ALL

syn region schemeStruc matchgroup=Comment start="#;\s*\[" matchgroup=Delimiter end="\]" contains=ALL
syn region schemeStruc matchgroup=Comment start="#;\s*#\[" matchgroup=Delimiter end="\]" contains=ALL

" Writing out the complete description of Scheme numerals without
" using variables is a day's work for a trained secretary...

syn match	schemeOther	![+-][ \t\[\]()";]!me=e-1
syn match	schemeOther	![+-]$!

" Synchronization and the wrapping up...

syn sync match matchPlace grouphere NONE "^[^ \t]"
" ... i.e. synchronize on a line that starts at the left margin

" Define the default highlighting.
" For version 5.7 and earlier: only when not done already
" For version 5.8 and later: only when an item doesn't have highlighting yet
if version >= 508 || !exists("did_scheme_syntax_inits")
  if version < 508
    let did_scheme_syntax_inits = 1
    command -nargs=+ HiLink hi link <args>
  else
    command -nargs=+ HiLink hi def link <args>
  endif

  HiLink schemeKwd		Statement
  HiLink schemeVar		Function

  HiLink schemeString		String
  HiLink schemeCharacter	Character
  HiLink schemeNumber		Number
  HiLink schemeBoolean		Boolean

  HiLink schemeDelimiter	Delimiter
  HiLink schemeConstant		Constant

  HiLink schemeComment		Comment
  HiLink schemeCommentNB	CommentNB
  HiLink schemeMultilineComment	Comment
  HiLink schemeError		Error

  HiLink schemeExtSyntax	Type
  HiLink schemeExtFunc		PreProc
  delcommand HiLink
endif

" identifiers to highlight

" (define foo
"   (lambda (cat pred)
"     (with-output-to-file (format "/tmp/~a.vim" cat)
"       (lambda ()
"         (printf (format "syn keyword scheme~a~~{~~<\nsyn keyword scheme~a~~1:; ~~a~~>~~^~~}\n" cat cat)
"           (filter pred (environment-symbols (environment '(scheme))))))
"       'replace)))
" (printf "\" ~a" (scheme-version))
" (foo "Var" top-level-bound?)
" (foo "Kwd" (lambda (x) (not (top-level-bound? x))))

" Chez Scheme Version 8.1
syn keyword schemeKwd expression-editor define-record-type
syn keyword schemeKwd with-interrupts-disabled quote when trace time
syn keyword schemeKwd record-case implicit-exports only
syn keyword schemeKwd define-enumeration set! &i/o-write
syn keyword schemeKwd &i/o-file-already-exists meta prefix &syntax let*
syn keyword schemeKwd trace-case-lambda ieee else r6rs:case cond
syn keyword schemeKwd &no-infinities r5rs case rename eval-when opaque
syn keyword schemeKwd sealed syntax-case scheme let-values
syn keyword schemeKwd &i/o-file-is-read-only guard &source
syn keyword schemeKwd library-group trace-define buffer-mode &no-nans
syn keyword schemeKwd quasiquote &i/o-file-does-not-exist &violation
syn keyword schemeKwd module trace-define-syntax trace-let parent
syn keyword schemeKwd &undefined r5rs-syntax
syn keyword schemeKwd record-constructor-descriptor define-syntax datum
syn keyword schemeKwd delay $system alias record-type-descriptor
syn keyword schemeKwd indirect-export &continuation protocol begin
syn keyword schemeKwd type-descriptor quasisyntax letrec let*-values
syn keyword schemeKwd &i/o-decoding unsyntax-splicing import
syn keyword schemeKwd file-options &who export foreign-procedure
syn keyword schemeKwd foreign-callable &warning unsyntax add-prefix
syn keyword schemeKwd &i/o &i/o-file-protection import-only eol-style
syn keyword schemeKwd predicate lambda extend-syntax except
syn keyword schemeKwd letrec-syntax define-values define-property
syn keyword schemeKwd unquote-splicing drop-prefix constructor
syn keyword schemeKwd syntax-rules &i/o-filename define-condition-type
syn keyword schemeKwd with-syntax $primitive
syn keyword schemeKwd &implementation-restriction immutable
syn keyword schemeKwd &i/o-encoding identifier-syntax nongenerative rec
syn keyword schemeKwd fields let &message assert error-handling-mode
syn keyword schemeKwd and fluid-let-syntax letrec* define-record
syn keyword schemeKwd trace-do top-level-program case-lambda &assertion
syn keyword schemeKwd syntax &error &irritants &non-continuable
syn keyword schemeKwd critical-section &condition library &lexical
syn keyword schemeKwd &i/o-invalid-position with-implicit define ...
syn keyword schemeKwd unless &format &serious endianness trace-lambda
syn keyword schemeKwd mutable or if do define-structure let-syntax
syn keyword schemeKwd r6rs:syntax-rules parent-rtd => parameterize
syn keyword schemeKwd fluid-let &i/o-port _ unquote untrace meta-cond
syn keyword schemeKwd &i/o-read include

syn keyword schemeVar caddar r6rs:string-ci>? r6rs:string-ci=?
syn keyword schemeVar r6rs:string-ci<? cadadr bytevector->string
syn keyword schemeVar with-input-from-file cadaar foreign-free visit
syn keyword schemeVar values native-eol-style i/o-encoding-error?
syn keyword schemeVar gensym->unique-string set-port-output-index!
syn keyword schemeVar caaddr subst caadar ieee-environment
syn keyword schemeVar bitwise-bit-count caaadr caaaar void unbox
syn keyword schemeVar make-eqv-hashtable output-port-buffer-mode
syn keyword schemeVar get-output-string sqrt record-type-parent
syn keyword schemeVar pretty-print make-no-infinities-violation
syn keyword schemeVar default-prompt-and-read sort time>? time=?
syn keyword schemeVar fxnegative? time<? string-fill! pretty-format
syn keyword schemeVar profile-dump-list sort! make-fxvector
syn keyword schemeVar string-copy! round integer? bitwise-bit-field
syn keyword schemeVar ratnum? bitwise-arithmetic-shift-right
syn keyword schemeVar profile-dump-html random-seed sub1 fixnum-width
syn keyword schemeVar record-rtd make-hashtable bytevector-u8-set! sinh
syn keyword schemeVar printf input-port? engine-block fxmodulo
syn keyword schemeVar record-constructor-descriptor?
syn keyword schemeVar s8-list->bytevector string? tanh file-port? remv
syn keyword schemeVar remq remp symbol->string bytevector?
syn keyword schemeVar char->integer get-mode time? put-u8
syn keyword schemeVar string->symbol read string-for-each sleep
syn keyword schemeVar csv7:record-type-field-decls get-line
syn keyword schemeVar scheme-start literal-identifier=? r6rs:exit
syn keyword schemeVar string-normalize-nfkd string-normalize-nfkc
syn keyword schemeVar bytevector-u32-native-set! environment-mutable?
syn keyword schemeVar fxlogxor make-engine load-shared-object port?
syn keyword schemeVar list sstats-difference boolean? bytevector
syn keyword schemeVar i/o-error-filename load r6rs:eval vector-length
syn keyword schemeVar port-name memv make-irritants-condition memq memp
syn keyword schemeVar mod0 r6rs:flush-output-port iota
syn keyword schemeVar bytevector-u16-native-set! ormap odd? expt
syn keyword schemeVar hashtable? record-writer fxif fxlognot
syn keyword schemeVar source-condition? null? cfl-imag-part
syn keyword schemeVar bytevector-s8-ref exit nan? sstats? reset
syn keyword schemeVar with-input-from-string
syn keyword schemeVar set-textual-port-input-buffer! case-sensitive
syn keyword schemeVar fxlogior read-char most-negative-fixnum eval
syn keyword schemeVar syntax->vector textual-port-output-size
syn keyword schemeVar string-ref fllp eqv? make-weak-eq-hashtable
syn keyword schemeVar port-output-buffer string-normalize-nfd
syn keyword schemeVar string-normalize-nfc remv! fprintf fx*/carry
syn keyword schemeVar greatest-fixnum remq! find condition-accessor
syn keyword schemeVar port-eof? cosh assv cons fxlogand assq assp
syn keyword schemeVar datum->syntax cpu-time current-error-port
syn keyword schemeVar get-char fx>? fx>= fx=? asin record? fx<?
syn keyword schemeVar condition-predicate fx<= fxremainder
syn keyword schemeVar disable-interrupts vector-set-fixnum! box? atan
syn keyword schemeVar raise port-bol? utf-8-codec string-set!
syn keyword schemeVar print-record make-i/o-file-protection-error div0
syn keyword schemeVar path-absolute? real? remove r6rs:string>?
syn keyword schemeVar r6rs:string=? fx1- fx1+ r6rs:string<?
syn keyword schemeVar get-string-some! imag-part
syn keyword schemeVar revert-interaction-semantics
syn keyword schemeVar make-custom-binary-output-port
syn keyword schemeVar make-custom-binary-input/output-port cddr
syn keyword schemeVar bitwise-reverse-bit-field cdar bytes-allocated
syn keyword schemeVar cfl= fl>? partition
syn keyword schemeVar make-custom-textual-input/output-port fl>= fl=?
syn keyword schemeVar transcript-on fl<? fl<= syntax-violation-form
syn keyword schemeVar cfl/ cfl- cadr acos cfl+ cfl* current-transcoder
syn keyword schemeVar caar exact-integer-sqrt r6rs:current-error-port
syn keyword schemeVar set-time-nanosecond! date-zone-offset logor
syn keyword schemeVar inexact->exact csv7:record-field-mutable?
syn keyword schemeVar directory-separator i/o-write-error? isqrt
syn keyword schemeVar standard-output-port date-year directory-list
syn keyword schemeVar make-parameter add1 mkdir pair? buffer-mode?
syn keyword schemeVar petite? syntax-violation?
syn keyword schemeVar r6rs:with-output-to-file list? fxxor
syn keyword schemeVar collect-notify i/o-invalid-position-error? list*
syn keyword schemeVar char-alphabetic? port-transcoder
syn keyword schemeVar trace-output-port syntax->datum bignum? merge
syn keyword schemeVar fxsrl cp0-outer-unroll-limit fxsra string-hash
syn keyword schemeVar string-copy fxsll string-ci>=?
syn keyword schemeVar make-i/o-invalid-position-error
syn keyword schemeVar fxrotate-bit-field rationalize fxnot
syn keyword schemeVar record-predicate string-ci<=? r6rs:delete-file
syn keyword schemeVar call/1cc char-foldcase r6rs:standard-input-port
syn keyword schemeVar fxmod substv! make-variable-transformer fxmin
syn keyword schemeVar r6rs:with-input-from-file set-sstats-bytes!
syn keyword schemeVar close-input-port u8-list->bytevector substq!
syn keyword schemeVar fxmax fxior make-lexical-violation
syn keyword schemeVar register-signal-handler debug-on-exception
syn keyword schemeVar flzero? file-directory? file-symbolic-link?
syn keyword schemeVar textual-port? bytevector-s32-native-set!
syn keyword schemeVar hashtable-mutable? hashtable-hash-function
syn keyword schemeVar undefined-violation? for-each record-type-name
syn keyword schemeVar fxdiv make-i/o-filename-error i/o-error-port
syn keyword schemeVar get-string-all load-program last-pair random
syn keyword schemeVar fxand expand/optimize ceiling
syn keyword schemeVar pretty-standard-indent call-with-output-file
syn keyword schemeVar fxabs bytevector-s16-native-set!
syn keyword schemeVar format-condition? block-write file-access-time
syn keyword schemeVar fxvector->list date-hour fxlength compile-script
syn keyword schemeVar make-source-condition display-statistics
syn keyword schemeVar make-compile-time-value error weak-cons
syn keyword schemeVar null-environment sstats-cpu string-ci>?
syn keyword schemeVar string-ci=? exact string-ci<? utf32->string force
syn keyword schemeVar read-token library-list current-directory even?
syn keyword schemeVar make-string vector-for-each foreign-sizeof
syn keyword schemeVar vector->list set-port-input-size! flsin floor
syn keyword schemeVar make-i/o-file-is-read-only-error fltan r6rs:>=
syn keyword schemeVar r6rs:<= generate-interrupt-trap
syn keyword schemeVar make-syntax-violation denominator get-thread-id
syn keyword schemeVar modulo make-sstats flmod fllog flmin flmax
syn keyword schemeVar reverse! compile-interpret-simple string->utf32
syn keyword schemeVar flexp flround string->utf16 record-field-mutable?
syn keyword schemeVar r6rs:current-output-port transcoded-port
syn keyword schemeVar no-infinities-violation? with-output-to-string
syn keyword schemeVar make-i/o-file-does-not-exist-error flcos
syn keyword schemeVar hash-table-map fldiv bytevector-u32-native-ref
syn keyword schemeVar profile-dump eq-hashtable-contains? truncate-port
syn keyword schemeVar i/o-decoding-error? make-transcoder logxor
syn keyword schemeVar record-constructor timer-interrupt-handler
syn keyword schemeVar port-handler string-length char>=?
syn keyword schemeVar eq-hashtable-ref flabs char<=? latin-1-codec
syn keyword schemeVar assoc integer->char textual-port-output-index
syn keyword schemeVar binary-port-input-index enum-set-member?
syn keyword schemeVar binary-port-output-index r6rs:record? bitwise-xor
syn keyword schemeVar with-output-to-file
syn keyword schemeVar make-non-continuable-violation
syn keyword schemeVar get-bytevector-some cons* lognot
syn keyword schemeVar csv7:record-type-symbol fldenominator
syn keyword schemeVar bitwise-first-bit-set r6rs:call-with-output-file
syn keyword schemeVar set-time-second! cp0-effort-limit
syn keyword schemeVar make-i/o-write-error atom? simple-conditions
syn keyword schemeVar fasl-write most-positive-fixnum display-condition
syn keyword schemeVar get-hash-table console-error-port
syn keyword schemeVar char-title-case? logior asinh
syn keyword schemeVar textual-port-input-size apply equal-hash break
syn keyword schemeVar bitwise-not clear-output-port fx>=?
syn keyword schemeVar make-message-condition atanh standard-input-port
syn keyword schemeVar directory-separator? iconv-codec fx<=?
syn keyword schemeVar open-string-input-port enum-set-difference
syn keyword schemeVar set-port-output-buffer! bytevector-s32-native-ref
syn keyword schemeVar boolean=? condition? bitwise-ior
syn keyword schemeVar bytevector-s32-set! logand eq-hashtable-set!
syn keyword schemeVar flonum? fixnum? positive? chmod set-port-name!
syn keyword schemeVar fxlogtest sstats-gc-bytes bytevector-s8-set!
syn keyword schemeVar flceiling port-length
syn keyword schemeVar make-i/o-file-already-exists-error
syn keyword schemeVar non-continuable-violation? date-second
syn keyword schemeVar bitwise-and utf-16-codec
syn keyword schemeVar csv7:record-type-descriptor angle put-bytevector
syn keyword schemeVar file-length char-ci>=? print-brackets
syn keyword schemeVar set-port-eof! oblist char-whitespace?
syn keyword schemeVar profile-palette debug r6rs:fx- r6rs:fx+ r6rs:fx*
syn keyword schemeVar bytevector-copy char-ci<=? port-output-size
syn keyword schemeVar make-weak-eqv-hashtable truncate-file
syn keyword schemeVar textual-port-output-count putprop
syn keyword schemeVar binary-port-input-count file-change-time
syn keyword schemeVar hashtable-clear! waiter-prompt-and-read
syn keyword schemeVar binary-port-output-count scheme-environment date?
syn keyword schemeVar irritants-condition? condition utf-16le-codec
syn keyword schemeVar set-port-bol! char? put-string-some
syn keyword schemeVar r6rs:standard-output-port least-fixnum
syn keyword schemeVar current-exception-state clear-input-port
syn keyword schemeVar set-binary-port-output-buffer! binary-port? char-
syn keyword schemeVar fxfirst-bit-set set-textual-port-output-size!
syn keyword schemeVar scheme-version-number open-input-file warning
syn keyword schemeVar set-sstats-gc-bytes! sstats-gc-count
syn keyword schemeVar csv7:record-type-name bitwise-rotate-bit-field
syn keyword schemeVar char-downcase who-condition? date->time-utc
syn keyword schemeVar profile-clear cdddr bytevector-length cddar
syn keyword schemeVar print-length cdadr bytevector-u64-ref
syn keyword schemeVar string->number compile-port cfl-magnitude-squared
syn keyword schemeVar bytevector->uint-list vector-sort! cdaar
syn keyword schemeVar suppress-greeting enum-set-projection
syn keyword schemeVar dynamic-wind fl>=? acosh i/o-filename-error?
syn keyword schemeVar record-type-generative? open-string-output-port
syn keyword schemeVar fl<=? abort caddr merge! display-string cadar
syn keyword schemeVar flinfinite? generate-inspector-information
syn keyword schemeVar make-custom-textual-input-port caadr
syn keyword schemeVar with-exception-handler current-output-port
syn keyword schemeVar open-output-file caaar load-library negative?
syn keyword schemeVar make-vector path-root import-notify date-day
syn keyword schemeVar fold-right bitwise-arithmetic-shift-left
syn keyword schemeVar eq-hashtable-cell newline port-closed?
syn keyword schemeVar inspect/object fasl-read member make-bytevector
syn keyword schemeVar put-bytevector-some subset-mode
syn keyword schemeVar open-bytevector-output-port transcoder-eol-style
syn keyword schemeVar r6rs:string->number date-and-time
syn keyword schemeVar r6rs:open-input-file bytevector-u64-native-ref
syn keyword schemeVar path-rest enum-set-universe
syn keyword schemeVar foreign-callable-entry-point enum-set=?
syn keyword schemeVar i/o-error-position rational-valued?
syn keyword schemeVar r6rs:open-output-file cp0-score-limit
syn keyword schemeVar make-i/o-encoding-error bytevector-s16-set!
syn keyword schemeVar getprop fxvector? binary-port-input-size logtest
syn keyword schemeVar pretty-line-length delete-file scheme-version
syn keyword schemeVar set-port-length! get-datum fxmod0
syn keyword schemeVar heap-reserve-ratio fxlogbit? eq-hashtable-delete!
syn keyword schemeVar list->string fxlogbit1 set-sstats-cpu!
syn keyword schemeVar lookahead-char fxlogbit0 length
syn keyword schemeVar bitwise-copy-bit-field fxodd? fltruncate
syn keyword schemeVar port-position fixnum->flonum flonum->fixnum
syn keyword schemeVar string-ci-hash pretty-one-line-limit
syn keyword schemeVar gensym-prefix compile-file rename-file
syn keyword schemeVar bytevector-ieee-double-native-ref numerator
syn keyword schemeVar set-sstats-gc-count! r6rs:char>=? path-last
syn keyword schemeVar bytevector-u32-set! fasl-file r6rs:char<=?
syn keyword schemeVar bytevector-s64-native-ref sstats-real symbol=?
syn keyword schemeVar top-level-value open-file-input/output-port
syn keyword schemeVar bytevector-ieee-single-native-ref
syn keyword schemeVar get-bytevector-all print-precision exists
syn keyword schemeVar make-continuation-condition expand
syn keyword schemeVar make-custom-binary-input-port fleven?
syn keyword schemeVar string-foldcase call/cc syntax-violation-subform
syn keyword schemeVar implementation-restriction-violation? fxdiv0
syn keyword schemeVar get-bytevector-n! file-position flfloor
syn keyword schemeVar i/o-read-error? r6rs:string-ci>=? unget-u8
syn keyword schemeVar create-exception-state r6rs:string-ci<=?
syn keyword schemeVar textual-port-input-buffer hash-table?
syn keyword schemeVar textual-port-input-index binary-port-input-buffer
syn keyword schemeVar inexact? bytevector-u64-native-set!
syn keyword schemeVar make-boot-header remainder date-minute write-char
syn keyword schemeVar bytevector-ieee-single-set!
syn keyword schemeVar fxarithmetic-shift-right bytevector-sint-set!
syn keyword schemeVar environment uint-list->bytevector gensym?
syn keyword schemeVar open-fd-input/output-port reset-handler
syn keyword schemeVar set-textual-port-input-index! path-parent
syn keyword schemeVar bytevector-ieee-single-ref
syn keyword schemeVar set-binary-port-input-buffer! collect-trip-bytes
syn keyword schemeVar truncate bytevector->u8-list
syn keyword schemeVar make-i/o-decoding-error for-all
syn keyword schemeVar r6rs:record-constructor file-regular?
syn keyword schemeVar record-accessor date-week-day
syn keyword schemeVar pretty-maximum-lines
syn keyword schemeVar set-textual-port-output-index! vector?
syn keyword schemeVar syntax->list serious-condition? set-timer
syn keyword schemeVar make-warning finite? logbit? fxdiv0-and-mod0
syn keyword schemeVar logbit1 logbit0 errorf enum-set-indexer
syn keyword schemeVar record-type-descriptor? quotient library-exports
syn keyword schemeVar put-string set-sstats-gc-real! error?
syn keyword schemeVar port-has-port-position? scheme-report-environment
syn keyword schemeVar format enum-set-intersection bwp-object?
syn keyword schemeVar textual-port-input-count remove-foreign-entry
syn keyword schemeVar hashtable-delete! make-hash-table
syn keyword schemeVar char-general-category exact?
syn keyword schemeVar open-bytevector-input-port list-ref
syn keyword schemeVar bytevector-u32-ref bytevector-u16-set!
syn keyword schemeVar command-line run-cp0 hashtable-size
syn keyword schemeVar datum->syntax-object substring-fill!
syn keyword schemeVar assertion-violationf char-upcase
syn keyword schemeVar port-has-set-port-position!? syntax-violation
syn keyword schemeVar condition-message equal? flsqrt
syn keyword schemeVar open-file-output-port make-polar
syn keyword schemeVar library-object-filename expt-mod
syn keyword schemeVar assertion-violation? waiter-prompt-string
syn keyword schemeVar exact->inexact foreign-alloc
syn keyword schemeVar call-with-current-continuation remove-hash-table!
syn keyword schemeVar print-radix enum-set->list statistics
syn keyword schemeVar hashtable-set! bytevector-u16-ref list->vector
syn keyword schemeVar raise-continuable pretty-file print-gensym
syn keyword schemeVar eq-hashtable-update!
syn keyword schemeVar make-implementation-restriction-violation
syn keyword schemeVar hashtable-equivalence-function
syn keyword schemeVar set-port-input-buffer!
syn keyword schemeVar call-with-bytevector-output-port string->utf8
syn keyword schemeVar char-upper-case? hashtable-keys cfl-real-part
syn keyword schemeVar open-fd-output-port fresh-line set-port-position!
syn keyword schemeVar current-input-port flush-output-port
syn keyword schemeVar print-char-name csv7:record-field-accessor
syn keyword schemeVar open-fd-input-port file-exists? lock-object
syn keyword schemeVar char-name current-time record-reader
syn keyword schemeVar fxvector-fill! bytevector-u16-native-ref
syn keyword schemeVar native-endianness fxreverse-bit-field vector-ref
syn keyword schemeVar real-time set-port-output-size! print-level
syn keyword schemeVar flmod0 fxcopy-bit-field fxzero?
syn keyword schemeVar bytevector-s64-native-set! library-directories
syn keyword schemeVar string>=? port-input-size vector-map
syn keyword schemeVar set-time-type! complex? date-nanosecond
syn keyword schemeVar time-second flodd? flexpt eq-hashtable? string<=?
syn keyword schemeVar vector-sort with-source-path hashtable-copy
syn keyword schemeVar flnan? vector-fill! make-undefined-violation
syn keyword schemeVar r6rs:current-input-port string-append
syn keyword schemeVar r6rs:utf-16-codec flfinite? apropos-list
syn keyword schemeVar lexical-violation? list->fxvector
syn keyword schemeVar make-custom-textual-output-port
syn keyword schemeVar i/o-file-protection-error? string->list getenv
syn keyword schemeVar real-part gensym string-downcase compile
syn keyword schemeVar make-no-nans-violation time>=? filter
syn keyword schemeVar hashtable-cell fl-make-rectangular bytevector=?
syn keyword schemeVar time<=? r6rs:char>? custom-port-buffer-size
syn keyword schemeVar r6rs:char=? bytevector-s16-native-ref
syn keyword schemeVar copy-environment r6rs:char<? eof-object?
syn keyword schemeVar make-output-port make-rectangular vector-set!
syn keyword schemeVar process flasin print-graph bytevector-s64-ref
syn keyword schemeVar flatan fldiv0 optimize-level path-first
syn keyword schemeVar free-identifier=? get-process-id
syn keyword schemeVar r6rs:dynamic-wind current-eval fxvector-set!
syn keyword schemeVar fxnonpositive? port-output-index transcoder?
syn keyword schemeVar fx-/carry set-textual-port-output-buffer!
syn keyword schemeVar compile-compressed port-file-descriptor
syn keyword schemeVar native-transcoder call-with-input-file
syn keyword schemeVar port-output-full? open-file-input-port violation?
syn keyword schemeVar enum-set-union call-with-values flacos
syn keyword schemeVar path-extension char-ci>? char-ci=? char-ci<?
syn keyword schemeVar make-serious-condition sin list-sort
syn keyword schemeVar utf-16be-codec environment-symbols
syn keyword schemeVar make-record-constructor-descriptor tan display
syn keyword schemeVar nonpositive? not transcoder-codec collect mod
syn keyword schemeVar unlock-object port-has-port-length? log min
syn keyword schemeVar define-top-level-value binary-port-output-buffer
syn keyword schemeVar char-numeric? max hashtable-update! current-date
syn keyword schemeVar assertion-violation map make-error exp procedure?
syn keyword schemeVar r6rs:standard-error-port debug-condition lcm
syn keyword schemeVar record-type-opaque? magnitude-squared
syn keyword schemeVar hash-table-for-each vector-copy
syn keyword schemeVar print-vector-length enum-set? fx> cos fx= fx< box
syn keyword schemeVar div record-type-sealed? fx/ gcd fx- ash fx+
syn keyword schemeVar hashtable-ref list-tail fx* eq? date-year-day
syn keyword schemeVar continuation-condition? cdr fl> bytevector-fill!
syn keyword schemeVar fl= fl< bytevector-copy! car port-input-index fl/
syn keyword schemeVar fxarithmetic-shift fl- fl+ abort-handler fl*
syn keyword schemeVar fxvector-copy abs csv7:record-field-mutator
syn keyword schemeVar system bound-identifier=? port-output-count
syn keyword schemeVar make-input-port enum-set-subset?
syn keyword schemeVar make-record-type-descriptor compile-program
syn keyword schemeVar fxvector-ref fxarithmetic-shift-left interactive?
syn keyword schemeVar get-bytevector-some! rational? string-upcase
syn keyword schemeVar inspect put-hash-table!
syn keyword schemeVar i/o-file-is-read-only-error? fxnonnegative?
syn keyword schemeVar fold-left substring make-assertion-violation
syn keyword schemeVar get-u8 compile-profile
syn keyword schemeVar set-binary-port-output-size! put-datum make-time
syn keyword schemeVar port-has-port-nonblocking?? enum-set-complement
syn keyword schemeVar generate-temporaries i/o-port-error?
syn keyword schemeVar set-top-level-value! bitwise-length
syn keyword schemeVar set-port-input-index! warningf make-record-type
syn keyword schemeVar div0-and-mod0 flnonpositive? nonnegative?
syn keyword schemeVar warning? current-expand
syn keyword schemeVar i/o-file-already-exists-error?
syn keyword schemeVar bytevector-truncate! scheme-program
syn keyword schemeVar hashtable-entries port-input-empty?
syn keyword schemeVar source-condition-form list-copy fxvector
syn keyword schemeVar fxbit-count port-input-count append
syn keyword schemeVar top-level-bound? list-head
syn keyword schemeVar collect-request-handler string-truncate!
syn keyword schemeVar sint-list->bytevector console-input-port
syn keyword schemeVar peek-char pretty-initial-indent bitwise-bit-set?
syn keyword schemeVar fldiv0-and-mod0 char-titlecase
syn keyword schemeVar bytevector-s64-set! make-list
syn keyword schemeVar port-has-set-port-nonblocking!? fxbit-field
syn keyword schemeVar bytevector->s8-list sstats-print set-sstats-real!
syn keyword schemeVar apropos syntax-object->datum fxlogor exit-handler
syn keyword schemeVar symbol-hash div-and-mod identifier?
syn keyword schemeVar make-enumeration get-string-some
syn keyword schemeVar make-i/o-read-error decode-float time-utc->date
syn keyword schemeVar call-with-string-output-port bytevector-sint-ref
syn keyword schemeVar top-level-syntax enumerate
syn keyword schemeVar keyboard-interrupt-handler get-string-n
syn keyword schemeVar fxdiv-and-mod real->flonum
syn keyword schemeVar default-exception-handler record-type-uid
syn keyword schemeVar r6rs:string>=? fxquotient open-input-output-file
syn keyword schemeVar foreign-ref r6rs:string<=? unget-char string
syn keyword schemeVar weak-pair? standard-error-port flnonnegative?
syn keyword schemeVar bitwise-copy-bit revisit record-type-field-names
syn keyword schemeVar internal-defines-as-letrec* bitwise-if
syn keyword schemeVar condition-continuation close-output-port
syn keyword schemeVar utf16->string bytevector-s32-ref fxvector-length
syn keyword schemeVar syntax-error time-type string>? string=?
syn keyword schemeVar r6rs:command-line string<? foreign-entry?
syn keyword schemeVar mark-port-closed! gensym-count fldiv-and-mod
syn keyword schemeVar make-date flpositive? number? reverse threaded?
syn keyword schemeVar collect-generation-radix transcript-off
syn keyword schemeVar scheme-script compile-imported-libraries
syn keyword schemeVar infinite? block-read make-guardian date-month -1+
syn keyword schemeVar sstats-gc-cpu andmap r6rs:call-with-input-file
syn keyword schemeVar port-input-buffer bytevector-s16-ref sc-expand
syn keyword schemeVar engine-return library-extensions substv substq
syn keyword schemeVar port-nonblocking? make-who-condition
syn keyword schemeVar make-boot-file top-level-mutable? record-mutator
syn keyword schemeVar bytevector-uint-set! base-exception-handler
syn keyword schemeVar char-ready? file-buffer-size fxeven?
syn keyword schemeVar r6rs:char-ci>? subst! char-lower-case?
syn keyword schemeVar r6rs:char-ci=? r6rs:char-ci<? break-handler
syn keyword schemeVar set-binary-port-input-index! r6rs:> r6rs:=
syn keyword schemeVar condition-who r6rs:< put-char delete-directory
syn keyword schemeVar bitwise-arithmetic-shift open-input-string
syn keyword schemeVar set-sstats-gc-cpu! cfl-conjugate
syn keyword schemeVar string->bytevector r6rs:file-exists?
syn keyword schemeVar string-titlecase close-port make-violation
syn keyword schemeVar set-box! make-i/o-port-error utf8->string char>?
syn keyword schemeVar property-list char=? input-port-ready? char<?
syn keyword schemeVar interaction-environment call-with-port
syn keyword schemeVar binary-port-output-size append!
syn keyword schemeVar csv7:record-type-field-names
syn keyword schemeVar define-top-level-syntax cd waiter-write
syn keyword schemeVar file-modification-time output-port? interpret
syn keyword schemeVar compile-library set-binary-port-output-index!
syn keyword schemeVar magnitude bytevector-ieee-double-native-set!
syn keyword schemeVar flnegative? bytevector-u64-set! symbol? set-cdr!
syn keyword schemeVar collect-maximum-generation time-nanosecond
syn keyword schemeVar condition-irritants transcript-cafe set-car!
syn keyword schemeVar make-input/output-port fxbit-set?
syn keyword schemeVar make-eq-hashtable inexact
syn keyword schemeVar port-has-set-port-length!?
syn keyword schemeVar csv7:record-field-accessible? i/o-error?
syn keyword schemeVar make-format-condition get-string-n!
syn keyword schemeVar top-level-syntax? remprop
syn keyword schemeVar textual-port-output-buffer console-output-port
syn keyword schemeVar bytevector-ieee-double-set!
syn keyword schemeVar set-binary-port-input-size! hashtable-weak?
syn keyword schemeVar source-directories >= eof-object
syn keyword schemeVar library-requirements <= open-process-ports
syn keyword schemeVar set-textual-port-input-size! cddddr new-cafe
syn keyword schemeVar bytevector-uint-ref cdddar conjugate
syn keyword schemeVar library-version print-unicode open-output-string
syn keyword schemeVar putenv cddadr write cddaar 1- 1+ lookahead-u8
syn keyword schemeVar number->string cflonum? remove! fxpositive?
syn keyword schemeVar eq-hashtable-weak? foreign-set! real-valued?
syn keyword schemeVar flinteger? cdaddr cdadar fx+/carry unread-char
syn keyword schemeVar eval-syntax-expanders-when cdaadr sstats-bytes
syn keyword schemeVar zero? cdaaar environment? r6rs:char-ci>=?
syn keyword schemeVar bytevector-ieee-single-native-set! fxcopy-bit
syn keyword schemeVar sstats-gc-real r6rs:char-ci<=?
syn keyword schemeVar i/o-file-does-not-exist-error? flnumerator
syn keyword schemeVar trace-print machine-type bytevector->sint-list
syn keyword schemeVar set-port-nonblocking! message-condition?
syn keyword schemeVar transcoder-error-handling-mode > = < vector
syn keyword schemeVar bytevector-ieee-double-ref /
syn keyword schemeVar command-line-arguments integer-valued? -
syn keyword schemeVar enable-interrupts integer-length + *
syn keyword schemeVar r6rs:number->string make-i/o-error
syn keyword schemeVar i/o-encoding-error-char hashtable-contains?
syn keyword schemeVar no-nans-violation? enum-set-constructor
syn keyword schemeVar bytevector-u8-ref get-bytevector-n cadddr

set lisp
set autoindent
set nocindent
let b:current_syntax = "scheme"

" expand tabs
set expandtab

" valid only in hacked version: ! means treat "all but" these as lispwords
set lispwords=!if,or,and,%if,+,-,*,/,<,=,>
