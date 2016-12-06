scriptencoding utf-8
" Vim�̌l�p�ݒ�t�@�C��(_vimrc)
"
" Last Change: 06-Dec-2016.
" Maintainer:  HIDEKI Hara
"
" ���:
" ���̃t�@�C���ɂ�Vim�̋N�����ɕK���ݒ肳���A�ҏW���̋����Ɋւ���ݒ肪��
" ����Ă��܂��B

"-------------------------------------------------------------------------
" �l�p�ݒ�
"-------------------------------------------------------------------------

" �s�ԍ��̕\��
set number

" �^�u�̉�ʏ�ł̕�
set tabstop=4

" C����X�^�C���̎����C���f���g
set cindent

" �V�t�g�ړ���
set shiftwidth=4

" ESC��2�񉟂����ƂŃn�C���C�g������
nmap <silent> <Esc><Esc> :nohlsearch<CR>

" �}�����[�h�Ɉڍs�����Ƃ��AIME��������ON�ɂ��Ȃ�
set iminsert=0

" �T�[�`���[�h��iminsert�̐ݒ�ɕ키
set imsearch=-1

" �t�@�C���ύX�������̃t�@�C�����J����悤�ɂ���
set hidden

" 0�Ŏn�܂鐔�l��8�i���łȂ�16�i���Ƃ��Ĉ���
set nrformats=

" �O��grep�̐ݒ�
if executable('ag')
  set grepprg=ag\ -n\ -iS
endif

" grep�̏I�����Ɏ�����quickfix-window���J��
autocmd QuickFixCmdPost *grep* cwindow

"�o�b�N�A�b�v�t�@�C�������f�B���N�g���̎w��
set backupdir=~/vimfiles/vimbackup

" �X���b�v�t�@�C�����f�B���N�g���̎w��
set directory=~/vimfiles/vimbackup

" �A���h�D�t�@�C�����f�B���N�g���̎w��
set undodir=~/vimfiles/vimbackup

" Vimfiler���f�t�H���g�ɂ���
let g:vimfiler_as_default_explorer = 1

" �t�@�C�����J��
noremap  <silent> <C-X><C-T> :VimFilerCurrentDir -split -simple -winwidth=35 -no-quit<CR>

" �}�����[�h���ɃJ�[�\���s���n�C���C�g����
au BufNewFile,BufRead * set nocursorline
autocmd InsertEnter,InsertLeave * set cursorline!

" ���{����͂����Z�b�g
au BufNewFile,BufRead * set iminsert=0

" �^�u�������Z�b�g
au BufNewFile,BufRead * set tabstop=4 shiftwidth=4

" .rhtml��.rb�Ń^�u����ύX
au BufNewFile,BufRead *.rhtml   set nowrap tabstop=2 shiftwidth=2
au BufNewFile,BufRead *.rb  set nowrap tabstop=2 shiftwidth=2

" ���[�J���p�X���J�����t�@�C���̏ꏊ�ɐݒ肷��
au BufNewFile,BufRead *.* lcd %:h

"-------------------------------------------------------------------------
" NeoBundle�ݒ�
"-------------------------------------------------------------------------

" vim�N�����̂�runtimepath��neobundle.vim��ǉ�
if has('vim_starting')
  set nocompatible
  set runtimepath+=~/vimfiles/bundle/neobundle.vim
endif

" neobundle.vim�̏�����
" NeoBundle���X�V���邽�߂̐ݒ�
call neobundle#begin(expand('~/vimfiles/bundle'))
NeoBundleFetch 'Shougo/neobundle.vim'

" originalrepos on github
NeoBundle 'Shougo/neobundle.vim'
NeoBundle 'Shougo/unite.vim'

" Filer
NeoBundle 'Shougo/VimFiler'
NeoBundle 'Shougo/neomru.vim'

" Color Scheme (dark)
NeoBundle 'nanotech/jellybeans.vim'
NeoBundle 'w0ng/vim-hybrid'
NeoBundle 'tomasr/molokai'

" Color Scheme (light)
NeoBundle 'vim-scripts/Lucius'
NeoBundle 'vim-scripts/summerfruit256.vim'
NeoBundle 'vim-scripts/pyte'

" �w�肵��������()��""�ň͂񂾂肷��v���O�C��
" �R�}���h�̏ڂ��������� :help surround ���`�F�b�N
NeoBundle 'tpope/vim-surround'

" �⊮�@�\����������v���O�C��
NeoBundle 'Shougo/neocomplete.vim'

" QML Syntax hilight
NeoBundleLazy 'peterhoeg/vim-qml', {
\	'autoload' : {
\		'filetypes' : ['qml'],
\	},
\ }

" �ǂݍ��񂾃v���O�C�����܂߁A�t�@�C���^�C�v�̌��o�A
" �t�@�C���^�C�v�ʃv���O�C��/�C���f���g��L��������
filetype plugin indent on

" �C���X�g�[���̃`�F�b�N
NeoBundleCheck

call neobundle#end()

"" unite.vim {{{
" unite.vim�̃v���t�B�b�N�X�L�[��ݒ�
nnoremap [unite] <Nop>
nmap <Leader>f [unite]

" ���̓��[�h�ŊJ�n����
" let g:unite_enable_start_insert=1

" �啶������������ʂ��Ȃ�
let g:unite_enable_ignore_case = 1
let g:unite_enable_smart_case = 1

" unite.vim�̃L�[�}�b�v��ݒ�
nnoremap <silent> [unite]b :<C-u>Unite<Space>buffer<CR>
nnoremap <silent> [unite]f :<C-u>Unite<Space>file<CR>
nnoremap <silent> [unite]m :<C-u>Unite<Space>file_mru<CR>
nnoremap <silent> [unite]a :<C-u>Unite buffer file file_mru bookmark<CR>
nnoremap <silent> [unite]r :<C-u>Unite<Space>register<CR>
nnoremap <silent> [unite]R :<C-u>UniteResume<CR>

" grep����
nnoremap <silent> ,g  :<C-u>Unite grep:. -buffer-name=search-buffer<CR>

" �J�[�\���ʒu�̒P���grep����
nnoremap <silent> ,cg :<C-u>Unite grep:. -buffer-name=search-buffer<CR><C-R><C-W>

" grep�������ʂ̍Čďo
nnoremap <silent> ,r  :<C-u>UniteResume search-buffer<CR>

" unite grep �� ag(The Silver Searcher) ���g��
if executable('ag')
  let g:unite_source_grep_command = 'ag'
  let g:unite_source_grep_default_opts = '--vimgrep'
  let g:unite_source_grep_recursive_opt = ''
endif

"" }}}

"" neocomplete {{{
"
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

"" }}}

