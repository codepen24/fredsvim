" Fred's Vim
" https://github.com/codepen24/fredsvim.git
" version: 0.0.1

let vim_plug_just_installed = 0
let vim_plug_path = expand('~/.vim/autoload/plug.vim')
if !filereadable(vim_plug_path)
    echo "Installing Vim-plug..."
    echo ""
    silent !mkdir -p ~/.vim/autoload
    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    let vim_plug_just_installed = 1
endif

" manually load vim-plug the first time
if vim_plug_just_installed
    :execute 'source '.fnameescape(vim_plug_path)
endif

call plug#begin('~/.vim/plugged')

Plug 'morhetz/gruvbox'
Plug 'crusoexia/vim-monokai'
Plug 'NLKNguyen/papercolor-theme'
Plug 'Shougo/neocomplcache.vim'
Plug 'vim-airline/vim-airline' 
Plug 'vim-airline/vim-airline-themes' 
Plug 'scrooloose/syntastic' 
Plug 'airblade/vim-gitgutter'
Plug 'Raimondi/delimitMate'
Plug 'majutsushi/tagbar'
Plug 'Yggdroot/indentLine'
Plug 'vim-scripts/grep.vim' 
Plug 'gorodinskiy/vim-coloresque' 
Plug 'vim-scripts/c.vim', {'for': ['c', 'cpp']}
Plug 'ludwig/split-manpage.vim'
Plug 'hail2u/vim-css3-syntax'
Plug 'tpope/vim-haml'
Plug 'jelera/vim-javascript-syntax'
Plug 'arnaud-lb/vim-php-namespace'
Plug 'tpope/vim-surround'

Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'tomtom/tlib_vim'
Plug 'honza/vim-snippets'
Plug 'garbas/vim-snipmate'

call plug#end()

if vim_plug_just_installed
    echo "Installing Bundles, please ignore key map error messages"
    :PlugInstall
endif


"*************
"" Basic Setup
"*************
" Required:
filetype plugin indent on

set nocompatible " no vi-compatible
set ls=2 " always show status bar

syntax on
set ruler

let no_buffers_menu=1

set mousemodel=popup
set t_Co=256
set guioptions=egmrti
set gfn=Monospace\ 10

"" Encoding
"set encoding=utf-8
"set fileencoding=utf-8
"set fileencodings=utf-8
set bomb 
"set binary "carefull activating this, since this my generate characters
set ttyfast

"" Fix backspace indent
set backspace=indent,eol,start

"" Tabs. May be overriten by autocmd rules
set tabstop=4
set softtabstop=0
set shiftwidth=4
set expandtab

"" Map leader to ,
let mapleader=','

"" Enable hidden buffers
set hidden

"" Searching
set hlsearch
set incsearch
set ignorecase
set smartcase

set fileformats=unix,dos,mac



" grep.vim
nnoremap <silent> <leader>f :Rgrep<CR>
let Grep_Default_Options = '-IR'
let Grep_Skip_Files = '*.log *.db'
let Grep_Skip_Dirs = '.git node_modules'

" NeoComplCache 

let g:neocomplcache_enable_at_startup = 1
let g:neocomplcache_enable_ignore_case = 1
let g:neocomplcache_enable_smart_case = 1
let g:neocomplcache_enable_auto_select = 1
let g:neocomplcache_enable_fuzzy_completion = 1
let g:neocomplcache_enable_camel_case_completion = 1
let g:neocomplcache_enable_underbar_completion = 1
let g:neocomplcache_fuzzy_completion_start_length = 1
let g:neocomplcache_auto_completion_start_length = 1
let g:neocomplcache_manual_completion_start_length = 1
let g:neocomplcache_min_keyword_length = 1
let g:neocomplcache_min_syntax_length = 1
let g:neocomplcache_same_filetype_lists = {}
let g:neocomplcache_same_filetype_lists._ = '_'

if &term =~ '256color'
    set t_ut=
endif

" Disable the blinking cursor.
set gcr=a:blinkon0
set scrolloff=3

" Status bar
set laststatus=2

" Use modeline overrides
set modeline
set modelines=10

" Title
set title
set titleold="Terminal"
set titlestring=%F

" Status line
set statusline=%F%m%r%h%w%=(%{&ff}/%Y)\ (line\ %l\/%L,\ col\ %c)\

