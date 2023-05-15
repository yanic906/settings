""""""""""""""""""""""
"      Vim Note      "
""""""""""""""""""""""

"TBD: list common usage


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
call plug#end()


""""""""""""""""""""""
"      Settings      "
""""""""""""""""""""""

""" common
let mapleader="\\"
filetype on
syntax enable
syntax on
set background=dark
set history=50
set laststatus=2
set ruler
set number

""" color
set t_Co=256
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
highlight MatchParen ctermbg=cyan guibg=cyan

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
"set makeprg=BUILD_COMMAND
nmap <silent> <leader>qo :copen<cr>
nmap <silent> <leader>qc :cclose<cr>:wincmd b<cr>:wincmd h<cr>
nmap <leader>x :wa<cr>:make<cr><cr>:cw<cr>
autocmd FileType qf wincmd J

""" tagsrch
nmap <leader>tn :tnext<cr>
nmap <leader>tp :tprevious<cr>
nmap <c-\> g<c-]>

""" other
nmap <leader>p :pwd<cr>


"""""""""""""""""""""""""""""
"      Plugin Settings      "
"""""""""""""""""""""""""""""

""" vim-gitgutter
set updatetime=3000

""" vim-fswitch
nmap <silent> <leader>sw :FSHere<cr>

""" ctrlsf.vim
let g:ctrlsf_winsize='80%'
nnoremap <leader>ss :CtrlSF<cr>
nnoremap <leader>so :CtrlSFOpen<cr>
nnoremap <leader>st :CtrlSFToggle<cr>
nnoremap <leader>s/ :CtrlSF -smartcase 
" visual select and yank then search
nnoremap <leader>sv :CtrlSF "<C-r>""<cr>
let g:ctrlsf_auto_focus={ "at": "done", "duration_less_than": 10000 }
let g:ctrlsf_case_sensitive ='yes'
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
    \ 'colorscheme': 'Tomorrow',
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
" - for c/c++/object-c
" - in ubuntu: apt-get install clangd
"   in mac: brew install llvm (in /usr/local/opt/llvm/bin/clangd)
" - install in vim: :CocInstall coc-clangd
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
" - choosing snippets by priority
"""
let g:UltiSnipsExpandTrigger="<leader><tab>"
let g:UltiSnipsJumpForwardTrigger="<leader><tab>"
let g:UltiSnipsJumpBackwardTrigger="<leader><s-tab>"

""" vim-nerdtree-syntax-highlight

""" DfrankUtil
" for indexer
"""

"""indexer.tar.gz
" - ctags can use --list-* (eg. --list-kinds --list-fields) to list options
" - set global variable (eg. g:indexer_ctagsCommandLineOptions) in "autocmd FileType" is invalid
"""
let g:indexer_ctagsCommandLineOptions="--langmap=c:+.h --c-kinds=+lpx --fields=+iaS --extra=+q"
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

"""""" global plugin settings
function! IDE(bang)
    execute 'TagbarClose'
    execute 'NERDTreeClose'
    if (a:bang)
        execute 'MBEClose'
        execute 'TagbarToggle'
        execute 'NERDTreeToggle'
        execute 'MBEOpen'
        wincmd h
    endif
endfunction
command! -bang IDE call IDE(<bang>1)
nmap <leader>io :IDE<cr>
nmap <leader>ic :IDE!<cr>

function! Init_IDE()
    execute 'TagbarToggle'
    execute 'NERDTreeToggle'
    wincmd h
endfunction
" use silent to disable warning of nerdtree
autocmd VimEnter *.[ch] silent call Init_IDE()


""""""""""""""""""""""""""
"      GUI Settings      "
""""""""""""""""""""""""""
if has("gui_running")
    set guifont=Monaco:h14
end
if has("gui_macvim")
    let macvim_hig_shift_movement=1
end


""""""""""""""""""
"      Misc      "
""""""""""""""""""

""" Useful command
":echo VARIABLE " get value of VARIABLE
":set ENV? " get value of ENV
":mksession
":normal KEY
": colorscheme <c-d> " list colorscheme

""" Needed packages
"ack, clangd, cmake, ctags, nerd-fonts, node

""" Setting backup
":autocmd InsertEnter,InsertLeave * set cul!
"set spell " z= correct, ]s next
"inoremap ( ()<ESC>i
"inoremap [ []<ESC>i
"autocmd FileType c inoremap { {<CR>}<ESC>O

""" Plug-in may be used
"gelguy/wilder.nvim (wildmenu)
"kien/ctrlp (fuzzy search)
"vim-utils/vim-man(check c manual)
"preservim/vim-indent-guides (indent line)
"luochen1990/rainbow (rainbow parentheses)
"vim-syntastic/syntastic (syntax check)
"zxqfl/tabnine-vim (AI completion, need to bind YCM, coc, or etc)
