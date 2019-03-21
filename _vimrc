scriptencoding utf-8
" Vimの個人用設定ファイル(_vimrc)
"
" Last Change: 22-Mar-2019.
"
" 解説:
" このファイルにはVimの起動時に必ず設定される、編集時の挙動に関する設定が書
" かれています。

"-------------------------------------------------------------------------
" 個人用設定
"-------------------------------------------------------------------------

" 行番号の表示
set number

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

" 0で始まる数値を8進数でなく16進数として扱う
set nrformats=

" 外部grepの設定
if executable('pt')
  set grepprg=pt\ -iS
endif

" grepの終了時に自動でquickfix-windowを開く
autocmd QuickFixCmdPost *grep* cwindow

"バックアップファイルを作るディレクトリの指定
set backupdir=~/vimfiles/vimbackup

" スワップファイル作るディレクトリの指定
set directory=~/vimfiles/vimbackup

" アンドゥファイル作るディレクトリの指定
set undodir=~/vimfiles/vimbackup

" Vimfilerをデフォルトにする
let g:vimfiler_as_default_explorer = 1

" ファイラを開く
noremap  <silent> <C-X><C-T> :VimFilerCurrentDir -split -simple -winwidth=35 -no-quit<CR>

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
" プラグイン設定
"-------------------------------------------------------------------------

let s:dein_dir = expand('~/.vim/dein')
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'

if &compatible
	set nocompatible
endif

if !isdirectory(s:dein_repo_dir)
	execute '!git clone git@github.com:Shougo/dein.vim.git' s:dein_repo_dir
endif

execute 'set runtimepath^=' . s:dein_repo_dir

call dein#begin(s:dein_dir)

" プラグインマネージャー
call dein#add('Shougo/dein.vim')

" 補完機能
call dein#add('Shougo/neocomplete.vim')

" Snippet
call dein#add('Shougo/neosnippet.vim')
call dein#add('Shougo/neosnippet-snippets')

" Filer
call dein#add('Shougo/unite.vim')
call dein#add('Shougo/neomru.vim')
call dein#add('Shougo/VimFiler')

" Color Scheme (dark)
call dein#add('nanotech/jellybeans.vim')
call dein#add('w0ng/vim-hybrid')
call dein#add('tomasr/molokai')

" Color Scheme (light)
call dein#add('vim-scripts/Lucius')
call dein#add('vim-scripts/summerfruit256.vim')
call dein#add('vim-scripts/pyte')

" surround
" 指定した文字を()や""で囲んだりするプラグイン
" コマンドの詳しい説明は :help surround をチェック
call dein#add('tpope/vim-surround')

call dein#end()

if dein#check_install()
	call dein#install()
endif

filetype plugin indent on

"-------------------------------------------------------------------------
" プラグイン毎の設定
"-------------------------------------------------------------------------

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

" unite grep に pt(The Platinum Searcher) を使う
if executable('pt')
  let g:unite_source_grep_command = 'pt'
  let g:unite_source_grep_default_opts = '--nogroup --nocolor --column'
  let g:unite_source_grep_recursive_opt = ''
  let g:unite_source_grep_encoding = 'utf-8'
endif

"" unite.vim }}}

"" neocomplete {{{

" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplete.
let g:neocomplete#enable_at_startup = 1
" Use smartcase.
let g:neocomplete#enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplete#sources#syntax#min_keyword_length = 3
let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'

" Define dictionary.
let g:neocomplete#sources#dictionary#dictionaries = {
    \ 'default' : '',
    \ 'vimshell' : $HOME.'/.vimshell_hist',
    \ 'scheme' : $HOME.'/.gosh_completions'
        \ }

" Define keyword.
if !exists('g:neocomplete#keyword_patterns')
    let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns['default'] = '\h\w*'

" Plugin key-mappings.
inoremap <expr><C-g>     neocomplete#undo_completion()
inoremap <expr><C-l>     neocomplete#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  return (pumvisible() ? "\<C-y>" : "" ) . "\<CR>"
  " For no inserting <CR> key.
  "return pumvisible() ? "\<C-y>" : "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
" Close popup by <Space>.
"inoremap <expr><Space> pumvisible() ? "\<C-y>" : "\<Space>"

" AutoComplPop like behavior.
"let g:neocomplete#enable_auto_select = 1

" Shell like behavior(not recommended).
"set completeopt+=longest
"let g:neocomplete#enable_auto_select = 1
"let g:neocomplete#disable_auto_complete = 1
"inoremap <expr><TAB>  pumvisible() ? "\<Down>" : "\<C-x>\<C-u>"

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" Enable heavy omni completion.
if !exists('g:neocomplete#sources#omni#input_patterns')
  let g:neocomplete#sources#omni#input_patterns = {}
endif
"let g:neocomplete#sources#omni#input_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
"let g:neocomplete#sources#omni#input_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
"let g:neocomplete#sources#omni#input_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'

" For perlomni.vim setting.
" https://github.com/c9s/perlomni.vim
let g:neocomplete#sources#omni#input_patterns.perl = '\h\w*->\h\w*\|\h\w*::'

"" neocomplete }}}

"" neosnippet {{{

" Plugin key-mappings.
" Note: It must be "imap" and "smap".  It uses <Plug> mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

" SuperTab like snippets behavior.
" Note: It must be "imap" and "smap".  It uses <Plug> mappings.
"imap <expr><TAB>
" \ pumvisible() ? "\<C-n>" :
" \ neosnippet#expandable_or_jumpable() ?
" \    "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

" For conceal markers.
if has('conceal')
  set conceallevel=2 concealcursor=niv
endif

"" neosnippet }}}