" ripgrep
if executable('rg')
    let $FZF_DEFAULT_COMMAND = 'rg --files --hidden --follow --glob "!.git/*"'
    set grepprg=rg\ --vimgrep
    command! -bang -nargs=* Find call fzf#vim#grep('rg --column --line-number --no-heading --fixed-strings --ignore-case --hidden --follow --glob "!.git/*" --color "always" '.shellescape(<q-args>).'| tr -d "\017"', 1, <bang>0)
endif

" Syntastic
let g:syntastic_python_checkers=['python', 'flake8']
let g:syntastic_always_populate_loc_list=1
let g:syntastic_error_symbol='✗'
let g:syntastic_warning_symbol='⚠'
let g:syntastic_style_error_symbol = '✗'
let g:syntastic_style_warning_symbol = '⚠'
let g:syntastic_auto_loc_list=1
let g:syntastic_aggregate_errors = 1
let g:polyglot_disabled = ['python']
let python_highlight_all = 1

" Disabled by default because preview makes the window flicker
set completeopt-=preview

" c
autocmd FileType c setlocal tabstop=4 shiftwidth=4 expandtab
autocmd FileType cpp setlocal tabstop=4 shiftwidth=4 expandtab

" html
autocmd Filetype html setlocal ts=2 sw=2 expandtab

" javascript
let g:javascript_enable_domhtmlcss = 1
augroup vimrc-javascript
    autocmd!
    autocmd FileType javascript set tabstop=4|set shiftwidth=4|set expandtab softtabstop=4
augroup END

" Phyton
augroup vimrc-python
    autocmd!
    autocmd FileType python setlocal expandtab shiftwidth=4 tabstop=8 colorcolumn=79
                \ formatoptions+=croq softtabstop=4
                \ cinwords=if,elif,else,for,while,try,except,finally,def,class,with
augroup END

" jedi-vim
let g:jedi#popup_on_dot = 0
let g:jedi#goto_assignments_command = "<leader>g"
let g:jedi#goto_definitions_command = "<leader>d"
let g:jedi#documentation_command = "K"
let g:jedi#usages_command = "<leader>n"
let g:jedi#rename_command = "<leader>r"
let g:jedi#show_call_signatures = "0"
let g:jedi#completions_command = "<C-Space>"
let g:jedi#smart_auto_mappings = 0

" Ruby
let g:rubycomplete_buffer_loading = 1
let g:rubycomplete_classes_in_global = 1
let g:rubycomplete_rails = 1

augroup vimrc-ruby
    autocmd!
    autocmd BufNewFile,BufRead *.rb,*.rbw,*.gemspec setlocal filetype=ruby
    autocmd FileType ruby set tabstop=2|set shiftwidth=2|set expandtab softtabstop=2
augroup END

let g:tagbar_type_ruby = {
            \ 'kinds' : [
            \ 'm:modules',
            \ 'c:classes',
            \ 'd:describes',
            \ 'C:contexts',
            \ 'f:methods',
            \ 'F:singleton methods'
            \ ]
            \ }

"" RSpec.vim mappings ***********
map <Leader>t :call RunCurrentSpecFile()<CR>
map <Leader>s :call RunNearestSpec()<CR>
map <Leader>l :call RunLastSpec()<CR>
map <Leader>a :call RunAllSpecs()<CR>

"" For ruby refactory ***********
if has('nvim')
    runtime! macros/matchit.vim
else
    packadd! matchit
endif

nnoremap <leader>rap  :RAddParameter<cr>
nnoremap <leader>rcpc :RConvertPostConditional<cr>
nnoremap <leader>rel  :RExtractLet<cr>
vnoremap <leader>rec  :RExtractConstant<cr>
vnoremap <leader>relv :RExtractLocalVariable<cr>
nnoremap <leader>rit  :RInlineTemp<cr>
vnoremap <leader>rrlv :RRenameLocalVariable<cr>
vnoremap <leader>rriv :RRenameInstanceVariable<cr>
vnoremap <leader>rem  :RExtractMethod<cr>


" Vim Airline
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

