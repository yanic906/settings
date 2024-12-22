""""""""""""""""""""""
"      Vim Note      "
""""""""""""""""""""""

""" Useful command
" :help                "show help index, jump/return by tag
" :help quickref       "show quick reference
" :help reference_toc  "show detail
" :help index          "show command index
" :map                 "show all map key
" :echo VARIABLE       "show vaue of VARIABLE
" :set ENV?            "show value of ENV (the same as ':echo &ENV')
" :colorscheme <c-d>   "list colorscheme
"
" $vim --startuptime LOG FILE " profiling open time
"


""""""""""""""""""""""""
"      VIM Plugin      "
""""""""""""""""""""""""

"TBD (not exactly)
""" Needed packages
" - ack, clangd, cmake, ctags, node

" automatic reloading of .vimrc
autocmd! bufwritepost *vimrc source %

""" vim-plug
" Install:  :PlugInstall [name] [#threads]
"           $ vim +PlugInstall +qall
" Update:   :PlugUpdate [name] [#threads]
" Clear:    :PlugClean[!] (auto confirm)
" Upgrade:  :PlugUpgrade (upgrade vim-plug)
" Status:   :PlugStatus
" Diff:     :PlugDiff
" Shapshot: :PlugSnapshot[!] [output path]
"
call plug#begin()
Plug 'airblade/vim-gitgutter'
Plug 'derekwyatt/vim-fswitch'
Plug 'dense-analysis/ale'
Plug 'dyng/ctrlsf.vim'
Plug 'easymotion/vim-easymotion'
Plug 'godlygeek/tabular'
Plug 'honza/vim-snippets'
Plug 'kshenoy/vim-signature'
Plug 'LunarWatcher/auto-pairs'
Plug 'majutsushi/tagbar'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'scrooloose/nerdtree'
Plug 'SirVer/ultisnips'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'vim-scripts/DfrankUtil'
Plug 'vim-scripts/indexer.tar.gz'
Plug 'vim-scripts/vimprj'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'Yggdroot/LeaderF', { 'do': ':LeaderfInstallCExtension' }
call plug#end()

""" packadd
"
packadd editorconfig


""""""""""""""""""""""
"      Settings      "
""""""""""""""""""""""

" leader key (default is '\')
nmap <space> <leader>

""" common
"
syntax enable
syntax on
set history=50
set laststatus=2
set ruler
set number
set relativenumber
set numberwidth=6
set timeout
set scrolloff=0 "keep line(s) in H or L
set wildmenu
set showcmd
set fixendofline
set updatetime=3000 "some plugins also use this time to do update
nnoremap <silent> <leader>p :echo 'Directory:' \|
                            \echohl Directory \| echo '   ' . trim(execute('pwd')) . '/' \|
                            \echohl None \| echo 'File:' \|
                            \echohl ModeMsg \| echo '   ' . @% \| echohl None<cr>

""" color
"
set t_Co=256
set background=dark
colorscheme wildcharm
highlight Search ctermbg=yellow guibg=yellow
autocmd FileType c,cpp set colorcolumn=80
highlight ColorColumn cterm=bold ctermbg=8 guibg=lightgrey

""" cursor
"
set cursorline
set backspace=indent,eol,start
set whichwrap=<,>,[,]

""" line wrap
" - use 'gj' or 'gk' to move in the line when set wrap
"
set wrap
set linebreak "work with breakat
set breakindent
set sidescroll=1 "work with nowrap

""" encoding
"
set encoding=utf-8
set termencoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8,big5,latin1
set ambiwidth=double

""" search
"
set incsearch
set hlsearch
set ignorecase
set nowrapscan
nnoremap <silent> <leader>/ :noh<cr>

""" tab
"
set autoindent
set tabstop=4
set shiftwidth=4
set softtabstop=4
autocmd FileType c,cpp,python,go,vim,bash set expandtab

""" parentheses
"
set showmatch
autocmd FileType xml,html set matchpairs=(:),{:},[:],<:>
highlight MatchParen ctermbg=cyan guibg=cyan

""" folder
"
set nofoldenable

""" window navigation
"
set nostartofline
nnoremap <c-j> <c-w><c-j>
nnoremap <c-k> <c-w><c-k>
nnoremap <c-h> <c-w><c-h>
nnoremap <c-l> <c-w><c-l>

""" buffer
"
set nohidden
nnoremap <silent> <c-n> :bnext<cr>
nnoremap <silent> <c-p> :bprevious<cr>
nnoremap <silent> <leader>ba :bfirst<cr>
nnoremap <silent> <leader>bz :blast<cr>
nnoremap <silent> <leader>bl :buffers<cr>
nnoremap <leader>bb :buffer<space>
nnoremap <leader>bw :bwipe<space>
nmap <silent> <leader>bf <c-w>_

""" tagsrch
"
nnoremap <silent> <leader>tn :tnext<cr>
nnoremap <silent> <leader>tp :tprevious<cr>
nmap <c-\> g<c-]>

