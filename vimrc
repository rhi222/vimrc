if has('vim_starting')
	if &compatible
set nocompatible               " Be iMproved
endif

set runtimepath+=~/.vim/bundle/neobundle.vim/
endif
		 
call neobundle#begin(expand('~/.vim/bundle/'))
NeoBundleFetch 'Shougo/neobundle.vim'
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'ctrlpvim/ctrlp.vim'
NeoBundle 'jiangmiao/auto-pairs'
NeoBundle 'junegunn/vim-easy-align'
NeoBundle 'Yggdroot/indentLine'


set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
set statusline=%<%f\ %m%r%h%w
set statusline+=%{'['.(&fenc!=''?&fenc:&enc).']['.&fileformat.']'}
set statusline+=%=%l/%L,%c%V%8P

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 1

filetype plugin indent on
set fileencodings=iso-2022-jp,cp932,sjis,euc-jp,utf-8
set encoding=utf-8

set laststatus=2
set hlsearch
set number
set incsearch
let g:indentLine_char = '|'
set list listchars=trail:~,tab:\|\ 
set cursorline
call neobundle#end()