if !exists('g:airline_powerline_fonts')
    let g:airline#extensions#tabline#left_sep = ' '
    let g:airline#extensions#tabline#left_alt_sep = '|'
    let g:airline_left_sep          = '▶'
    let g:airline_left_alt_sep      = '»'
    let g:airline_right_sep         = '◀'
    let g:airline_right_alt_sep     = '«'
    let g:airline#extensions#branch#prefix     = '⤴' "➔, ➥, ⎇
    let g:airline#extensions#readonly#symbol   = '⊘'
    let g:airline#extensions#linecolumn#prefix = '¶'
    let g:airline#extensions#paste#symbol      = 'ρ'
    let g:airline_symbols.linenr    = '␊'
    let g:airline_symbols.branch    = '⎇'
    let g:airline_symbols.paste     = 'ρ'
    let g:airline_symbols.paste     = 'Þ'
    let g:airline_symbols.paste     = '∥'
    let g:airline_symbols.whitespace = 'Ξ'
else
    let g:airline#extensions#tabline#left_sep = ''
    let g:airline#extensions#tabline#left_alt_sep = ''

    " powerline symbols
    let g:airline_left_sep = ''
    let g:airline_left_alt_sep = ''
    let g:airline_right_sep = ''
    let g:airline_right_alt_sep = ''
    let g:airline_symbols.branch = ''
    let g:airline_symbols.readonly = ''
    let g:airline_symbols.linenr = ''
endif

let g:airline_powerline_fonts = 0
let g:airline_theme = 'bubblegum'
let g:airline#extensions#whitespace#enabled = 0


let g:airline_theme = 'powerlineish'
let g:airline#extensions#syntastic#enabled = 1
let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tagbar#enabled = 1
let g:airline_skip_empty_sections = 1
let g:airline#extensions#virtualenv#enabled = 1



let g:indentLine_setColors = 0


let g:indentLine_char = 'c'

" Vim
let g:indentLine_color_term = 239

" GVim
let g:indentLine_color_gui = '#A4E57E'

" none X terminal
let g:indentLine_color_tty_light = 7 " (default: 4)
let g:indentLine_color_dark = 1 " (default: 2)

" Background (Vim, GVim)
let g:indentLine_bgcolor_term = 202
let g:indentLine_bgcolor_gui = '#FF5F00'

let g:indentLine_char_list = ['|', '¦', '┆', '┊']

let g:indentLine_concealcursor = 'inc'
let g:indentLine_conceallevel = 2

let g:indentLine_setConceal = 1

let g:indentLine_enabled = 1












" Fred's Setup Starts Here
set background=dark 

set wildmode=list:longest

set splitright



set cursorcolumn
"autocmd InsertEnter * highlight CursorLine guibg=#000050 guifg=fg 
"autocmd InsertLeave * highlight CursorLine guibg=#004000 guifg=fg 
set cursorline
"autocmd InsertEnter * highlight CursorColumn ctermfg=White ctermbg=Green cterm=bold guifg=white guibg=Green gui=bold
"autocmd InsertLeave * highlight CursorColumn ctermfg=Black ctermbg=Green cterm=bold guifg=Black guibg=Green gui=NONE



set number
set norelativenumber  " turn relative line numbers off

set autoindent      "Keep indentation from previous line
set smartindent     "Automatically inserts indentation in some cases
set cindent         "Like smartindent, but stricter and more customisable
set mouse=a
set ignorecase! 
set nowrap 

set directory=~/.vim/dirs/tmp     " directory to place swap files in
set backup                        " make backup files
set backupdir=~/.vim/dirs/backups " where to put backup files
set undofile                      " persistent undos - undo after you re-open the file
set undodir=~/.vim/dirs/undos
set viminfo+=n~/.vim/viminfo

let g:yankring_history_dir = '~/.vim/'  " store yankring history file there too

if !isdirectory(&backupdir)
    call mkdir(&backupdir, "p")
endif
if !isdirectory(&directory)
    call mkdir(&directory, "p")
endif
if !isdirectory(&undodir)
    call mkdir(&undodir, "p")
endif

let g:netrw_dirhistmax=0 "disable it from creating netrw file

colorscheme gruvbox
"colorscheme monokai
"colorscheme PaperColor
"colorscheme dracula

map <C-Up> :vertical resize +10<CR>
map <C-Down> :vertical resize -10<CR>
map <C-Left> :tabp<CR>
map <C-Right> :tabn<CR>
map <Backspace> :e#<CR>
map <Space><Space> :q<CR>

