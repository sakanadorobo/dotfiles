scriptencoding utf-8
" Vim�̌l�p�ݒ�t�@�C��(_vimrc)
"
" Last Change: 06-Nov-2016.
" Maintainer:  HIDEKI Hara
"
" ���:
" ���̃t�@�C���ɂ�Vim�̋N�����ɕK���ݒ肳���A�ҏW���̋����Ɋւ���ݒ肪��
" ����Ă��܂��B

"-------------------------------------------------------------------------
" �l�p�ݒ�
"-------------------------------------------------------------------------

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

" Color Scheme
NeoBundle 'nanotech/jellybeans.vim'
NeoBundle 'w0ng/vim-hybrid'
NeoBundle 'tomasr/molokai'

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

