set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')



" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

Plugin 'altercation/vim-colors-solarized'
Plugin 'scrooloose/nerdtree'
Plugin 'vim-scripts/indentpython.vim'
Plugin 'scrooloose/syntastic'
Plugin 'nvie/vim-flake8'
Plugin 'kien/ctrlp.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'bling/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'majutsushi/tagbar'
Plugin 'scrooloose/nerdcommenter'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'tpope/vim-surround'
Plugin 'mattn/emmet-vim'
Plugin 'lervag/vimtex'
Plugin 'valloric/YouCompleteMe'
Plugin 'easymotion/vim-easymotion'
Plugin 'honza/vim-snippets'
Plugin 'tpope/vim-repeat'
Plugin 'SirVer/ultisnips'
Plugin 'tmhedberg/matchit'
Plugin 'ervandew/supertab'
Plugin 'voithos/vim-python-matchit'
" ------------------------------------------------------
" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
" Plugin 'tpope/vim-fugitive'

" plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'

" Git plugin not hosted on GitHub
" Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)

" Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.


" Pass the path to set the runtimepath properly.
" Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}


" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
" Plugin 'ascenator/L9', {'name': 'newL9'}
"-----------------------------------------------------------
" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

set number

syntax enable
set background=dark
colorscheme solarized
se t_Co=256
" let g:solarized_termcolors=256

" let python_highlight_all=1
syntax on

" set for fold
set foldmethod=indent
set foldlevel=99
nnoremap <space> za

set fileencodings=utf-8,ucs-bom,gb18030,gbk,gb2312,cp936
set termencoding=utf-8
set encoding=utf-8
set guifontwide=*


" get rid of space in the end
" au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/
autocmd BufWritePre *.py normal m`:%s/\s\+$//e``

" indent just for python
" au BufRead,BufNewFile *py,*pyw,*.c,*.h set tabstop=4
set tabstop=4
au BufNewFile,BufRead *.py set softtabstop=4
au BufNewFile,BufRead *.py  set shiftwidth=4
au BufNewFile,BufRead *.py   set textwidth=79
au BufNewFile,BufRead *.py    set expandtab
au BufNewFile,BufRead *.py     set autoindent
au BufNewFile,BufRead *.py     set fileformat=unix





" for show air-line
set laststatus=2
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme='solarized'
let g:airline_powerline_fonts = 1

" for NERDTree
map <C-n> :NERDTreeToggle<CR>

" for insert move action

" Below is mapping used for insert mode
" If you want to use Alt key, you need below statment to make terminal 
" can recognize Alt key, by now , all 26 letters have been mapped. 
" In the future, you can change it. 
let c='a'
while c <= 'z'
   exec "set <A-".c.">=\e".c
       exec "imap \e".c." <A-".c.">"
           let c = nr2char(1+char2nr(c))
	endw
set timeout ttimeoutlen=50
" go to the b/e of document
inoremap <A-f> <C-o>gg
"inoremap <A-g> <C-o>G

" go to the b/e of sentence
inoremap <A-i> <C-o>I
inoremap <A-a> <C-o>A

" insert new line above/below current line
inoremap <A-p> <C-o>O
inoremap <A-o> <C-o>o

" move to previous/next word 
inoremap <A-w> <C-o>w
inoremap <A-b> <C-o>b

" move four directions
inoremap <A-h> <C-o>h
inoremap <A-j> <C-o>j
inoremap <A-k> <C-o>k
inoremap <A-l> <C-o>l

" scoll screen 
inoremap <A-y> <C-o><C-f>
inoremap <A-t> <C-o><C-b>
inoremap <A-u> <C-o><C-e>
inoremap <A-r> <C-o><C-y>
inoremap <A-z> <C-o>f
inoremap <A-q> <C-o>F

"go to mark
inoremap <A-m> <C-o>m
inoremap <A-n> <C-o>`

"delete right
inoremap <A-x> <C-o>x
inoremap <A-v> <C-o>c$
inoremap <A-c> <C-o>cw


"edit command mapping in insert mode
inoremap <A-e> <C-o>e
inoremap <A-g> <C-o>u
inoremap <A-s> <C-o>:w<ENTER>
"delete to right word and sentence
"This is an important idea.
"And you can add other command mapping here later


inoremap YY <C-o>yy
inoremap PP <C-o>p

"delete the whole sentecne
inoremap <A-d> <C-o>cc

" quick switch to normal mode
inoremap jj <Esc>

" control buffer right now
inoremap RR <C-o>:bn<ENTER>
noremap RR :bn<ENTER>

" move to windows quickly
" There is only <A-d> left, so 

