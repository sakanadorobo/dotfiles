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

" ファイル変更中も他のファイルを開けるようにする
set hidden

" 外部grepの設定
if executable('ag')
  set grepprg=ag\ -n\ -iS
endif

" grepの終了時に自動でquickfix-windowを開く
autocmd QuickFixCmdPost *grep* cwindow

"バックアップファイルを作るディレクトリの指定
set backupdir=~/vimfiles/vimbackup

" スワップファイル作るディレクトリの指定
set directory=~/vimfiles/vimbackup

" アンドゥファイル作るディレクトリの指定
set undodir=~/vimfiles/vimbackup

" 挿入モード時にカーソル行をハイライトする
au BufNewFile,BufRead * set nocursorline
autocmd InsertEnter,InsertLeave * set cursorline!

" 日本語入力をリセット
au BufNewFile,BufRead * set iminsert=0

" タブ幅をリセット
au BufNewFile,BufRead * set tabstop=4 shiftwidth=4

" .rhtmlと.rbでタブ幅を変更
au BufNewFile,BufRead *.rhtml   set nowrap tabstop=2 shiftwidth=2
au BufNewFile,BufRead *.rb  set nowrap tabstop=2 shiftwidth=2

" ローカルパスを開いたファイルの場所に設定する
au BufNewFile,BufRead *.* lcd %:h

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

" Filer
NeoBundle 'Shougo/VimFiler'
NeoBundle 'Shougo/neomru.vim'

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

"" unite.vim {{{
" unite.vimのプレフィックスキーを設定
nnoremap [unite] <Nop>
nmap <Leader>f [unite]

" 入力モードで開始する
" let g:unite_enable_start_insert=1

" 大文字小文字を区別しない
let g:unite_enable_ignore_case = 1
let g:unite_enable_smart_case = 1

" unite.vimのキーマップを設定
nnoremap <silent> [unite]b :<C-u>Unite<Space>buffer<CR>
nnoremap <silent> [unite]f :<C-u>Unite<Space>file<CR>
nnoremap <silent> [unite]m :<C-u>Unite<Space>file_mru<CR>
nnoremap <silent> [unite]a :<C-u>Unite buffer file file_mru bookmark<CR>
nnoremap <silent> [unite]r :<C-u>Unite<Space>register<CR>
nnoremap <silent> [unite]R :<C-u>UniteResume<CR>

" grep検索
nnoremap <silent> ,g  :<C-u>Unite grep:. -buffer-name=search-buffer<CR>

" カーソル位置の単語をgrep検索
nnoremap <silent> ,cg :<C-u>Unite grep:. -buffer-name=search-buffer<CR><C-R><C-W>

" grep検索結果の再呼出
nnoremap <silent> ,r  :<C-u>UniteResume search-buffer<CR>

" unite grep に ag(The Silver Searcher) を使う
if executable('ag')
  let g:unite_source_grep_command = 'ag'
  let g:unite_source_grep_default_opts = '--vimgrep'
  let g:unite_source_grep_recursive_opt = ''
endif

"" }}}

