" ===========================
" Plugin Manage
" ===========================

" set not compatible to pure vi
set nocompatible

" needed for Vundle
filetype off

" check for if Vundle installed
let vundle_source=expand('~/.vim/bundle/vundle/autoload/vundle.vim')
if !filereadable(vundle_source)
  echo "Installing Vundle.."
  echo ""
  silent !mkdir -p ~/.vim/bundle
  silent !git clone https://github.com/gmarik/vundle ~/.vim/bundle/vundle
endif

" manage plugin by Vundle
set rtp+=~/.vim/bundle/vundle
call vundle#begin()
  
" Vundle
Plugin 'gmarik/vundle'

" NerdTree
Plugin 'scrooloose/nerdtree'
let g:NERDTreeQuitOnOpen=1
let g:NERDTreeDirArrows=0
let g:NERDTreeAutoCenter=1
let g:NERDTreeShowFiles=1
let g:NERDTreeShowHidden=1
let g:NERDTreeWinPos="left"
let g:NERDTreeCascadeOpenSingleChildDir=1

" A.vim
Plugin 'vim-scripts/a.vim'

" OmniCppComplete 
Plugin 'vim-scripts/OmniCppComplete'
let OmniCpp_MayCompleteDot=1
let OmniCpp_MayCompleteArrow=1
let OmniCpp_MayCompleteScope=1
let OmniCpp_NamespaceSearch=1 
let OmniCpp_GlobalScopeSearch=1
let OmniCpp_ShowScopeInAbbr=1
let OmniCpp_ShowPrototypeInAbbr=1 

" TabBar
Plugin 'vim-scripts/TabBar'
let g:Tb_TabWrap = 1
let g:Tb_MaxSize = 10

" CtrlP
Plugin 'ctrlpvim/ctrlp.vim'
let g:ctrlp_custom_ignore = {
    \ 'dir':  '\v[\/]\.(git|hg|svn|rvm)$',
    \ 'file': '\v\.(exe|so|dll|zip|tar|tar.gz|pyc)$',
    \ }
let g:ctrlp_by_filename = 1
let g:ctrlp_regexp = 1
let g:ctrlp_match_window = 'bottom,order:ttb,min:1,max:15,results:10'
let g:ctrlp_follow_symlinks = 0
let g:ctrlp_prompt_mappings = {
    \ 'PrtSelectMove("j")':   ['<c-j>', '<c-n>'],
    \ 'PrtSelectMove("k")':   ['<c-k>', '<c-p>'],
    \ 'PrtHistory(-1)':       [],
    \ 'PrtHistory(1)':        [],
    \ }

" Ack
Plugin 'mileszs/ack.vim'
let g:ackprg = '~/Tools/bin/ack -s -H --nocolor --nogroup --column --smart-case'
let g:ackhighlight = 1

" Rainbow Parentheses Improved
Plugin 'luochen1990/rainbow'
let g:rainbow_active = 1
let g:rainbow_conf = {
	\	'guifgs': ['royalblue3', 'darkorange3', 'seagreen3', 'firebrick'],
	\	'ctermfgs': ['white', 'lightblue', 'lightyellow', 'lightcyan', 'lightmagenta'],
	\	'operators': '_,_',
	\	'parentheses': ['start=/(/ end=/)/ fold', 'start=/\[/ end=/\]/ fold', 'start=/{/ end=/}/ fold'],
	\	'separately': {
	\		'*': {},
	\		'tex': {
	\			'parentheses': ['start=/(/ end=/)/', 'start=/\[/ end=/\]/'],
	\		},
	\		'lisp': {
	\			'guifgs': ['royalblue3', 'darkorange3', 'seagreen3', 'firebrick', 'darkorchid3'],
	\		},
	\		'vim': {
	\			'parentheses': ['start=/(/ end=/)/', 'start=/\[/ end=/\]/', 'start=/{/ end=/}/ fold', 'start=/(/ end=/)/ containedin=vimFuncBody', 'start=/\[/ end=/\]/ containedin=vimFuncBody', 'start=/{/ end=/}/ fold containedin=vimFuncBody'],
	\		},
	\		'html': {
	\			'parentheses': ['start=/\v\<((area|base|br|col|embed|hr|img|input|keygen|link|menuitem|meta|param|source|track|wbr)[ >])@!\z([-_:a-zA-Z0-9]+)(\s+[-_:a-zA-Z0-9]+(\=("[^"]*"|'."'".'[^'."'".']*'."'".'|[^ '."'".'"><=`]*))?)*\>/ end=#</\z1># fold'],
	\		},
	\		'css': 0,
	\	}
	\}

" =================
" No used Now
" =================
" Echofunc
"Plugin 'vim-scripts/echofunc.vim'
"let g:EchoFuncShowOnStatus = 1

" AutoComplPop
" Plugin 'vim-scripts/AutoComplPop'

" Syntastic
"Plugin 'scrooloose/syntastic'
"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*

"let g:syntastic_error_symbol='>>'
"let g:syntastic_warning_symbol='>'
"let g:syntastic_always_populate_loc_list = 1
"let g:syntastic_auto_loc_list = 0
"let g:syntastic_check_on_open = 1
"let g:syntastic_check_on_wq = 1
"let g:syntastic_loc_list_height = 5

" Tabbar
"Plugin 'file:///home/ltzuchin/.vim/local_plugin'

" Bufferline
" Plugin 'bling/vim-bufferline'
" let g:bufferline_echo = 0
" let g:bufferline_active_buffer_left = '['
" let g:bufferline_active_buffer_right = ']'
" let g:bufferline_modified = '*'
" let g:bufferline_show_bufnr = 1
" let g:bufferline_rotate = 1
" let g:bufferline_fixed_index =  -1

