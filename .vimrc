set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
" GENERAL PLUGINS
" APPEARANCE
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'flazz/vim-colorschemes'

" PROGRAMMING PLUGINS
" The following are examples of different formats supported.
" plugin on GitHub repo
Plugin 'tpope/vim-fugitive'
Plugin 'jiangmiao/auto-pairs'
Plugin 'scrooloose/nerdtree.git'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'mhinz/vim-signify'
Plugin 'scrooloose/syntastic'
Plugin 'scrooloose/nerdcommenter'
Plugin 'Shougo/neocomplete.vim'
Plugin 'Konfekt/FastFold'
Plugin 'Shougo/neosnippet'
Plugin 'Shougo/neosnippet-snippets'
Plugin 'klen/python-mode'
Plugin 'fatih/vim-go'

" NOTES
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
" Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
" Plugin 'ascenator/L9', {'name': 'newL9'}

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
"

" Let me use the mouse
set mouse=a
" Set a colorcolumn at 80th char
set cc=80

" Set tab widths and expand tabs
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set encoding=utf-8

" Filetype specific settings
" *.java files
autocmd FileType java setlocal shiftwidth=2 tabstop=2 softtabstop=2 expandtab

" *.html files
autocmd FileType html setlocal shiftwidth=2 tabstop=2 softtabstop=2 expandtab

" *.html files
autocmd FileType javascript setlocal shiftwidth=2 tabstop=2 softtabstop=2 expandtab

" Required for nerdcommenter and file dependent scripts
filetype plugin on

let mapleader = ','
syntax on

" save and restore folds when a file is closed and re-opened
autocmd BufWinLeave *.* mkview
autocmd BufWinEnter *.* silent loadview
autocmd BufWinEnter *.* set cc=80

" when entering new buffers, set a color column at 80
autocmd BufEnter set cc=80

" Fugitive mapping
nmap <leader>gs :Gstatus<cr>
nmap <leader>gc :Gcommit<cr>
nmap <leader>ga :Gwrite<cr>
nmap <leader>gl :Glog<cr>
nmap <leader>gd :Gdiff<cr>
nmap <leader>gp :Git push<cr>

" NerdTree mapping
map <C-n> :NERDTreeToggle<CR>

" for autocompletion, disbale search of included files
set complete-=i
let g:pymode_rope_lookup_project = 0
" autoclose pydoc when leaving insert
autocmd InsertLeave * if pumvisible() == 0|pclose|endif

" Turn off auto comment
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

""""""""""" NEOCOMPLETE SETTINGS """""""""""""""
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplete.
let g:neocomplete#enable_at_startup = 1
" Use smartcase.
let g:neocomplete#enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplete#sources#syntax#min_keyword_length = 3
let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
" Plugin key-mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

"""""""""""""""""""""""""""""""""""""""""""


""""""""""" SYNTASTIC PYTHON SETTINGS """""""""""""""
let g:syntastic_python_checkers = ['pyflakes', 'python', 'pylint']

"""""""""""""""""""""""""""""""""""""""""""

""""""""""" PYMODE SETTINGS """""""""""""""
" set pyflakes to use python3 syntax
let g:pymode_python = 'python3'
" check EVERY time I save
let g:pymode_lint_unmodified = 1
" Ignore warning about TODOs, and catching to broad of exception 
" Exception warning
let g:pymode_lint_ignore = "W0511,R0911,F0401,W0633,R0914,C0302,E124,F0002"
" set my lint checkers
" removed pylint because bogus stargs error
let g:pymode_lint_checkers = ['pylint', 'pep8']
" set mccabe complexity maximum compl.
let g:pymode_lint_options_mccabe = { 'complexity': 14 }

"""""""""""""""""""""""""""""""""""""""""""

""""""""""" SYNTASTIC SETTINGS """""""""""""""
" don't check syntac on python files, use python-mode for that
let g:syntastic_mode_map = {
    \ "mode": "active",
    \ "active_filetypes": [],
    \ "passive_filetypes": ["python"] }

"""""""""""""""""""""""""""""""""""""""""""
""""""""""" AUTOPAIR SETTINGS """""""""""""""
let g:AutoPairsShortcutFastWrap = '<C-l>'

" Popup colorscheme
hi Pmenu ctermbg=0
hi Pmenu ctermfg=15

" if i scroll off screen, leave 3 lines around my cursor
" (so it doesnt sit at the bottom)
set scrolloff=3
set autoindent
set showmode
set cursorline
" shows cmd typed in bottom right
set showcmd


" Make backspace work like normal
set backspace=indent,eol,start

" show relative numbers
set relativenumber

function! NumberToggle()
    set number!
    set relativenumber!
endfunc
" set <C-l> to toggle relative and non relative
nnoremap <C-l> :call NumberToggle()<cr>

" APPEARANCE
" for vim-airline
set laststatus=2
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#branch#enabled = 1
let g:airline_theme = 'term'
colorscheme crayon

" windows
set splitbelow
set splitright


" FUNCTIONALITY
" stop me from using arrow keys
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>

"Remove all trailing whitespace by pressing F5
nnoremap <F5> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar><CR>

" ignore case ignores case when typin in lower case search
set ignorecase
" smart case will match only if i write an uppercase letter
set smartcase
set gdefault
set incsearch
set showmatch
set hlsearch
" set // to search selected text
vnoremap // y/<C-R>"<CR>"
" set ,<space> to :noh
nnoremap <leader><space> :noh<cr>

" jump commands
function! GotoJump()
    jumps
    let j = input("Please select your jump: ")
    if j != ''
        let pattern = '\v\c^\+'
        if j =~ pattern
            let j = substitute(j, pattern, '', 'g')
            execute "normal " . j . "\<c-i>"
        else
            execute "normal " . j . "\<c-o>"
        endif
    endif
endfunction

nmap <Leader>j :call GotoJump()<CR>

" set up buffer commands
set hidden
" To open a new empty buffer
" This replaces :tabnew which I used to bind to this mapping
nmap <leader>T :enew<cr>
" Move to the next buffer
nmap <leader>l :bnext<CR>
" Move to the previous buffer
nmap <leader>h :bprevious<CR>
" Close the current buffer and move to the previous one
" This replicates the idea of closing a tab
nmap <leader>bq :bp <BAR> bd #<CR>
" Show all open buffers and their status
nmap <leader>bl :ls<CR>
