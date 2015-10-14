" ===========================
" Plugin Manage
" ===========================

" set not compatible to pure vi
set nocompatible

" needed for Vundle
filetype off

" manage plugin by Vundle
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
  
" Vundle
Plugin 'gmarik/Vundle.vim'

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

" Align
Plugin 'vim-scripts/Align'

" OmniCppComplete 
Plugin 'vim-scripts/OmniCppComplete'
let OmniCpp_MayCompleteDot=1
let OmniCpp_MayCompleteArrow=1
let OmniCpp_MayCompleteScope=1
let OmniCpp_NamespaceSearch=1 
let OmniCpp_GlobalScopeSearch=1
let OmniCpp_ShowScopeInAbbr=1
let OmniCpp_ShowPrototypeInAbbr=1 

" TagBar
Plugin 'majutsushi/tagbar'
let g:tagbar_autoclose=1
let g:tagbar_autofocus=1
let g:tagbar_compact=1

" Bufferline
Plugin 'bling/vim-bufferline'
let g:bufferline_echo = 0
let g:bufferline_active_buffer_left = '['
let g:bufferline_active_buffer_right = ']'
let g:bufferline_modified = '*'
let g:bufferline_show_bufnr = 1

" Airline
Plugin 'bling/vim-airline'
let g:airline#extensions#tagbar#enabled = 1
let g:airline#extensions#bufferline#enabled = 1
let g:airline#extensions#bufferline#overwrite_variables = 0

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

" backspace
set backspace=indent,eol,start

" ruler
set ruler

" indent
set autoindent 

" tab setting
set expandtab
set tabstop=4
au BufEnter ?akefile*,*.mk set noexpandtab

" indent
set shiftwidth=4

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
hi search cterm=none ctermbg=grey ctermfg=red
set ignorecase
set smartcase

" match {}
set showmatch

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

" Key F8 : Toggle TagBar
map <F8> <F8>:TagbarToggle<CR>

" Key F9 : Save and Build
map <F9> <F2>:! buildws -jobs 20<CR>

" Key F10 : Save and Build Clean
map <F10> <F2>:! buildws -clean<CR>

" Key F11 : Toggle QuickFix Window
nmap <F11> :call ToggleQuickfixList()<CR>
nmap <F11> :call QFSwitch()<CR>
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

" Key - Insert Mode
map! <F2> <ESC><F2>
map! <F3> <ESC><F3>
map! <F4> <ESC><F4>
map! <F5> <ESC><F2><F5>
map! <F6> <ESC><F2><F6>
map! <F7> <ESC><F2><F7> 
map! <F8> <ESC><F2><F8> 
map! <F9> <ESC><F2><F9> 
map! <F10> <ESC><F2><F10> 
map! <F11> <ESC><F2><F11> 

" Key Ctrl-c for Copy
vmap <C-c> :w! ~/.vbuf<CR>
nmap <C-c> :.w! ~/.vbuf<CR><ESC>

" Key Ctrl-p for Paste
nmap <C-p> :r ~/.vbuf<CR>

" Key Ctrl-g for grep
nmap <C-g> :cclose<CR>:execute "vimgrep /".expand("<cword>")."/j **" <BAR>cw 5<CR>


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
" Tag Setting
" ===========================
set tags+=$HOME/.vim/tag/cpp.tag
set tags+=$HOME/.vim/tag/qt.tag
set tags+=$CDS_INST_DIR/vimTag/mpt.tag
set tags+=$CDS_INST_DIR/vimTag/dpt.tag

