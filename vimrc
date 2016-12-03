"""""" Automatic reloading of .vimrc """""""""""""""""""
""""""""""""""""""""""""""""""""""""""""""""""""""""""""
autocmd! bufwritepost .vimrc source %


"""""" Vundle """"""""""""""""""""""""""""""""""""""""""
" Help:    :h bundle
" Install: :BundleInstall
"          $ vim +PluginInstall +qall
" Update:  :BundleUpdate
" Clear:   :BundleClean(!) (auto confirm)
" List:    :BundleList
" Search:  :BundleSearch(!) FOO (refresh cache first)
""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nocompatible
filetype off
set rtp+=~/.vim/bundle/vundle
call vundle#rc()
""" let Vundle manage Vundle
Bundle 'gmarik/vundle'
""" Plugins
Bundle 'altercation/vim-colors-solarized'
Bundle 'derekwyatt/vim-fswitch'
Bundle 'derekwyatt/vim-protodef'
Bundle 'dyng/ctrlsf.vim'
Bundle 'easymotion/vim-easymotion'
Bundle 'fholgado/minibufexpl.vim'
Bundle 'honza/vim-snippets'
Bundle 'kshenoy/vim-signature'
Bundle 'Lokaltog/vim-powerline'
Bundle 'majutsushi/tagbar'
Bundle 'nathanaelkane/vim-indent-guides'
Bundle 'octol/vim-cpp-enhanced-highlight'
Bundle 'scrooloose/nerdtree'
Bundle 'scrooloose/nerdcommenter'
Bundle 'SirVer/ultisnips'
Bundle 'Valloric/YouCompleteMe'
Bundle 'vim-scripts/DfrankUtil'
Bundle 'vim-scripts/indexer.tar.gz'
Bundle 'vim-scripts/Mark'
Bundle 'vim-scripts/vimprj'
Bundle 'vim-utils/vim-man'
filetype plugin indent on


"""""" Settings """"""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""" General
let mapleader="\\"
syntax enable
syntax on
set background=dark
set history=50
set laststatus=2
set ruler
set number

""" cursor
set cursorline
"set cursorcolumn
set backspace=indent,eol,start
set whichwrap=b,s
":autocmd InsertEnter,InsertLeave * set cul!

""" line wrap
set wrap
set linebreak

""" encoding
set encoding=utf-8
set termencoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8,big5,latin1
set ambiwidth=double

""" search
set incsearch
set hlsearch
set ignorecase
set nowrapscan
nmap <silent> <leader>c :noh<cr>

""" tab
set autoindent
set expandtab
set tabstop=4
set shiftwidth=4
set softtabstop=4

""" parenthesise
set showmatch
inoremap ( ()<ESC>i
inoremap { {<CR>}<ESC>O
inoremap [ []<ESC>i

""" misc
set wildmenu
set spell " z= correct, ]s next
set showcmd

""" folder
set nofoldenable

""" window navigation
nnoremap <c-j> <c-w><c-j>
nnoremap <c-k> <c-w><c-k>
nnoremap <c-h> <c-w><c-h>
nnoremap <c-l> <c-w><c-l>

""" tags & new-omni-completion
" 1. download source code (at least header files)
" 2. ctags (-I extended1,extended2,...) (let OmniCpp_DefaultNamespaces = ["NAMESPACE"])
" 3. set tags+=PATH_TO_TAGS
" ex1. c++ tags: ctags -R --c++-kinds=+l+x+p --fields=+iaSl --extra=+q --language-force=c++ -f stdcpp.tags
"      let OmniCpp_DefaultNamespaces = ["_GLIBCXX_STD"]
"      set tags+=/usr/include/c++/4.8/stdcpp.tags
" ex2. linux source: ctags -R --c-kinds=+l+x+p --fields=+lS -I __THROW,__nonnull -f sys.tags
"      set tags+=/usr/include/sys.tags
nmap <leader>tn :tnext<cr>
nmap <leader>tp :tprevious<cr>

""" make
nmap <leader>x :wa<cr>:make<cr><cr>:cw<cr>

""" session
"TODO


"""""" Plugin Settings """""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""" vim-colors-solarized
let g:solarized_termcolors=256
let g:solarized_termtrans=1
let g:solarized_degrade=0
let g:solarized_bold=0
let g:solarized_underline=0
let g:solarized_italic=1
let g:solarized_contrast="normal"
let g:solarized_visibility="normal"
colorscheme solarized

""" vim-fswitch
nmap <silent> <leader>sw :FSHere<cr>

""" vim-protodef
" <leader>PP : make all prototype
let g:protodefprotogetter='~/.vim/bundle/vim-protodef/pullproto.pl'
let g:disable_protodef_sorting=1

""" ctrlsf.vim
nnoremap <leader>sp :CtrlSF<cr>

""" vim-easymotion
" <leader><leader>fa

""" minibufexpl.vim
map <leader>w :MBEbn<cr>
map <leader>p :MBEbp<cr>

