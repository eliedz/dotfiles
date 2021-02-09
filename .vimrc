" don't make vim compatible with vi
set nocompatible 
" set unix line endings
set fileformat=unix
" when reading files try unix line endings then dos, also use unix 
" for new buffers
set fileformats=unix,dos

" screen will not be redrawn while running macros, registers or other 
" non-typed comments
set lazyredraw

"Vundle setup
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()         "Start vundle

"Put all plugins here

"Vundle, handles itself
"========================
Plugin 'VundleVim/Vundle.vim'
"gruvbox for background style
"========================
Plugin'morhetz/gruvbox' 
"indentLine for indentation
"========================
Plugin 'Yggdroot/indentLine'
"ale for Async linting
"========================
Plugin 'dense-analysis/ale'

"End of plugin List
"===========
call vundle#end()
filetype plugin indent on
" Colorscheme
" ===========
" turn on syntax highlighting
syntax on
colorscheme gruvbox
let g:gruvbox_contrast_dark='hard'
set background=dark

" Key bindings
" ============
map Y y$
" Don't indent hashes
inoremap # X<C-H>#

runtime macros/matchit.vim
" Settings
" ========
"
" make vim try to detect file types and load plugins for them
filetype on
filetype plugin on
filetype indent on

" reload files changed outside vim
set autoread

" show line numbers
set relativenumber
set number
set numberwidth=1

" show file title
set title
set wildmode=full
set synmaxcol=200
set complete+=kspell
" make backspace delete over line breaks
" or automatically-inserted indentation
set backspace=indent,eol,start

" Bell/blink
" ----------
set noerrorbells
set vb t_vb=
au GuiEnter * set visualbell t_vb=

" Editing
" -------
set cursorline " have a line indicate the cursor location
set virtualedit=block " Let cursor move past the last char in <C-v> mode
set scrolloff=3 " Keep 3 context lines above and below the cursor
set backspace=2 " Allow backspacing over autoindent, EOL, and BOL
set nowrap " don't wrap text
set linebreak " don't wrap textin the middle of a word
set smartindent " use smart indent if there is no indent file
set tabstop=4 " <tab> inserts 4 spaces
set shiftwidth=4 " but an indent level is 2 spaces wide.
set softtabstop=4 " <BS> over an autoindent deletes both spaces.
set expandtab " Use spaces, not tabs, for autoindent/tab key.
set shiftround " rounds indent to a multiple of shiftwidth
set matchpairs+=<:> " show matching <> as well
set foldmethod=indent " allow us to fold on indents
set foldlevel=99 " don't fold by default
set ttimeoutlen=50 " don't wait too long for mapped sequences on key codes
autocmd FileType rst,markdown setlocal spell " spell correction for some files

" YAML editing
" ------------
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab
let g:indentLine_char = '⦙'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
let g:ale_sign_error = '✘'
let g:ale_sign_warning = '⚠'
let g:ale_lint_on_text_changed = 'never'

"
" Messages/Info/Status
" --------------------
set ls=2 " always show status line
set confirm " Y-N-C prompt if closing with unsaved changes.
set showcmd " Show incomplete normal mode commands as I type.
set report=0 " : commands always print changed line count.
set shortmess+=a " Use [+]/[RO]/[w] for modified/readonly/written.
set ruler " Show some info, even without statuslines.
set statusline=[%l,%v\ %P%M]\ %f\ %r%h%w\ (%{&ff})
set listchars=tab:»·,eol:↵,trail:·,precedes:«,extends:»
set list

" Searching
" ---------
set smartcase " unless uppercase letters are used in the regex.

" Display
" -------
if has("gui_running")
    " Remove menu bar, toolbar and scrollbars
    set guioptions=
    " Set size
    set columns=80
    set lines=24
    au BufRead * let &numberwidth = float2nr(log10(line("$"))) + 2
              \| let &columns = &numberwidth + 80
endif
set colorcolumn=80
