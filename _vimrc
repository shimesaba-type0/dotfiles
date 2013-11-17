" All system-wide defaults are set in $VIMRUNTIME/debian.vim (usually just
" /usr/share/vim/vimcurrent/debian.vim) and sourced by the call to :runtime
" you can find below.  If you wish to change any of those settings, you should
" do it in this file (/etc/vim/vimrc), since debian.vim will be overwritten
" everytime an upgrade of the vim packages is performed.  It is recommended to
" make changes after sourcing debian.vim since it alters the value of the
" 'compatible' option.

" This line should not be removed as it ensures that various options are
" properly set to work with the Vim-related packages available in Debian.
runtime! debian.vim

" Uncomment the next line to make Vim more Vi-compatible
" NOTE: debian.vim sets 'nocompatible'.  Setting 'compatible' changes numerous
" options, so any other options should be set AFTER setting 'compatible'.
"set compatible

" Vim5 and later versions support syntax highlighting. Uncommenting the next
" line enables syntax highlighting by default.
if has("syntax")
  syntax on
endif

" If using a dark background within the editing area and syntax highlighting
" turn on this option as well
"set background=dark

" Uncomment the following to have Vim jump to the last position when
" reopening a file
"if has("autocmd")
"  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
"endif

" Uncomment the following to have Vim load indentation rules and plugins
" according to the detected filetype.
"if has("autocmd")
"  filetype plugin indent on
"endif

" The following are commented out as they cause vim to behave a lot
" differently from regular Vi. They are highly recommended though.
"set showcmd		" Show (partial) command in status line.
"set showmatch		" Show matching brackets.
"set ignorecase		" Do case insensitive matching
"set smartcase		" Do smart case matching
"set incsearch		" Incremental search
"set autowrite		" Automatically save before commands like :next and :make
"set hidden             " Hide buffers when they are abandoned
"set mouse=a		" Enable mouse usage (all modes)

" Source a global configuration file if available
if filereadable("/etc/vim/vimrc.local")
  source /etc/vim/vimrc.local
endif


"-----------------------
" ここから個人設定
" ----------------------
" 常にステータス行を表示
set laststatus=2
" タイトルを表示
set title

" 不可視文字の表示
set list
"set listchars=tab:>_,trail:-,eol:$,extends:>>,precedes:<<,nbsp:%

" 行番号表示
set number

" 括弧の補完
inoremap ( ()<left>
inoremap { {}<left>
inoremap < <><left>
inoremap [ []<left>

" 挿入モードでのカーソル移動
inoremap <C-j> <Down>
inoremap <C-k> <Up>
inoremap <C-h> <Left>
inoremap <C-l> <Right>

" コーテーションの補完
inoremap ' ''<left>

" ESCのマップ変更
inoremap jjj <ESC>

" tab関連
set tabstop=4
set autoindent
set expandtab
set shiftwidth=4
" .rhtmlと.rbと.ymlでタブ幅を変更
au bufNewFile,BufRead *.rhtml set tabstop=2 shiftwidth=2
au bufNewFile,BufRead *.rb set tabstop=2 shiftwidth=2
au bufNewFile,BufRead *.yaml set tabstop=2 shiftwidth=2
au bufNewFile,BufRead *.html set tabstop=4 shiftwidth=4



" NeoBundleの設定
set nocompatible               " be iMproved
filetype off

if has('vim_starting')
  set runtimepath+=~/.vim/bundle/neobundle.vim
  call neobundle#rc(expand('~/.vim/bundle/'))
endif

let g:neobundle_default_git_protocol = 'https'
" originalrepos on github
" 使いたいプラグインのリポジトリを羅列
NeoBundle 'Shougo/neobundle.vim'
" NeoBundle 'Shougo/vimproc'
NeoBundle 'Shougo/vimproc', {
      \ 'build' : {
      \     'mac' : 'make -f make_mac.mak',
      \     'unix' : 'make -f make_unix.mak',
      \    },
      \ }
NeoBundle 'VimClojure'
NeoBundle 'Shougo/vimshell'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/neocomplcache'
"NeoBundle 'Shougo/neocomplcache-snippets-complete' "neosnipetへ
NeoBundle 'Shougo/neosnippet'
NeoBundle 'jpalardy/vim-slime'
NeoBundle 'scrooloose/syntastic'
NeoBundle 'mattn/zencoding-vim'
"NeoBundle 'https://bitbucket.org/kovisoft/slimv'
NeoBundle 'vim-ruby/vim-ruby'    "ruby用
NeoBundle 'tpope/vim-surround'    "surround用
NeoBundle 'tpope/vim-rails'    "rails.vim
NeoBundle 'synboo/project.vim'    "project.vim
NeoBundle 'vim-scripts/matchit.zip'    "対応する括弧
NeoBundle 'vim-scripts/snippetsEmu'    "すにペッと
NeoBundle 'Shougo/vimfiler'            "filer
NeoBundle 'Shougo/neocomplcache-rsense'    "omni補完
NeoBundle 'vim-scripts/yanktmp.vim'        "ヤンクデータ受け渡し
NeoBundle 'vim-scripts/dbext.vim'          "SQL文を叩いて結果を見れる
NeoBundle 'vim-scripts/The-NERD-tree'
NeoBundle 'tpope/vim-endwise'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'vim-scripts/TwitVim' "twitter client

filetype plugin indent on     " required!
filetype indent on
syntax on

" yanktmpの設定
" vim to vim でコピペ出きるようになる。
map <silent> sy :call YanktmpYank()<CR>
map <silent> sp :call YanktmpPaste_p()<CR>
map <silent> sP :call YanktmpPaste_P()<CR>
if has("win32")
    let g:yanktmp_file = TEMP. '/vimyanktmp'
end

" neocomplcacheを有効化
let g:neocomplcache_enable_at_startup = 1


