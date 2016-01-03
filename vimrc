if has('vim_starting')
if &compatible
set nocompatible               " Be iMproved
endif
filetype off

set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

call neobundle#begin(expand('~/.vim/bundle/'))
NeoBundleFetch 'Shougo/neobundle.vim'
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'ctrlpvim/ctrlp.vim'
NeoBundle 'jiangmiao/auto-pairs'
NeoBundle 'altercation/vim-colors-solarized'
NeoBundle 'othree/html5.vim'
NeoBundle 'hail2u/vim-css3-syntax'
NeoBundle 'jelera/vim-javascript-syntax'
NeoBundle 'hokaccha/vim-html5validator'
NeoBundle 'mattn/emmet-vim'
NeoBundle 'Shougo/neocomplete.vim'
call neobundle#end()

" statusline
set laststatus=2
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
set statusline=%<%f\ %m%r%h%w
set statusline+=%{'['.(&fenc!=''?&fenc:&enc).']['.&fileformat.']'}
set statusline+=%=%l/%L,%c%V%8P

" clipboard
set clipboard=unnamed,autoselect

" endoding
"set fileencodings=iso-2022-jp,cp932,sjis,euc-jp,utf-8
set encoding=utf-8

" hilight
set hlsearch

" line number
set number

" incremental search
set incsearch

" draw tab & space
set list listchars=trail:~,tab:\|\ 
set tabstop=4

" cursorline
set cursorline

" colorscheme
syntax enable
set background=dark
let g:solarized_termcolors=256
colorscheme solarized

" pasteした時に階段状にならない設定
set pastetoggle=<C-E>
"------------------------------------
"" neocomplete
"------------------------------------
"" Disable AutoComplPop.
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

"" Plugin key-mappings.
inoremap <expr><C-g>     neocomplete#undo_completion()
inoremap <expr><C-l>     neocomplete#complete_common_string()

" Recommended key-mappings.
"  <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
	return (pumvisible() ? "\<C-y>" : "" ) . "\<CR>"
  " For no inserting <CR> key.
  "return pumvisible() ? "\<C-y>" : "\<CR>"
endfunction

" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"

" Close popup by <Space>.
noremap <expr><Space> pumvisible() ? "\<C-y>" : "\<Space>"

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

"------------------------------------
"" emmet-vim
"------------------------------------
let g:user_emmet_leader_key='<C-y>'
let g:user_emmet_settings = {
    \    'variables': {
    \      'lang': "ja"
    \    },
    \   'indentation': '	'
    \ }


filetype plugin indent on
