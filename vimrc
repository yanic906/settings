""""""""""""""""""""""
"      Vim Note      "
""""""""""""""""""""""

"TBD: list common use command


""""""""""""""""""""""""
"      VIM Plugin      "
""""""""""""""""""""""""

" automatic reloading of .vimrc
autocmd! bufwritepost .vimrc source %

""" vim-plug
" Install:  :PlugInstall [name] [#threads]
"           $ vim +PlugInstall +qall
" Update:   :PlugUpdate [name] [#threads]
" Clear:    :PlugClean[!] (auto confirm)
" Upgrade:  :PlugUpgrade (upgrade vim-plug)
" Status:   :PlugUpgrade
" Diff:     :PlugDiff
" Shapshot: :PlugSnapshot[!] [output path]
"""
call plug#begin()
Plug 'airblade/vim-gitgutter'
Plug 'derekwyatt/vim-fswitch'
Plug 'dyng/ctrlsf.vim'
Plug 'easymotion/vim-easymotion'
Plug 'fholgado/minibufexpl.vim'
Plug 'honza/vim-snippets'
Plug 'itchyny/lightline.vim'
Plug 'kshenoy/vim-signature'
Plug 'LunarWatcher/auto-pairs'
Plug 'majutsushi/tagbar'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'ryanoasis/vim-devicons'
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/nerdcommenter'
Plug 'SirVer/ultisnips'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'vim-scripts/DfrankUtil'
Plug 'vim-scripts/indexer.tar.gz'
Plug 'vim-scripts/Mark'
Plug 'vim-scripts/vimprj'
Plug 'Yggdroot/LeaderF', { 'do': ':LeaderfInstallCExtension' }
Plug 'zxqfl/tabnine-vim'
call plug#end()


""""""""""""""""""""""
"      Settings      "
""""""""""""""""""""""

""" common
let mapleader="\\"
syntax enable
syntax on
set background=dark
set history=50
set laststatus=2
set ruler
set number

""" color
colorscheme desert
autocmd FileType c,cpp set colorcolumn=80
highlight ColorColumn ctermbg=12 guibg=lightgrey

""" cursor
set cursorline
set backspace=indent,eol,start
set whichwrap=b,s

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
set tabstop=4
set shiftwidth=4
set softtabstop=4
autocmd FileType python,go set expandtab

""" parenthesise
set showmatch

""" misc
set wildmenu
set showcmd

""" folder
set nofoldenable

""" window navigation
nnoremap <c-j> <c-w><c-j>
nnoremap <c-k> <c-w><c-k>
nnoremap <c-h> <c-w><c-h>
nnoremap <c-l> <c-w><c-l>

""" quickfix
nmap <silent> <leader>qo :copen<cr>
nmap <silent> <leader>qc :cclose<cr>

""" tags & new-omni-completion
" 1. download source code (at least header files)
" 2. ctags (-I extended1,extended2,...) (let OmniCpp_DefaultNamespaces = ["NAMESPACE"])
" 3. set tags+=PATH_TO_TAGS
" ex1. c++ tags: ctags -R --c++-kinds=+l+x+p --fields=+iaSl --extra=+q --language-force=c++ -f stdcpp.tags
"      let OmniCpp_DefaultNamespaces = ["_GLIBCXX_STD"]
"      set tags+=/usr/include/c++/4.8/stdcpp.tags
" ex2. linux source: ctags -R --c-kinds=+l+x+p --fields=+lS -I __THROW,__nonnull -f sys.tags
"      set tags+=/usr/include/sys.tags
"""
nmap <leader>tn :tnext<cr>
nmap <leader>tp :tprevious<cr>
nmap <c-\> g<c-]>

""" make
nmap <leader>x :wa<cr>:make<cr><cr>:cw<cr>

""" other
nmap <leader>p :pwd<cr>


"""""""""""""""""""""""""""""
"      Plugin Settings      "
"""""""""""""""""""""""""""""

""" vim-gitgutter
set updatetime=10000

""" vim-fswitch
nmap <silent> <leader>sw :FSHere<cr>

""" ctrlsf.vim
let g:ctrlsf_winsize='80%'
nnoremap <leader>ss :CtrlSF<cr>
nnoremap <leader>so :CtrlSFOpen<cr>
nnoremap <leader>st :CtrlSFToggle<cr>
nnoremap <leader>s/ :CtrlSF 
" visual select and yank then search
nnoremap <leader>sv :CtrlSF "<C-r>""<cr>
let g:ctrlsf_auto_focus={ "at": "done", "duration_less_than": 10000 }
" remove ignore search for some folders in .gitignore
let g:ctrlsf_extra_backend_args = {
    \ 'rg': '-uuu',
    \ 'ag': '-U',
    \ }

""" vim-easymotion
" <leader><leader>w/b
" <leader><leader>s/f/t
" <leader><leader>j/k
"""
let g:EasyMotion_smartcase=1
map <Leader><leader>h <Plug>(easymotion-linebackward)
map <Leader><leader>l <Plug>(easymotion-lineforward)
map <Leader><leader>. <Plug>(easymotion-repeat)

""" minibufexpl.vim
noremap <C-n> :MBEbn<cr>
noremap <C-p> :MBEbp<cr>