" Airline
" Plugin 'bling/vim-airline'
" let g:airline#extensions#tagbar#enabled = 1
" let g:airline#extensions#bufferline#enabled = 1
" let g:airline#extensions#bufferline#overwrite_variables = 0

" minibufexpl
" Plugin 'fholgado/minibufexpl.vim'

" Align
" Plugin 'vim-scripts/Align'

" TagBar
" Plugin 'majutsushi/tagbar'
" let g:tagbar_autoclose=1
" let g:tagbar_autofocus=1
" let g:tagbar_compact=1

" Key F9 : Toggle TagBar
" map <F9> <F9>:TagbarToggle<CR>

" limelight
" Plugin 'junegunn/limelight.vim'

" Key Ctrl-g for grep
" nmap <C-g> :cclose<CR>:execute "vimgrep /".expand("<cword>")."/j **/*.cpp **/*.h **/*.il" <BAR>cw 5<CR>

" Indexer/vimprj/DfrankUtil
" Plugin 'vim-scripts/Indexer.tar.gz'
" Plugin 'vim-scripts/vimprj'
" Plugin 'vim-scripts/DfrankUtil'
" let g:indexer_ctagsCommandLineOptions="--c++-kinds=+p+l+x+c+d+e+f+g+m+n+s+t+u+v --fields=+iaSl --extra=+q"

" ALE
" Plugin 'w0rp/ale'
" let g:ale_sign_column_always = 1
" let g:ale_cpp_cppcheck_executable = "gcc"
" let g:ale_linters = {'c': ['gcc'], 'cpp': ['g++']}
" let g:ale_echo_msg_error_str = 'E'
" let g:ale_echo_msg_warning_str = 'W'
" let g:ale_lint_on_enter = 1
" let g:ale_set_signs = 1
" let g:ale_sign_error = '◈'
" let g:ale_sign_warning = '◈'

" cpp-enhanced-highlight
" Plugin 'octol/vim-cpp-enhanced-highlight'

" =================
 
call vundle#end()

" ===========================
" Normal Setting
" ===========================

" filetype
filetype plugin indent on

" syntax
syntax on

" no backup
set nobackup

" no wrap
set nowrap

" backspace
set backspace=indent,eol,start

" ruler
set ruler

" indent
set autoindent 
set shiftwidth=4

" tab setting
set expandtab
set tabstop=4
au BufEnter ?akefile*,*.mk set noexpandtab

" history
set history=100

" status line
set laststatus=2

" line number
set number

" color
hi comment ctermfg=darkcyan
hi directory ctermfg=darkcyan

" search
set hlsearch
hi search cterm=none ctermbg=brown ctermfg=black
set ignorecase
set smartcase

" match {}
set showmatch

" vi's command complete
set wildmenu

" ===========================
" Key Mapping
" ===========================
" Key F2 - Save
map <F2> :lclose<CR>:up<CR>

" Key F3 - Toggle Nerd-Tree
map <F3> :NERDTreeToggle<CR>

" Key F4 : Exit Without Save
map <F4> :q!<CR>

" Key F5 : Save and Next Buffer
map <F5> <F2>:bp<CR>

" Key F6 : Save and Previous Buffer
map <F6> <F2>:bn<CR>

" Key F7 : Save and Close Buffer
map <F7> <F2>:bd<CR>

" Key F10 : Toggle QuickFix Window
nmap <F10> :call ToggleQuickfixList()<CR>
nmap <F10> :call QFSwitch()<CR>
function! QFSwitch()
    redir => ls_output
    execute ':silent! ls'
    redir END

    let exists = match(ls_output, "[Quickfix List")
    if exists == -1
        execute ':copen 5'
    else
        execute ':cclose'
    endif
endfunction

" Key F11 : Toggle Definition List by cTags
nmap <F11> g]

" Key - Insert Mode
map! <F2> <ESC><F2>
map! <F3> <ESC><F3>
map! <F4> <ESC><F4>
map! <F5> <ESC><F2><F5>
map! <F6> <ESC><F2><F6>
map! <F7> <ESC><F2><F7> 
map! <F10> <ESC><F2><F10> 
map! <F11> <ESC><F11>

" Key Ctrl-c for Copy
vmap <C-c> :w! ~/.vbuf<CR>
nmap <C-c> :.w! ~/.vbuf<CR><ESC>

" Key Ctrl-p for Paste
nmap <C-p> :r ~/.vbuf<CR>

" key Ctrl-f for pulgin CtrlP
map <C-f> :CtrlP<CR>
map! <C-f> <ESC><C-f>
let g:ctrlp_map = '<c-f>'
map <C-r> :CtrlPMRUFiles<CR>
map! <C-r> <ESC><C-r>

" key Ctrl-g for calling Ack to search underline word
nmap <C-g> :Ack<CR>

" ===========================
" Auto Command
" ===========================

" return to last
if has("autocmd")
   autocmd BufRead *.txt set tw=78
   autocmd BufReadPost *
      \ if line("'\"") > 0 && line ("'\"") <= line("$") |
      \   exe "normal g'\"" |
      \ endif
endif

" close quick fix when leaving buffer
autocmd BufLeave * cclose

" close OmniCppComplete preview
autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
autocmd InsertLeave * if pumvisible() == 0|pclose|endif

" ===========================
" CDNS Used
" ===========================

" Key ctrl-b : buildwss - only for CDNS
:set makeprg=buildws\ -jobs\ 5
map <C-b> <F2>:make<CR>

" ===========================
" Tag Setting
" ===========================
set tags+=$HOME/.vim/tag/cpp.tag
set tags+=$HOME/.vim/tag/qt.tag
set tags+=$CDS_INST_DIR/vimTag/tools_dfII_group_mpt.tag

" ===========================
" Set mark s before search
" ===========================
nnoremap / ms/

