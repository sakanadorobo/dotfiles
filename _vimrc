scriptencoding utf-8
" Vimの個人用設定ファイル(_vimrc)
"
" Last Change: 06-Nov-2016.
" Maintainer:  HIDEKI Hara
"
" 解説:
" このファイルにはVimの起動時に必ず設定される、編集時の挙動に関する設定が書
" かれています。

"-------------------------------------------------------------------------
" 個人用設定
"-------------------------------------------------------------------------

" タブの画面上での幅
set tabstop=4

" C言語スタイルの自動インデント
set cindent

" シフト移動幅
set shiftwidth=4

" ESCを2回押すことでハイライトを消す
nmap <silent> <Esc><Esc> :nohlsearch<CR>

" 挿入モードに移行したとき、IMEを自動でONにしない
set iminsert=0

" サーチモードはiminsertの設定に倣う
set imsearch=-1

"バックアップファイルを作るディレクトリの指定
set backupdir=~/vimfiles/vimbackup

" スワップファイル作るディレクトリの指定
set directory=~/vimfiles/vimbackup

"-------------------------------------------------------------------------
" NeoBundle設定
"-------------------------------------------------------------------------

" vim起動時のみruntimepathにneobundle.vimを追加
if has('vim_starting')
  set nocompatible
  set runtimepath+=~/vimfiles/bundle/neobundle.vim
endif

" neobundle.vimの初期化
" NeoBundleを更新するための設定
call neobundle#begin(expand('~/vimfiles/bundle'))
NeoBundleFetch 'Shougo/neobundle.vim'

" originalrepos on github
NeoBundle 'Shougo/neobundle.vim'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/vimproc'

" Color Scheme
NeoBundle 'nanotech/jellybeans.vim'
NeoBundle 'w0ng/vim-hybrid'
NeoBundle 'tomasr/molokai'

" 読み込んだプラグインも含め、ファイルタイプの検出、
" ファイルタイプ別プラグイン/インデントを有効化する
filetype plugin indent on

" インストールのチェック
NeoBundleCheck

call neobundle#end()

