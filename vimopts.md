VIM options
===========

|   long form   | short form | bool | variants (negation and inversion)                         |
|:-------------:|:----------:|:----:|:---------------------------------------------------------:|
|aleph          | al         |      |                                                           |
|allowrevins    | ari        |  X   | noallowrevins    noari     invallowrevins    invari       |
|altkeymap      | akm        |  X   | noaltkeymap      noakm     invaltkeymap      invakm       |
|ambiwidth      | ambw       |      |                                                           |
|antialias      | anti       |  X   | noantialias      noanti    invantialias      invanti      |
|arabic         | arab       |  X   | noarabic         noarab    invarabic         invarab      |
|arabicshape    | arshape    |  X   | noarabicshape    noarshape invarabicshape    invarshape   |
|autochdir      | acd        |  X   | noautochdir      noacd     invautochdir      invacd       |
|autoindent     | ai         |  X   | noautoindent     noai      invautoindent     invai        |
|autoread       | ar         |  X   | noautoread       noar      invautoread       invar        |
|autowrite      | aw         |  X   | noautowrite      noaw      invautowrite      invaw        |
|autowriteall   | awa        |  X   | noautowriteall   noawa     invautowriteall   invawa       |
|background     | bg         |      |                                                           |
|backspace      | bs         |      |                                                           |
|backup         | bk         |  X   | nobackup         nobk      invbackup         invbk        |
|backupcopy     | bkc        |      |                                                           |
|backupdir      | bdir       |      |                                                           |
|backupext      | bex        |      |                                                           |
|backupskip     | bsk        |      |                                                           |
|balloondelay   | bdlay      |      |                                                           |
|ballooneval    | beval      |  X   | noballooneval    nobeval   invballooneval    invbeval     |
|balloonexpr    | bexpr      |      |                                                           |
|belloff        | bo         |      |                                                           |
|binary         | bin        |  X   | nobinary         nobin     invbinary         invbin       |
|bioskey        | biosk      |  X   | nobioskey        nobiosk   invbioskey        invbiosk     |
|bomb           |            |  X   | nobomb                     invbomb                        |
|breakat        | brk        |      |                                                           |
|breakindent    | bri        |  X   | nobreakindent    nobri     invbreakindent    invbri       |
|breakindentopt | briopt     |      |                                                           |
|browsedir      | bsdir      |      |                                                           |
|bufhidden      | bh         |      |                                                           |
|buflisted      | bl         |  X   | nobuflisted      nobl      invbuflisted      invbl        |
|buftype        | bt         |      |                                                           |
|casemap        | cmp        |      |                                                           |
|cdpath         | cd         |      |                                                           |
|cedit          |            |      |                                                           |
|charconvert    | ccv        |      |                                                           |
|cindent        | cin        |  X   | nocindent        nocin     invcindent        invcin       |
|cinkeys        | cink       |      |                                                           |
|cinoptions     | cino       |      |                                                           |
|cinwords       | cinw       |      |                                                           |
|clipboard      | cb         |      |                                                           |
|cmdheight      | ch         |      |                                                           |
|cmdwinheight   | cwh        |      |                                                           |
|colorcolumn    | cc         |      |                                                           |
|columns        | co         |      |                                                           |
|comments       | com        |      |                                                           |
|commentstring  | cms        |      |                                                           |
|compatible     | cp         |  X   | nocompatible     nocp      invcompatible     invcp        |
|complete       | cpt        |      |                                                           |
|completefunc   | cfu        |      |                                                           |
|completeopt    | cot        |      |                                                           |
|concealcursor  | cocu       |      |                                                           |
|conceallevel   | cole       |      |                                                           |
|confirm        | cf         |  X   | noconfirm        nocf      invconfirm        invcf        |
|conskey        | consk      |  X   | noconskey        noconsk   invconskey        invconsk     |
|copyindent     | ci         |  X   | nocopyindent     noci      invcopyindent     invci        |
|cpoptions      | cpo        |      |                                                           |
|cryptmethod    | cm         |      |                                                           |
|cscopepathcomp | cspc       |      |                                                           |
|cscopeprg      | csprg      |      |                                                           |
|cscopequickfix | csqf       |      |                                                           |
|cscoperelative | csre       |  X   | nocscoperelative nocsre    invcscoperelative invcsre      |
|cscopetag      | cst        |  X   | nocscopetag      nocst     invcscopetag      invcst       |
|cscopetagorder | csto       |      |                                                           |
|cscopeverbose  | csverb     |  X   | nocscopeverbose  nocsverb  invcscopeverbose  invcsverb    |
|cursorbind     | crb        |  X   | nocursorbind     nocrb     invcursorbind     invcrb       |
|cursorcolumn   | cuc        |  X   | nocursorcolumn   nocuc     invcursorcolumn   invcuc       |
|cursorline     | cul        |  X   | nocursorline     nocul     invcursorline     invcul       |
|debug          |            |      |                                                           |
|define         | def        |      |                                                           |
|delcombine     | deco       |  X   | nodelcombine     nodeco    invdelcombine     invdeco      |
|dictionary     | dict       |      |                                                           |
|diff           |            |  X   | nodiff                     invdiff                        |
|diffexpr       | dex        |      |                                                           |
|diffopt        | dip        |      |                                                           |
|digraph        | dg         |  X   | nodigraph        nodg      invdigraph        invdg        |
|directory      | dir        |      |                                                           |
|display        | dy         |      |                                                           |
|eadirection    | ead        |      |                                                           |
|edcompatible   | ed         |  X   | noedcompatible   noed      invedcompatible   inved        |
|emoji          | emo        |  X   | noemoji          noemo     invemoji          invemo       |
|encoding       | enc        |      |                                                           |
|endofline      | eol        |  X   | noendofline      noeol     invendofline      inveol       |
|equalalways    | ea         |  X   | noequalalways    noea      invequalalways    invea        |
|equalprg       | ep         |      |                                                           |
|errorbells     | eb         |  X   | noerrorbells     noeb      inverrorbells     inveb        |
|errorfile      | ef         |      |                                                           |
|errorformat    | efm        |      |                                                           |
|esckeys        | ek         |  X   | noesckeys        noek      invesckeys        invek        |
|eventignore    | ei         |      |                                                           |
|expandtab      | et         |  X   | noexpandtab      noet      invexpandtab      invet        |
|exrc           | ex         |  X   | noexrc           noex      invexrc           invex        |
|fe             |            |      |                                                           |
|fileencoding   | fenc       |      |                                                           |
|fileencodings  | fencs      |      |                                                           |
|fileformat     | ff         |      |                                                           |
|fileformats    | ffs        |      |                                                           |
|fileignorecase | fic        |  X   | nofileignorecase nofic     invfileignorecase invfic       |
|filetype       | ft         |      |                                                           |
|fillchars      | fcs        |      |                                                           |
|fixendofline   | fixeol     |  X   | nofixendofline   nofixeol  invfixendofline   invfixeol    |
|fkmap          | fk         |  X   | nofkmap          nofk      invfkmap          invfk        |
|foldclose      | fcl        |      |                                                           |
|foldcolumn     | fdc        |      |                                                           |
|foldenable     | fen        |  X   | nofoldenable     nofen     invfoldenable     invfen       |
|foldexpr       | fde        |      |                                                           |
|foldignore     | fdi        |      |                                                           |
|foldlevel      | fdl        |      |                                                           |
|foldlevelstart | fdls       |      |                                                           |
|foldmarker     | fmr        |      |                                                           |
|foldmethod     | fdm        |      |                                                           |
|foldminlines   | fml        |      |                                                           |
|foldnestmax    | fdn        |      |                                                           |
|foldopen       | fdo        |      |                                                           |
|foldtext       | fdt        |      |                                                           |
|formatexpr     | fex        |      |                                                           |
|formatlistpat  | flp        |      |                                                           |
|formatoptions  | fo         |      |                                                           |
|formatprg      | fp         |      |                                                           |
|fsync          | fs         |  X   | nofsync          nofs      invfsync          invfs        |
|gdefault       | gd         |  X   | nogdefault       nogd      invgdefault       invgd        |
|grepformat     | gfm        |      |                                                           |
|grepprg        | gp         |      |                                                           |
|guicursor      | gcr        |      |                                                           |
|guifont        | gfn        |      |                                                           |
|guifontset     | gfs        |      |                                                           |
|guifontwide    | gfw        |      |                                                           |
|guiheadroom    | ghr        |      |                                                           |
|guioptions     | go         |      |                                                           |
|guipty         |            |  X   | noguipty                   invguipty                      |
|guitablabel    | gtl        |      |                                                           |
|guitabtooltip  | gtt        |      |                                                           |
|helpfile       | hf         |      |                                                           |
|helpheight     | hh         |      |                                                           |
|helplang       | hlg        |      |                                                           |
|hidden         | hid        |  X   | nohidden         nohid     invhidden         invhid       |
|highlight      | hl         |      |                                                           |
|history        | hi         |      |                                                           |
|hkmap          | hk         |  X   | nohkmap          nohk      invhkmap          invhk        |
|hkmapp         | hkp        |  X   | nohkmapp         nohkp     invhkmapp         invhkp       |
|hlsearch       | hls        |  X   | nohlsearch       nohls     invhlsearch       invhls       |
|icon           |            |  X   | noicon                     invicon                        |
|iconstring     |            |      |                                                           |
|ignorecase     | ic         |  X   | noignorecase     noic      invignorecase     invic        |
|imactivatefunc | imaf       |      |                                                           |
|imactivatekey  | imak       |      |                                                           |
|imcmdline      | imc        |  X   | noimcmdline      noimc     invimcmdline      invimc       |
|imdisable      | imd        |  X   | noimdisable      noimd     invimdisable      invimd       |
|iminsert       | imi        |      |                                                           |
|imsearch       | ims        |      |                                                           |
|imstatusfunc   | imsf       |      |                                                           |
|include        | inc        |      |                                                           |
|includeexpr    | inex       |      |                                                           |
|incsearch      | is         |  X   | noincsearch      nois      invincsearch      invis        |
|indentexpr     | inde       |      |                                                           |
|indentkeys     | indk       |      |                                                           |
|infercase      | inf        |  X   | noinfercase      noinf     invinfercase      invinf       |
|insertmode     | im         |  X   | noinsertmode     noim      invinsertmode     invim        |
|isfname        | isf        |      |                                                           |
|isident        | isi        |      |                                                           |
|iskeyword      | isk        |      |                                                           |
|isprint        | isp        |      |                                                           |
|joinspaces     | js         |  X   | nojoinspaces     nojs      invjoinspaces     invjs        |
|key            |            |      |                                                           |
|keymap         | kmp        |      |                                                           |
|keymodel       | km         |      |                                                           |
|keywordprg     | kp         |      |                                                           |
|langmap        | lmap       |      |                                                           |
|langmenu       | lm         |      |                                                           |
|langnoremap    | lnr        |  X   | nolangnoremap    nolnr     invlangnoremap    invlnr       |
|langremap      | lrm        |  X   | nolangremap      nolrm     invlangremap      invlrm       |
|laststatus     | ls         |      |                                                           |
|lazyredraw     | lz         |  X   | nolazyredraw     nolz      invlazyredraw     invlz        |
|linebreak      | lbr        |  X   | nolinebreak      nolbr     invlinebreak      invlbr       |
|lines          |            |      |                                                           |
|linespace      | lsp        |      |                                                           |
|lisp           |            |  X   | nolisp                     invlisp                        |
|lispwords      | lw         |      |                                                           |
|list           |            |  X   | nolist                     invlist                        |
|listchars      | lcs        |      |                                                           |
|loadplugins    | lpl        |  X   | noloadplugins    nolpl     invloadplugins    invlpl       |
|luadll         |            |      |                                                           |
|macatsui       |            |  X   | nomacatsui                 invmacatsui                    |
|magic          |            |  X   | nomagic                    invmagic                       |
|makeef         | mef        |      |                                                           |
|makeprg        | mp         |      |                                                           |
|matchpairs     | mps        |      |                                                           |
|matchtime      | mat        |      |                                                           |
|maxcombine     | mco        |      |                                                           |
|maxfuncdepth   | mfd        |      |                                                           |
|maxmapdepth    | mmd        |      |                                                           |
|maxmem         | mm         |      |                                                           |
|maxmempattern  | mmp        |      |                                                           |
|maxmemtot      | mmt        |      |                                                           |
|menuitems      | mis        |      |                                                           |
|mkspellmem     | msm        |      |                                                           |
|modeline       | ml         |  X   | nomodeline       noml      invmodeline       invml        |
|modelines      | mls        |      |                                                           |
|modifiable     | ma         |  X   | nomodifiable     noma      invmodifiable     invma        |
|modified       | mod        |  X   | nomodified       nomod     invmodified       invmod       |
|more           |            |  X   | nomore                     invmore                        |
|mouse          |            |      |                                                           |
|mousefocus     | mousef     |  X   | nomousefocus     nomousef  invmousefocus     invmousef    |
|mousehide      | mh         |  X   | nomousehide      nomh      invmousehide      invmh        |
|mousemodel     | mousem     |      |                                                           |
|mouseshape     | mouses     |      |                                                           |
|mousetime      | mouset     |      |                                                           |
|mzquantum      | mzq        |      |                                                           |
|nrformats      | nf         |      |                                                           |
|number         | nu         |  X   | nonumber         nonu      invnumber         invnu        |
|numberwidth    | nuw        |      |                                                           |
|omnifunc       | ofu        |      |                                                           |
|opendevice     | odev       |  X   | noopendevice     noodev    invopendevice     invodev      |
|operatorfunc   | opfunc     |      |                                                           |
|osfiletype     | oft        |      |                                                           |
|packpath       | pp         |      |                                                           |
|paragraphs     | para       |      |                                                           |
|paste          |            |  X   | nopaste                    invpaste                       |
|pastetoggle    | pt         |      |                                                           |
|patchexpr      | pex        |      |                                                           |
|patchmode      | pm         |      |                                                           |
|path           | pa         |      |                                                           |
|perldll        |            |      |                                                           |
|preserveindent | pi         |  X   | nopreserveindent nopi      invpreserveindent invpi        |
|previewheight  | pvh        |      |                                                           |
|previewwindow  |            |  X   | nopreviewwindow            invpreviewwindow               |
|printdevice    | pdev       |      |                                                           |
|printencoding  | penc       |      |                                                           |
|printexpr      | pexpr      |      |                                                           |
|printfont      | pfn        |      |                                                           |
|printheader    | pheader    |      |                                                           |
|printmbcharset | pmbcs      |      |                                                           |
|printmbfont    | pmbfn      |      |                                                           |
|printoptions   | popt       |      |                                                           |
|prompt         |            |  X   | noprompt                   invprompt                      |
|pumheight      | ph         |      |                                                           |
|pvw            |            |  X   | nopvw                      invpvw                         |
|pythondll      |            |      |                                                           |
|pythonthreedll |            |      |                                                           |
|quoteescape    | qe         |      |                                                           |
|readonly       | ro         |  X   | noreadonly       noro      invreadonly       invro        |
|redrawtime     | rdt        |      |                                                           |
|regexpengine   | re         |      |                                                           |
|relativenumber | rnu        |  X   | norelativenumber nornu     invrelativenumber invrnu       |
|remap          |            |  X   | noremap                    invremap                       |
|renderoptions  | rop        |      |                                                           |
|report         |            |      |                                                           |
|restorescreen  | rs         |  X   | norestorescreen  nors      invrestorescreen  invrs        |
|revins         | ri         |  X   | norevins         nori      invrevins         invri        |
|rightleft      | rl         |  X   | norightleft      norl      invrightleft      invrl        |
|rightleftcmd   | rlc        |      |                                                           |
|rubydll        |            |      |                                                           |
|ruler          | ru         |  X   | noruler          noru      invruler          invru        |
|rulerformat    | ruf        |      |                                                           |
|runtimepath    | rtp        |      |                                                           |
|scroll         | scr        |      |                                                           |
|scrollbind     | scb        |  X   | noscrollbind     noscb     invscrollbind     invscb       |
|scrolljump     | sj         |      |                                                           |
|scrolloff      | so         |      |                                                           |
|scrollopt      | sbo        |      |                                                           |
|sections       | sect       |      |                                                           |
|secure         |            |  X   | nosecure                   invsecure                      |
|selection      | sel        |      |                                                           |
|selectmode     | slm        |      |                                                           |
|sessionoptions | ssop       |      |                                                           |
|shell          | sh         |      |                                                           |
|shellcmdflag   | shcf       |      |                                                           |
|shellpipe      | sp         |      |                                                           |
|shellquote     | shq        |      |                                                           |
|shellredir     | srr        |      |                                                           |
|shellslash     | ssl        |  X   | noshellslash     nossl     invshellslash     invssl       |
|shelltemp      | stmp       |  X   | noshelltemp      nostmp    invshelltemp      invstmp      |
|shelltype      | st         |      |                                                           |
|shellxescape   | sxe        |      |                                                           |
|shellxquote    | sxq        |      |                                                           |
|shiftround     | sr         |  X   | noshiftround     nosr      invshiftround     invsr        |
|shiftwidth     | sw         |      |                                                           |
|shortmess      | shm        |      |                                                           |
|shortname      | sn         |  X   | noshortname      nosn      invshortname      invsn        |
|showbreak      | sbr        |      |                                                           |
|showcmd        | sc         |  X   | noshowcmd        nosc      invshowcmd        invsc        |
|showfulltag    | sft        |  X   | noshowfulltag    nosft     invshowfulltag    invsft       |
|showmatch      | sm         |  X   | noshowmatch      nosm      invshowmatch      invsm        |
|showmode       | smd        |  X   | noshowmode       nosmd     invshowmode       invsmd       |
|showtabline    | stal       |      |                                                           |
|sidescroll     | ss         |      |                                                           |
|sidescrolloff  | siso       |      |                                                           |
|signcolumn     | scl        |      |                                                           |
|smartcase      | scs        |  X   | nosmartcase      noscs     invsmartcase      invscs       |
|smartindent    | si         |  X   | nosmartindent    nosi      invsmartindent    invsi        |
|smarttab       | sta        |  X   | nosmarttab       nosta     invsmarttab       invsta       |
|softtabstop    | sts        |      |                                                           |
|spell          |            |  X   | nospell                    invspell                       |
|spellcapcheck  | spc        |      |                                                           |
|spellfile      | spf        |      |                                                           |
|spelllang      | spl        |      |                                                           |
|spellsuggest   | sps        |      |                                                           |
|splitbelow     | sb         |  X   | nosplitbelow     nosb      invsplitbelow     invsb        |
|splitright     | spr        |  X   | nosplitright     nospr     invsplitright     invspr       |
|startofline    | sol        |  X   | nostartofline    nosol     invstartofline    invsol       |
|statusline     | stl        |      |                                                           |
|suffixes       | su         |      |                                                           |
|suffixesadd    | sua        |      |                                                           |
|swapfile       | swf        |  X   | noswapfile       noswf     invswapfile       invswf       |
|swapsync       | sws        |      |                                                           |
|switchbuf      | swb        |      |                                                           |
|synmaxcol      | smc        |      |                                                           |
|syntax         | syn        |      |                                                           |
|tabline        | tal        |      |                                                           |
|tabpagemax     | tpm        |      |                                                           |
|tabstop        | ts         |      |                                                           |
|tagbsearch     | tbs        |  X   | notagbsearch     notbs     invtagbsearch     invtbs       |
|tagcase        | tc         |      |                                                           |
|taglength      | tl         |      |                                                           |
|tagrelative    | tr         |  X   | notagrelative    notr      invtagrelative    invtr        |
|tags           | tag        |      |                                                           |
|tagstack       | tgst       |  X   | notagstack       notgst    invtagstack       invtgst      |
|tcldll         |            |      |                                                           |
|term           |            |      |                                                           |
|termbidi       | tbidi      |  X   | notermbidi       notbidi   invtermbidi       invtbidi     |
|termencoding   | tenc       |      |                                                           |
|termguicolors  | tgc        |      |                                                           |
|terse          |            |  X   | noterse                    invterse                       |
|textauto       | ta         |  X   | notextauto       nota      invtextauto       invta        |
|textmode       | tx         |  X   | notextmode       notx      invtextmode       invtx        |
|textwidth      | tw         |      |                                                           |
|thesaurus      | tsr        |      |                                                           |
|tildeop        | top        |  X   | notildeop        notop     invtildeop        invtop       |
|timeout        | to         |  X   | notimeout        noto      invtimeout        invto        |
|timeoutlen     | tm         |      |                                                           |
|title          |            |  X   | notitle                    invtitle                       |
|titlelen       |            |      |                                                           |
|titleold       |            |      |                                                           |
|titlestring    |            |      |                                                           |
|toolbar        | tb         |      |                                                           |
|toolbariconsize| tbis       |      |                                                           |
|ttimeout       |            |  X   | nottimeout                 invttimeout                    |
|ttimeoutlen    | ttm        |      |                                                           |
|ttybuiltin     | tbi        |  X   | nottybuiltin     notbi     invttybuiltin     invtbi       |
|ttyfast        | tf         |  X   | nottyfast        notf      invttyfast        invtf        |
|ttymouse       | ttym       |      |                                                           |
|ttyscroll      | tsl        |      |                                                           |
|ttytype        | tty        |      |                                                           |
|undodir        | udir       |      |                                                           |
|undofile       | udf        |  X   | noundofile       noudf     invundofile       invudf       |
|undolevels     | ul         |      |                                                           |
|undoreload     | ur         |      |                                                           |
|updatecount    | uc         |      |                                                           |
|updatetime     | ut         |      |                                                           |
|verbose        | vbs        |      |                                                           |
|verbosefile    | vfile      |      |                                                           |
|viewdir        | vdir       |      |                                                           |
|viewoptions    | vop        |      |                                                           |
|viminfo        | vi         |      |                                                           |
|virtualedit    | ve         |      |                                                           |
|visualbell     | vb         |  X   | novisualbell     novb      invvisualbell     invvb        |
|warn           |            |  X   | nowarn                     invwarn                        |
|weirdinvert    | wiv        |  X   | noweirdinvert    nowiv     invweirdinvert    invwiv       |
|whichwrap      | ww         |      |                                                           |
|wildchar       | wc         |      |                                                           |
|wildcharm      | wcm        |      |                                                           |
|wildignore     | wig        |      |                                                           |
|wildignorecase | wic        |  X   | nowildignorecase nowic     invwildignorecase invwic       |
|wildmenu       | wmnu       |  X   | nowildmenu       nowmnu    invwildmenu       invwmnu      |
|wildmode       | wim        |      |                                                           |
|wildoptions    | wop        |      |                                                           |
|winaltkeys     | wak        |      |                                                           |
|window         | wi         |      |                                                           |
|winfixheight   | wfh        |  X   | nowinfixheight   nowfh     invwinfixheight   invwfh       |
|winfixwidth    | wfw        |  X   | nowinfixwidth    nowfw     invwinfixwidth    invwfw       |
|winheight      | wh         |      |                                                           |
|winminheight   | wmh        |      |                                                           |
|winminwidth    | wmw        |      |                                                           |
|winwidth       | wiw        |      |                                                           |
|wrap           |            |  X   | nowrap                     invwrap                        |
|wrapmargin     | wm         |      |                                                           |
|wrapscan       | ws         |  X   | nowrapscan       nows      invwrapscan       invws        |
|write          |            |  X   | nowrite                    invwrite                       |
|writeany       | wa         |  X   | nowriteany       nowa      invwriteany       invwa        |
|writebackup    | wb         |  X   | nowritebackup    nowb      invwritebackup    invwb        |
|writedelay     | wd         |      |                                                           |