""" spell
" - use 'z=' correct, ']s' next
"
autocmd FileType text set spell
set spelllang=en_us

""" :make [args]
" - default makeprg file name: 'makeprg'
" - lcd root_dir when enter buffer
" - equal to :!{makeprg} "with quickfix
"            :!{makeprg} {shellpipe} {makeef} "without quickfix
"
function! Customize_make()
    " set makeprg name
    if exists("b:makeprg_name") == 0
        let b:makeprg_name = 'makeprg'
    endif
    let makeprg_file = b:makeprg_name . '.sh'
    let makeprg_log = b:makeprg_name . '.log'

    " get roo_dir then lcd
    let root_file = findfile(l:makeprg_file, expand('%:p:h').';')
    if strlen(l:root_file) == 0
        return
    endif
    let root_dir = fnamemodify(l:root_file, ':p:h')
    execute 'lcd ' . l:root_dir

    " set related make variables
    execute 'set makeprg=./' . l:makeprg_file . '\ $*'
    set shellpipe=2>&1\|\ tee
    execute 'set makeef=' . l:makeprg_log

    nmap <silent> <leader>m :w<cr>:make<cr><cr>:cwindow<cr>
endfunction
autocmd BufEnter * if empty(&buftype) | call Customize_make() | endif

""" quickfix
"
nnoremap <silent> <leader>co :copen<cr>
nnoremap <silent> <leader>cc :cclose<cr>:wincmd b<cr>:wincmd h<cr>
autocmd FileType qf wincmd J
autocmd FileType qf syntax match ErrMsg "error:" |
                   \highlight ErrMsg cterm=bold ctermbg=red
autocmd FileType qf syntax match WarnMsg "warning:" |
                   \highlight WarnMsg cterm=bold ctermbg=yellow

""" help
"
nnoremap <leader>h :help<space>

""" save and quit
"
nnoremap <silent> <leader>w :w<cr>
nnoremap <silent> <expr> <leader>q empty(&buftype) ? ':qa<cr>' : ':q<cr>'


"""""""""""""""""""""""""""""
"      Plugin Settings      "
"""""""""""""""""""""""""""""

""" vim-gitgutter
" - it influences colorscheme (e.g. .patch shows different colors)
"
let g:gitgutter_map_keys=0
highlight SignColumn cterm=bold ctermbg=0 guibg=black

""" vim-fswitch
"
nnoremap <silent> <leader>sw :FSHere<cr>

""" ale
" :ALEInfo "show all configs
" - can work with vim-airline
"
let g:ale_enabled=0 "default disable
nmap <leader>ap <Plug>(ale_previous_wrap)
nmap <leader>an <Plug>(ale_next_wrap)
nmap <leader>at :ALEToggle<cr>
nmap <leader>ai :ALEDetail<cr>

""" ctrlsf.vim
"
let g:ctrlsf_winsize='80%'
nnoremap <silent> <leader>ss :CtrlSF<cr>
nnoremap <silent> <leader>so :CtrlSFOpen<cr>
nnoremap <silent> <leader>st :CtrlSFToggle<cr>
nnoremap <leader>s/ :CtrlSF -smartcase<space>
" visual select and yank then search
nnoremap <silent> <leader>sv :CtrlSF "<c-r>""<cr>
let g:ctrlsf_auto_focus={ "at": "done", "duration_less_than": 10000 }
let g:ctrlsf_case_sensitive ='yes'
" remove ignore search for some folders in .gitignore
let g:ctrlsf_extra_backend_args = {
    \ 'rg': '-uuu',
    \ 'ag': '-U',
    \ }

""" vim-easymotion
"
let g:EasyMotion_smartcase=1
let g:EasyMotion_do_mapping=0
map <leader>e <Plug>(easymotion-bd-f)
map <leader>ee <Plug>(easymotion-s2)

""" tabular
"
nmap <leader>t= :Tabularize /=<cr>
vmap <leader>t= :Tabularize /=<cr>
nmap <leader>t/ :Tabularize /\/\/<cr>
vmap <leader>t/ :Tabularize /\/\/<cr>

""" vim-snippets
" - for ultisnips
"

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
"

""" auto-pairs
"

""" tagbar
"
let tagbar_left=1
let tagbar_width=32
let tagbar_compact=1
let tagbar_sort=0

""" coc.nvim
" - for c/c++/object-c
"   * in ubuntu: apt-get install clangd
"     in mac: brew install llvm (in /usr/local/opt/llvm/bin/clangd)
"   * :CocInstall coc-clangd
"   * :CocConfig (https://github.com/neoclide/coc.nvim/wiki/Language-servers#ccobjective-c)
" - map key (https://github.com/neoclide/coc.nvim/wiki/Completion-with-sources)
"
let g:coc_start_at_startup=1
inoremap <expr> <cr> coc#pum#visible() ? coc#pum#confirm() : "\<CR>"
inoremap <expr> <Tab> coc#pum#visible() ? coc#pum#next(1) : "\<Tab>"
inoremap <expr> <S-Tab> coc#pum#visible() ? coc#pum#prev(1) : "\<S-Tab>"
function! CocToggle()
    if g:coc_enabled
        CocDisable
    else
        CocEnable
    endif
endfunction
nnoremap <silent> <leader>ct :call CocToggle()<cr>

""" nerdtree
"
let NERDTreeWinSize=32
let NERDTreeWinPos="right"
let NERDTreeShowHidden=1
let NERDTreeMinimalUI=1
let NERDTreeAutoDeleteBuffer=1
let NERDTreeIgnore=['\.swp', '\.o', '\.cmd']

