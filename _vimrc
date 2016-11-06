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

"�o�b�N�A�b�v�t�@�C�������f�B���N�g���̎w��
set backupdir=~/vimfiles/vimbackup

" �X���b�v�t�@�C�����f�B���N�g���̎w��
set directory=~/vimfiles/vimbackup

" �A���h�D�t�@�C�����f�B���N�g���̎w��
set undodir=~/vimfiles/vimbackup

" �J�[�\���s�������\�����Ȃ�
set nocursorline

" �}�����[�h���ɃJ�[�\���s���n�C���C�g����
autocmd InsertEnter,InsertLeave * set cursorline!

" ���{����͂����Z�b�g
au BufNewFile,BufRead * set iminsert=0

" �^�u�������Z�b�g
au BufNewFile,BufRead * set tabstop=4 shiftwidth=4

" .txt�t�@�C���Ŏ����I�ɓ��{�����ON
" au BufNewFile,BufRead *.txt set iminsert=2

" .rhtml��.rb�Ń^�u����ύX
au BufNewFile,BufRead *.rhtml   set nowrap tabstop=2 shiftwidth=2
au BufNewFile,BufRead *.rb  set nowrap tabstop=2 shiftwidth=2

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
NeoBundle 'Shougo/vimproc'

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