""" vim-snippets
" for ultisnips

""" vim-signature
" mx  : Toggle mark 'x' and display it in the leftmost column
" dmx : Remove mark 'x' where x is a-zA-Z
" m,  : Place the next available mark
" m.  : If no mark on line, place the next available mark. Otherwise, remove (first) existing mark.
" m-  : Delete all marks from the current line
" m<Space> : Delete all marks from the current buffer
" ]`  : Jump to next mark
" [`  : Jump to prev mark
" ]'  : Jump to start of next line containing a mark
" ['  : Jump to start of prev line containing a mark
" `]  : Jump by alphabetical order to next mark
" `[  : Jump by alphabetical order to prev mark
" ']  : Jump by alphabetical order to start of next line having a mark
" '[  : Jump by alphabetical order to start of prev line having a mark
" m/  : Open location list and display marks from current buffer
" m[0-9]     : Toggle the corresponding marker !@#$%^&*()
" m<S-[0-9]> : Remove all markers of the same type
" ]-  : Jump to next line having a marker of the same type
" [-  : Jump to prev line having a marker of the same type
" ]=  : Jump to next line having a marker of any type
" [=  : Jump to prev line having a marker of any type
" m?  : Open location list and display markers from current buffer
" m<BS>      : Remove all markers

""" vim-powerline
let g:Powerline_colorscheme='solarized256'

""" tagbar
let tagbar_left=1
let tagbar_width=32
let tagbar_compact=1
let g:tagbar_type_cpp = {
    \ 'ctagstype' : 'c++',
    \ 'kinds' : [
         \ 'd:macros:0:1',
         \ 'p:functions_prototypes:0:1',
         \ 'g:enumeration:0:1',
         \ 'e:enumerators:0:0', 
         \ 't:typedefs:0:1',
         \ 'n:namespaces:0:1',
         \ 'c:classes:0:1',
         \ 's:structs:0:1',
         \ 'u:unions:0:1',
         \ 'f:functions:0:1',
         \ 'm:members:0:1',
         \ 'v:global:0:1',
         \ 'l:local:0:1',
         \ 'x:external:0:1'
     \ ],
     \ 'sro'        : '::',
     \ 'kind2scope' : {
         \ 'g' : 'enum',
         \ 'n' : 'namespace',
         \ 'c' : 'class',
         \ 's' : 'struct',
         \ 'u' : 'union'
     \ },
     \ 'scope2kind' : {
         \ 'enum'      : 'g',
         \ 'namespace' : 'n',
         \ 'class'     : 'c',
         \ 'struct'    : 's',
         \ 'union'     : 'u'
    \ }
\ }

""" vim-indent-guides
let g:indent_guides_enable_on_vim_startup=1
let g:indent_guides_start_level=2
let g:indent_guides_guide_size=1
":nmap <silent> <leader>i <Plug>IndentGuidesToggle

""" vim-cpp-enhanced-highlight
" ex. for highlight initializer_list,
"     add "syntax keyword cppSTLtype initializer_list" in cpp.vim

""" nerdtree
let NERDTreeWinSize=32
let NERDTreeWinPos="right"
let NERDTreeShowHidden=1
let NERDTreeMinimalUI=1
let NERDTreeAutoDeleteBuffer=1

""" nerdcommenter
" <leader>cc : comment
" <leader>cu : uncomment

""" ultisnips
" Note: choosing snippets by priority
let g:UltiSnipsExpandTrigger="<c-j>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"

""" YouCompleteMe
" Engine: YCM: files in buffer OR keyin '.', '->', '::'
"         tags: need enable AND tags
"         OmniCppComplete: include header file AND shortcut key ^x^o
" color
highlight Pmenu ctermfg=2 ctermbg=3 guifg=#005f87 guibg=#EEE8D5
highlight PmenuSel ctermfg=2 ctermbg=3 guifg=#AFD700 guibg=#106900
" about comment
let g:ycm_complete_in_comments=1
"" auto load .ycm_extra_conf.py
let g:ycm_confirm_extra_conf=0
let g:ycm_global_ycm_extra_conf='~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'
" enable tag engine (and tags is needed)
let g:ycm_collect_identifiers_from_tags_files=1
" set OmniCppComplete engine
inoremap <leader>; <C-x><C-o>
" show table only
set completeopt-=preview
" character starts YCM
let g:ycm_min_num_of_chars_for_completion=1
" no cache
let g:ycm_cache_omnifunc=0
" keyword
let g:ycm_seed_identifiers_with_syntax=1
" used in include or opened files 
"nnoremap <leader>jc :YcmCompleter GoToDeclaration<cr>
"nnoremap <leader>jd :YcmCompleter GoToDefinition<cr>
nnoremap <leader>j :YcmCompleter GoToDefinitionElseDeclaration<cr>
" <leader>d : check pre-error msg

""" DfrankUtil
" for indexer

"""indexer.tar.gz
let g:indexer_ctagsCommandLineOptions="--c++-kinds=+p+l+x+c+d+e+f+g+m+n+s+t+u+v --fields=+iaSl --extra=+q"

""" Mark
" <leader>m : (un)color
" <leader>r : color exp
" <leader>n : clear
" <leader>* : next last mark
" <leader>/ : next mark

""" vimprj
" for indexer

""" global plugin settings
function! IDE(bang)
    execute 'TagbarClose'
    execute 'NERDTreeClose'
    execute 'MBEClose'
    if (a:bang)
        execute 'TagbarToggle'
        execute 'NERDTreeToggle'
        execute 'MBEToggle'
        
    endif
endfunction
command! -bang IDE call IDE(<bang>1)
nmap <leader>io :IDE<cr> <c-w><c-h>
nmap <leader>ic :IDE!<cr>

"""""" GUI Settings """"""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if has("gui_running")
    set guifont=Monaco:h14
    set t_Co=256
end
if has("gui_macvim")
    let macvim_hig_shift_movement = 1
end