""" ultisnips
" - choose snippets by priority
"
let g:UltiSnipsExpandTrigger="<c-l>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"

""" vim-commentary
" gcc           "comment this line
" [NUM]gc[MOVE] "comment others line
"

""" vim-fugitive
" :Git <git command>
"
nnoremap <leader>g :Git<space>
" for git diff
highlight DiffDelete cterm=bold ctermfg=9
highlight DiffAdd cterm=bold ctermfg=10

""" vim-airline
" - can use the AirlineAfterTheme autocmd to update highlights without affecting the airline theme
" - to show absolute path in g:airline_section_c, modify %f to %F in airline#extensions#fugitiveline#bufname()
"
let g:airline_powerline_fonts=1
let g:airline_skip_empty_sections=0
let g:airline_detect_spell=0
let g:airline_stl_path_style='default'
if !exists('g:airline_symbols')
    let g:airline_symbols={}
endif
let g:airline_symbols.readonly='[RO]'
let g:airline_symbols.branch=''
let g:airline_symbols.linenr=' L:'
let g:airline_symbols.maxlinenr=', '
let g:airline_symbols.colnr=' C:'
let g:airline#parts#ffenc#skip_expected_string='utf-8[unix]' "skip the most common show
let g:airline#extensions#ale#enabled=1 "with ale
let g:airline#extensions#branch#enabled=1 "with vim-fugitive
let g:airline#extensions#coc#enabled=1 "for coc.nvim
let g:airline#extensions#tabline#enabled=1
let g:airline#extensions#tabline#formatter='default'
let g:airline#extensions#tabline#buffer_nr_show=1
let g:airline#extensions#tabline#buffer_nr_format='%s.'
let g:airline#extensions#tagbar#enabled=0
let g:airline#extensions#tagbar_statusline=0
let g:airline#extensions#nerdtree_statusline=0

""" vim-airline-themes
" - for vim-airline
"
let g:airline_theme='papercolor'

""" DfrankUtil
" - for indexer
"

"""indexer.tar.gz
" - ctags can use --list-* (eg. --list-kinds --list-fields) to list options
" - set global variable (eg. g:indexer_ctagsCommandLineOptions) in "autocmd FileType" is invalid
"
let g:indexer_ctagsCommandLineOptions="--langmap=c:+.h --c-kinds=+lpx --fields=+iaS --extras=+q"
let g:indexer_dontUpdateTagsIfFileExists=1
nnoremap <leader>ib :IndexerRebuild<cr>

""" vimprj
" - for indexer
"

""" nerdtree-git-plugin
"

""" LeaderF
" :LeaderfSelf "show all commands
"
let g:Lf_ShortcutF='<leader>f'
let g:Lf_ShortcutB='<leader>l'
let g:Lf_WorkingDirectoryMode='AF'
let g:Lf_RootMarkers=['.git', '.svn', '.root']
let g:Lf_WildIgnore={'file':['*.swp', '*.o'], 'dir':[]}
let g:Lf_UseVersionControlTool=0 "to avoid many .git in the path
let g:Lf_DefaultExternalTool='find'

""" editorconfig
" - https://editorconfig.org
"
let g:EditorConfig_exclude_patterns=['fugitive://.*']
au FileType gitcommit let b:EditorConfig_disable=1

""" global plugin settings
"
function! IDE(bang)
    execute 'TagbarClose'
    execute 'NERDTreeClose'
    if (a:bang)
        execute 'TagbarToggle'
        execute 'NERDTreeToggle'
        wincmd h
    endif
endfunction
command! -bang IDE call IDE(<bang>1)
nnoremap <silent> <leader>io :GitGutterEnable<cr>:set nu<cr>:set rnu<cr>:IDE<cr>
nnoremap <silent> <leader>ic :IDE!<cr>:set nonu<cr>:set nornu<cr>:GitGutterDisable<cr>

function! Init_IDE()
    execute 'TagbarToggle'
    execute 'NERDTreeToggle'
    wincmd h
endfunction
" use silent to disable warning of nerdtree
autocmd VimEnter *.[ch] silent call Init_IDE()


"TBD (not use now)
""""""""""""""""""""""""""
"      GUI Settings      "
""""""""""""""""""""""""""
if has("gui_running")
    set guifont=Monaco:h14
end
if has("gui_macvim")
    let macvim_hig_shift_movement=1
end
