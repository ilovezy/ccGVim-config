set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=$VIM/vimfiles/bundle/Vundle.vim
call vundle#begin('$VIM/vimfiles/bundle/')
"call vundle#begin('~/some/path/here')
" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'flazz/vim-colorschemes'
Plugin 'kien/ctrlp.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'bling/vim-airline'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'mattn/emmet-vim'
Plugin 'msanders/snipmate.vim'
Plugin 'Lokaltog/vim-easymotion'
Plugin 'pangloss/vim-javascript'
Plugin 'plasticboy/vim-markdown'
Plugin 'tpope/vim-unimpaired'
Plugin 'Raimondi/delimitMate'
Plugin 'mhinz/vim-startify'
Plugin 'tpope/vim-vinegar'
Plugin 'skammer/vim-css-color'
Plugin 'iangmiao/auto-pairs'
Plugin 'vimwiki/vimwiki'
Plugin 'maksimr/vim-jsbeautify'
Plugin 'sjas/csExplorer'
Plugin 'ciaranm/detectindent'
Plugin 'kana/vim-smartinput'
Plugin 'tpope/vim-jdaddy'
Plugin 'leshill/vim-json'
Plugin 'qstrahl/vim-matchmaker'
Plugin 'scrooloose/nerdcommenter'
Plugin 'myusuf3/numbers.vim'
" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

".vimrc
map <F3> : call JsBeautify() <cr>
" or
autocmd FileType javascript noremap <buffer> <F3> :call JsBeautify()<cr>
"for html
autocmd FileType html noremap <buffer> <F3> : call HtmlBeautify() <cr>
" for css or scss
autocmd FileType css noremap <buffer> <F3> :call CSSBeautify()<cr>

"emmet
let g:user_emmet_expandabbr_key='<c-e>'
let g:use_emmet_complete_tag=1

inoremap <F4> :call NumbersToggle<cr>

" 基于缩进或语法进行代码折叠
set foldmethod=indent
"set foldmethod=syntax
" 启动 vim 时关闭折叠代码
set nofoldenable
set foldlevel=3
set laststatus=2

" solarized
syntax enable
set bg=light
colorscheme solarized

" nerdtree
map <F2> :NERDTreeMirror<CR>
map <F2> :NERDTreeToggle<CR>

" matchmaker
let g:matchmaker_enable_startup = 1

" ctrlp
let g:ctrlp_use_caching = 1 
let g:ctrlp_clear_cache_on_exit = 0 
let g:ctrlp_cache_dir = $HOME.'/.vim/tmp/cache/ctrlp' 
let g:ctrlp_show_hidden = 0 
let g:ctrlp_lazy_update = 1 
let g:ctrlp_open_new_file = 't'
set wildignore+=*/tmp/*,*.so,*.swp,*.zip
let g:ctrlp_custom_ignore = { 
\ 'dir': '\v[\/]\.(git|hg|svn)$', 
\ 'file': '\v\.(exe|so|dll|tar|bz2|7z|rar|zip|pdf|epub|mobi|chm|swp|pyc|gz|iso|mov|avi|mkv|flv|ogv|m4v|mp4|ass|srt|torrent|vdi|jpg|gif|png|ico|tdl|xmind|db|ttf|otf|egg|jar|nfo|frp|sublime-package)$', 
\ }


set encoding=utf-8
set fileencodings=utf-8,chinese
set termencoding=utf-8
if has("win32")
set fileencoding=chinese
else
set fileencoding=utf-8
endif
"解决菜单乱码
source $VIMRUNTIME/delmenu.vim
source $VIMRUNTIME/menu.vim
"解决consle输出乱码
language messages zh_CN.utf-8
set scrolloff=5   
set showmatch 
set clipboard+=unnamed
set nocompatible

source $VIMRUNTIME/vimrc_example.vim
source $VIMRUNTIME/mswin.vim
behave mswin

set diffexpr=MyDiff()
function MyDiff()
  let opt = '-a --binary '
  if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
  if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
  let arg1 = v:fname_in
  if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
  let arg2 = v:fname_new
  if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
  let arg3 = v:fname_out
  if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
  let eq = ''
  if $VIMRUNTIME =~ ' '
    if &sh =~ '\<cmd'
      let cmd = '""' . $VIMRUNTIME . '\diff"'
      let eq = '"'
    else
      let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
    endif
  else
    let cmd = $VIMRUNTIME . '\diff'
  endif
  silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3 . eq
endfunction

filetype plugin on
set fileencodings=utf-8,ucs-bom,gb18030,gbk,gb2312,cp936
set ai
set showmatch
set ws
set softtabstop=4
set nobackup
set ignorecase
set hlsearch
set incsearch
set guifont=consolas:h12:cANSI
set tabstop=4
set expandtab
set nu!
syntax on
set shiftwidth=4
set ai!
set showmatch
set ruler
set visualbell t_vb=  "关闭visual bell
au GuiEnter * set t_vb= "关闭beep


set gcr=n-v-c:ver15-Cursor/lCursor,ve:ver35-Cursor,o:hor50-Cursor,i-ci:ver15-Cursor/lCursor,a:blinkon0
if has("win32")  
set termencoding=chinese  
endif
set magic
set guioptions-=m
set guioptions-=T
set bsdir=buffer 
set wildmenu
"set cursorline
let loaded_matchparen=1
winpos 850 100  
set lines=40 columns=90


" cc 的符号两边空格
inoremap , ,<space>
inoremap : :<space>
ino == <space>==<space>
ino <= <space><=<space>
ino *= <space>*=<space>
ino /= <space>/=<space>
ino // //<space>
ino >= <space>>=<space>
ino === <space>===<space>
ino += <space>+=<space>
ino -= <space>-=<space> 
ino && <space>&&<space>
ino !== <space>!==<space>
ino \|\| <space>\|\|<space>


