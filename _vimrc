syntax on
set nocompatible
set number

" filetype off
""" pathogen をコメントアウト
" call pathogen#runtime_append_all_bundles()
" call pathogen#helptags()
" set helpfile=$VIMRUNTIME/doc/help.txt

filetype indent on

""" Vundle '''
set rtp+=~/dotfiles/vimfiles/vundle.git/ 
call vundle#rc()
filetype plugin on
Bundle 'gmarik/vundle'
 
" 利用中のプラグインをBundle
 Bundle 'Shougo/neocomplcache'
 Bundle 'Shougo/unite.vim'
" Bundle 'scrooloose/nerdcommenter'
" Bundle 'tpope/vim-surround'
 Bundle 'thinca/vim-quickrun'
 Bundle 'thinca/vim-ref'
" Bundle 'kana/vim-fakeclip'
Bundle 'vim-ruby/vim-ruby'
Bundle 'rails.vim'
" Bundle 'motemen/git-vim'
" Bundle 'git-commit'
Bundle 'TwitVim'
Bundle 'derekwyatt/vim-scala'
Bundle 'surround.vim'
Bundle 'neocomplcache'
Bundle 'h1mesuke/vim-alignta'

"インデントはスマートインデント
set smartindent
"検索文字列が小文字の場合は大文字小文字を区別なく検索する
set ignorecase
"検索文字列に大文字が含まれている場合は区別して検索する
set smartcase
"検索時に最後まで行ったら最初に戻る
set wrapscan
"検索文字列入力時に順次対象文字列にヒットさせない
set noincsearch
"タブの左側にカーソル表示
"set listchars=tab:\\ 
set nolist
"入力中のコマンドをステータスに表示する
set showcmd
"括弧入力時の対応する括弧を表示
set showmatch
"検索結果文字列のハイライトを有効にしない
"set nohlsearch
"ステータスラインを常に表示
set laststatus=2

" タブの画面上での幅
set tabstop=2
" インデントの設定をファイルタイプ別に行う
"   (shiftwidth=スマートインデントの幅)
"   (tabstop=タブの画面上での幅)
"   (softtabstop=??? デフォルトは tabstop と同じらしい)
augroup vimrc
autocmd! FileType perl setlocal shiftwidth=4 tabstop=2 softtabstop=2
autocmd! FileType html setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd! FileType css  setlocal shiftwidth=4 tabstop=2 softtabstop=2
autocmd! FileType scss  setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd! FileType ruby  setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd! FileType eruby  setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd! FileType javascript  setlocal shiftwidth=2 tabstop=2 softtabstop=2
augroup END
"
" タブをスペースに展開しない (expandtab:展開する)
set expandtab
" 自動的にインデントする (noautoindent:インデントしない)
set autoindent
" バックスペースでインデントや改行を削除できるようにする
set backspace=indent,eol,start
" 検索時にファイルの最後まで行ったら最初に戻る (nowrapscan:戻らない)
set wrapscan
" 括弧入力時に対応する括弧を表示 (noshowmatch:表示しない)
set showmatch
" コマンドライン補完するときに強化されたものを使う(参照 :help wildmenu)
set wildmenu
" テキスト挿入中の自動折り返しを日本語に対応させる
set formatoptions+=mM

"コメント行から改行すると「#」が自動挿入されるのを無効化
set formatoptions-=r
set formatoptions-=o

"foldmethod
set foldmethod=syntax
let perl_fold=1
set foldlevel=100 "Don't autofold anything



"ステータスラインに文字コードと改行文字を表示する
function! GetB()
  let c = matchstr(getline('.'), '.', col('.') - 1)
  let c = iconv(c, &enc, &fenc)
  return String2Hex(c)
endfunction
" :help eval-examples
" The function Nr2Hex() returns the Hex string of a number.
func! Nr2Hex(nr)
  let n = a:nr
  let r = ""
  while n
    let r = '0123456789ABCDEF'[n % 16] . r
    let n = n / 16
  endwhile
  return r
endfunc
" The function String2Hex() converts each character in a string to a two
" character Hex string.
func! String2Hex(str)
  let out = ''
  let ix = 0
  while ix < strlen(a:str)
    let out = out . Nr2Hex(char2nr(a:str[ix]))
    let ix = ix + 1
  endwhile
  return out
endfunc

" set statusline=%<[%n]%m%r%h%w%{'['.(&fenc!=''?&fenc:&enc).':'.&ff.']['.&ft.']'}\ %F%=%l,%c%V%8P
if winwidth(0) >= 120
  set statusline=%<[%n]%m%r%h%w%{'['.(&fenc!=''?&fenc:&enc).':'.&ff.']'}%y\ %F%=[%{GetB()}]\ %l,%c%V%8P
else
  set statusline=%<[%n]%m%r%h%w%{'['.(&fenc!=''?&fenc:&enc).':'.&ff.']'}%y\ %f%=[%{GetB()}]\ %l,%c%V%8P
endif

"set statusline=%{GetB()}