nmap ,vr :so ~/.vim/vimrc<CR>
nmap ,l :r!ls<CR>
nmap ,sql :r!start http://localhost/phpmyadmin<CR>
nmap ,wamp :r!start /c/wamp64/wampmanager.exe<CR>
nmap ,tn :tabnew<CR>
nmap ,vn :vnew<CR>
nmap ,n :new<CR>
nmap ,vsp :vsp<CR>
nmap ,sp :sp<CR>
nmap ,cp :copen<CR>
nmap ,vim :find ~/.vim/vimrc<CR>
nmap ,bash :edit ~/.bashrc<CR>
nmap ,vh :edit /c/wamp64/bin/apache/apache2.4.27/conf/extra/httpd-vhosts.conf<CR>
nmap ,h :edit /c/windows/system32/drivers/etc/hosts<CR>
nmap ,, <C-w><C-w>
nmap ,nf :vimgrep /xxx/gj **/*
nmap ,r :cfdo %s/xxx/xxx/g
nmap ,u :cfdo update<CR>
nmap ,wall :wall<CR>
nmap ,rep :%s/xxx/xxx/g
nmap ss :w<CR>
nmap ,k :r!
nmap ,tl :r!start ~/.vim/task.log<CR> 
nmap ,kk :set filetype=vim<CR>
nmap ,1 :r!start http://dev1<CR>
nmap ,2 :r!start http://dev2<CR>
nmap ,3 :r!start http://dev3<CR>
nmap ,4 :r!start http://dev4<CR>
nmap ,5 :r!start http://dev5<CR>
nmap ,6 :r!start http://dev6<CR>
nmap ,7 :r!start http://dev7<CR>
nmap ,8 :r!start http://dev8<CR>
nmap ,bcss :%s/[{;}]/&\r/g|norm! =gg 
nmap ,mm :set modifiable<CR>

inoremap ;php <?php  ?><Esc>hhh<Esc><Esc>a
inoremap ;class  class=""<Esc>
imap jj <Esc>
imap ss <Esc>:w<CR>

function! Desktop()
    :edit ~/desktop
    :cd ~/desktop
endfunction
nmap ,desk :call Desktop()<CR>

function! WwwPath()
    :edit /c/wamp64/www/devs/
    :cd /c/wamp64/www/devs/
endfunction
nmap ,www :call WwwPath()<CR>

function! Gmoo()
    :r!start www.gmail.com/
endfunction
nmap ,gl :call Gmoo()<CR>

function! Skype()
    :r!start https://web.skype.com/en/
endfunction
nmap ,skype :call Skype()<CR>

function! Dskype()
    :cd /c/Program Files (x86)/Microsoft/Skype for Desktop
    :r!start Skype.exe
endfunction
nmap ,dskype :call Dskype()<CR>

function! ReFresh()
    :edit
endfunction


function! TaskMgr()
    :r!start /c/WINDOWS/system32/Taskmgr.exe
endfunction
nmap ,tk :call TaskMgr()<CR>

function! Odu()
    :r!start https://mail.google.com/mail/u/1/
    :r!start https://dm.accelo.com/?action=task_board
    :r!start /c/wamp64/wampmanager.exe

    :cd /c/Program Files (x86)/Microsoft/Skype for Desktop
    :r!start Skype.exe 

    :r!start http://localhost/phpmyadmin

endfunction
nmap ,odu :call Odu()<CR>





"b:hi Directory ctermfg=gray<CR>

"To delete file: use --- del PATH_TO_FILE
"To delete folder with all files in it: use --- rmdir /s /q PATH_TO_FOLDER
"To delete all files from specific folder (not deleting folder itself) is a little bit complicated. del /s *.* cannot delete folders, but removes files from all subfolder. So two commands are needed:
"use --- del /q PATH_TO_FOLDER\*.*
"use --- for /d %i in (PATH_TO_FOLDER\*.*) do @rmdir /s /q "%i"
"Reference: https://stackoverflow.com/questions/1502913/how-to-delete-all-files-and-folders-in-a-folder-by-cmd-call
"
"
" jcd061719900**0221
"
"
"
"	//AJAX ready
"	wp_localize_script( 'digipress-custom', 'frontEndAjax', array(
"		'ajaxurl' => admin_url( 'admin-ajax.php' ),
"		'nonce'   => wp_create_nonce( 'ajax_nonce' ),
"	));
"
"
"https://www.youtube.com/watch?v=OnUiHLYZgaA

