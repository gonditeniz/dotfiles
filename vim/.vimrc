" General
set nocompatible                        " Explicitly get out of VI-compatible mode
set visualbell                          " Visual bell instead of noisy bell 
set nobackup                            " Do not create backup files
set viminfo=%,'50,\"100,n~/.viminfo     " Save the first 100 lines of each register in the viminfo file
set showcmd                             "  Shows pressed keys in normal mode
set ruler                               " Shows Column & line
set paste

" Syntax and typing
syntax on                               " Enables syntax highlighting
set scrolloff=2                         " Avoid typing in the first or last line of the screen
set backspace=indent,eol,start          " See manual for these options 
set noexpandtab                         " Needed when using tabstop and shiftwidth
set smartindent                         " Indent like 'autoindent', only smarter
set expandtab                           " In Insert mode, tabs are replaced by spaces
set shiftwidth=2                        " 4 spaces for each tab
set softtabstop=2                       " 4 spaces for each tab
set omnifunc=syntaxcomplete#Complete
set background=dark                     " Appropriate colors for dar barckground

" Buffers
set hidden                              " Allow changing between buffers without saving files

" Information
set number                              " Add linenumbers
set laststatus=2                        " Always show status bar 

" Search
set incsearch nohlsearch                " Incremental searching
set ignorecase                          " Ignore case searching
set smartcase                           " Smartcase searching (lower case := case insensitive; some upper-case := case sensitive)
"set hlsearch                           " Colorized search 
"highlight Search ctermbg=14

set filetype=on                         " Add support for filetypes
"set statusline=%F%m%r%h%w\ [POS=%04l,%04v] " Set statusline
set efm=\%f:%l\%.%#\ \error:\ %#%m      " Put cursor at compilation error 
"set cursorline                          " Show line under current cursor line
"colorscheme peaksea                     " Set colorscheme

" egondia's configuration
set wildmenu
set wildmode=longest,full               " Filename completion to longest common string (first tab) and to list of alternatives (second tab)
set ffs=unix
xnoremap p pgvy                         " Don't yank replaced lines when pasting

" Globals Variables 
let g:ttcn_minlines=100                 " TTCN syntax highlighting restriction

filetype plugin indent on

:augroup vim
        :au BufNewFile,BufRead *.vim set tabstop=4
        :au BufNewFile,BufRead *.vim set shiftwidth=4
        :au BufNewFile,BufRead *.vim set filetype=vim
        :au BufNewFile,BufRead *.vim set smartindent
:augroup END

:augroup perl
        :au BufNewFile,BufRead *.p[lm] set tabstop=4
        :au BufNewFile,BufRead *.p[lm] set shiftwidth=4
        :au BufNewFile,BufRead *.p[lm] set filetype=perl
        :au BufNewFile,BufRead *.p[lm] set tags=/home/epetdir/tags " AutoST tags
        :au BufNewFile *.pl 0r /home/epetdir/.vim//plugin/templates/perl-file-header
        :au BufNewFile,BufRead *.p[lm] set autoindent
:augroup END

:augroup ttcn
        :au BufNewFile,BufRead *.ttcn set tabstop=4
        :au BufNewFile,BufRead *.ttcn set shiftwidth=4
        :au BufNewFile,BufRead *.ttcn set filetype=ttcn
        :au BufNewFile,BufRead *.ttcn set tags=/vobs/ggsn_test/ttcn3/bin/tags " TTCN-3 tags
        :au BufNewFile,BufRead *.ttcn call MakeTTCN()
        :au BufNewFile,BufRead *.ttcn set smartindent
:augroup END

:augroup ttcn_log
        : au BufRead *.log call DecideLOG()
:augroup END

" Defined Signs
sign define fixme text=!> texthl=Error

" Source files 
source $HOME/.vim/rc/mappings.vim
source $HOME/.vim/rc/abbrevations.vim
source $HOME/.vim/rc/highlights.vim
source $HOME/.vim/rc/functions.vim

"Comments
:au FileType c,cpp,java,ttcn let b:comment_leader = '// '
:au FileType sh,make,cfg,p[lm] let b:comment_leader = '# '
:au FileType vim let b:comment_leader = '" '

:noremap <silent> ,c :<C-B>sil <C-E>s/^/<C-R>=escape(b:comment_leader,'\/')<CR>/<CR>:noh<CR>
:noremap <silent> ,u :<C-B>sil <C-E>s/^\V<C-R>=escape(b:comment_leader,'\/')<CR>//e<CR>:noh<CR>

:map <F12> :TlistToggle<CR>

" Permanent highlight 'TODO'
:3match TODO /\<TODO\>/

" Formating
"autocmd FileType python set complete+=k~/.vim/syntax/python.vim isk+=.,(
"" Use the below highlight group when displaying bad whitespace is desired.
"highlight BadWhitespace ctermbg=red guibg=red 
"" Display tabs at the beginning of a line in Python mode as bad.
"" Also make trailing whitespace be flagged as bad.
"au BufRead,BufNewFile *.py,*.pyw match BadWhitespace /^\t\+\|\s\+$/
"" Trim trailing whitespace
"autocmd BufWritePre *.py normal m`:%s/\s\+$//e `` 


" TagList
let g:ttcn_fold = 1
let tlist_ttcn_settings='ttcn3;c:classes;d:macro definitions;e:enumerators;f:function definitions;g:enumaration names;m:class;p:programs;t:task;T:typedefs;v:variable'
let Tlist_WinWidth = 30
let Tlist_Auto_Update = 1
set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [ASCII=\%03.3b]\ [HEX=\%02.2B]\ [POS=%04l,%04v][%p%%]\ [LEN=%L]
set laststatus=2

" Don't add newline at the end when saving
set binary
set noeol