""" vim-snippets
" for ultisnips
"""

""" lightline.vim
let g:lightline = {
    \ 'colorscheme': 'solarized',
    \ }

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
"""

""" auto-pairs

""" tagbar
nnoremap <Leader>b :TagbarToggle<CR>
let tagbar_left=1
let tagbar_width=32
let tagbar_compact=1

""" coc.nvim
" for c/c++/object-c
" sudo apt-get install clangd (ubuntu) / brew install llvm (mac, in /usr/local/opt/llvm/bin/clangd)
" :CocInstall coc-clangd
"""

""" vim-devicons

""" nerdtree
let NERDTreeWinSize=32
let NERDTreeWinPos="right"
let NERDTreeShowHidden=1
let NERDTreeMinimalUI=1
let NERDTreeAutoDeleteBuffer=1
let NERDTreeIgnore=['\.swp']

""" nerdcommenter
" <leader>cc : comment
" <leader>cm : comment
" <leader>cs : comment
" <leader>cu : uncomment
"""
let g:NERDAltDelims_c=1

""" ultisnips
" Note: choosing snippets by priority
"""
let g:UltiSnipsExpandTrigger="<leader><tab>"
let g:UltiSnipsJumpForwardTrigger="<leader><tab>"
let g:UltiSnipsJumpBackwardTrigger="<leader><s-tab>"

""" vim-nerdtree-syntax-highlight

""" DfrankUtil
" for indexer
"""

"""indexer.tar.gz
"TBD let g:indexer_ctagsCommandLineOptions="--c++-kinds=+p+l+x+c+d+e+f+g+m+n+s+t+u+v --fields=+iaSl --extra=+q"
autocmd FileType c let g:indexer_ctagsCommandLineOptions="--languages=C --c-kinds=+l+p+x --langmap=c:.c.h --fields=+lS"
autocmd FileType python let g:indexer_ctagsCommandLineOptions="--languages=Python"
autocmd FileType go let g:indexer_ctagsCommandLineOptions="--languages=Go"
let g:indexer_dontUpdateTagsIfFileExists=1
nmap <leader>g :IndexerRebuild<cr>

""" Mark
" <leader>m : (un)color
" <leader>r : color exp
" <leader>n : clear
" <leader>* : next last mark
" <leader>/ : next mark
"""

""" vimprj
" for indexer
"""

""" LeaderF
let g:Lf_ShortcutF='<leader>f'
"let g:Lf_WorkingDirectoryMode='AF'
"let g:Lf_RootMarkers=['.git', '.svn']

""" tabnine-vim

"""""" global plugin settings
function! IDE(bang)
    execute 'TagbarClose'
    execute 'NERDTreeClose'
    execute 'MBEClose'
    if (a:bang)
        execute 'TagbarToggle'
        execute 'NERDTreeToggle'
        execute 'MBEToggle'
        wincmd h
    endif
endfunction
command! -bang IDE call IDE(<bang>1)
nmap <leader>io :IDE<cr>
nmap <leader>ic :IDE!<cr>
autocmd VimEnter *.[ch] :IDE


""""""""""""""""""""""""""
"      GUI Settings      "
""""""""""""""""""""""""""
"TBD
if has("gui_running")
    set guifont=Monaco:h14
    set t_Co=256
end
if has("gui_macvim")
    let macvim_hig_shift_movement=1
end


""""""""""""""""""
"      Misc      "
""""""""""""""""""

""" Useful command
":echo VARIABLE
":mksession
":normal KEY

""" Needed packages
"ack, cland, cmake, ctags, nerd-fonts, node

""" Setting backup
":autocmd InsertEnter,InsertLeave * set cul!
"set spell " z= correct, ]s next
"inoremap ( ()<ESC>i
"inoremap [ []<ESC>i
"autocmd FileType c inoremap { {<CR>}<ESC>O

""" Plug-in may be used
"wilder.nvim (wildmenu)
"ctrlp (fuzzy search)
"vim-man(check c manual)
"vim-indent-guides (indent line)
"luochen1990/rainbow (rainbow parentheses)
"vim-syntastic/syntastic (syntax check)