inoremap <C-c> <C-o><C-w>w
nmap <C-c> <C-w>w
inoremap <C-x> <C-o><C-w>c
nmap <C-x> <C-w>c
"inoremap <C-k> <C-o><C-w>k
"inoremap <C-l> <C-o><C-w>w



 map <Esc>[18~ <F7>
 set nocompatible
 set backspace=2

 noremap <F4> :set hlsearch! hlsearch?<CR>
 noremap <F3> :VimtexTocToggle<CR>
 set ww+=<,>,[,]
 let g:vimtex_fold_enabled = 1
 let g:vimtex_motion_matchparen = 0
" let mapleader='\' 
" call vimtex#imaps#add_map( {'lhs':'i', 'rhs':'\begin{itemize}', 'leader' :'\',  'wrapper' : 'vimtex#imaps#wrap_trivial'} )
" let g:user_emmet_leader_key='<C-l>'
imap hh <C-y>,
autocmd FileType html,php,tex runtime macros/matchit.vim
autocmd FileType html,php let b:match_words='<:>,<\@<=\([^/][^ \t>]*\)[^>]*\%(>\|$\):<\@<=/\1>'

" let g:ycm_server_keep_logfiles = 1
" let g:ycm_server_log_level = 'debug'

let g:ycm_server_python_interpreter = '/usr/bin/python'

" YouCompleteMe
set runtimepath+=~/.vim/bundle/YouCompleteMe
let g:ycm_collect_identifiers_from_tags_files = 1           " 开启 YCM
" 基于标签引擎
let g:ycm_auto_trigger = 0
let g:ycm_collect_identifiers_from_comments_and_strings = 1 "
" 注释与字符串中的内容也用于补全
let g:syntastic_ignore_files=[".*\.py$"]
let g:ycm_seed_identifiers_with_syntax = 1                  " 语法关键字补全
let g:ycm_complete_in_comments = 1
let g:ycm_confirm_extra_conf = 0
let g:ycm_key_list_select_completion = ['<c-n>', '<Down>']  " 映射按键,
" 没有这个会拦截掉tab, 导致其他插件的tab不能用.
let g:ycm_key_list_previous_completion = ['<c-p>', '<Up>']
let g:ycm_complete_in_comments = 1                          "
" 在注释输入中也能补全
let g:ycm_complete_in_strings = 1                           "
" 在字符串输入中也能补全
let g:ycm_collect_identifiers_from_comments_and_strings = 1 "
" 注释和字符串中的文字也会被收入补全
let g:ycm_global_ycm_extra_conf='~/.ycm_extra_conf.py'
"let g:ycm_global_ycm_extra_conf='~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'
let g:ycm_show_diagnostics_ui = 1                           " 禁用语法检查
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<CR>" |            "
" 回车即选中当前项
nnoremap <c-j> :YcmCompleter GoToDefinitionElseDeclaration<CR>|     "
" 跳转到定义处
" let g:ycm_min_num_of_chars_for_completion=2                 "
" 从第2个键入字符就开始罗列匹配项
"

let g:EasyMotion_smartcase = 1
"let g:EasyMotion_startofline = 0 " keep cursor colum when JK motion
map <Leader><leader>h <Plug>(easymotion-linebackward)
map <Leader><Leader>j <Plug>(easymotion-j)
map <Leader><Leader>k <Plug>(easymotion-k)
map <Leader><leader>l <Plug>(easymotion-lineforward)
map <Leader><leader>. <Plug>(easymotion-repeat)


nnoremap <leader>a a_<ESC>r
nnoremap <leader>i i_<ESC>r
" Common used command
"1) IndentGuidesToggle
"
"
nnoremap <Left> :echo "No left for you!"<CR>
vnoremap <Left> :<C-u>echo "No left for you!"<CR>
inoremap <Left> <C-o>:echo "No left for you!"<CR>

noremap <Up> :echo "No left for you!"<CR>
vnoremap <Up> :<C-u>echo "No left for you!"<CR>
inoremap <Up> <C-o>:echo "No left for you!"<CR>

noremap <Down> :echo "No left for you!"<CR>
vnoremap <Down> :<C-u>echo "No left for you!"<CR>
inoremap <Down> <C-o>:echo "No left for you!"<CR>

noremap <Right> :echo "No left for you!"<CR>
vnoremap <Right> :<C-u>echo "No left for you!"<CR>
inoremap <Right> <C-o>:echo "No left for you!"<CR>




map <F7> :r!xclip -o<CR>
vmap <F6> :'<,'>w !xclip<CR>
"vmap <F6> :!xclip -f -sel clip<CR>

au VimEnter * silent execute "!xmodmap -e 'clear Lock' -e 'keycode 0x42 = Escape'"
au VimLeave * silent execute "!xmodmap -e 'clear Lock' -e 'keycode 0x42 = Caps_Lock'"

nmap <F8> :TagbarToggle<CR>

" let maplocalleader='\'
let g:SuperTabDefaultCompletionType = "context"
hi MatchParen cterm=none ctermbg=green ctermfg=blue

if has("autocmd")
	" you can off blink cursor
	 au InsertEnter * silent execute "!gconftool-2 --set /apps/gnome-terminal/profiles/Default/cursor_blink_mode --type string on"	
  au InsertEnter * silent execute "!gconftool-2 --type string --set /apps/gnome-terminal/profiles/Default/cursor_shape ibeam"
  au InsertLeave * silent execute "!gconftool-2 --type string --set /apps/gnome-terminal/profiles/Default/cursor_shape block"
  au VimLeave * silent execute "!gconftool-2 --type string --set /apps/gnome-terminal/profiles/Default/cursor_shape ibeam"
 endif



