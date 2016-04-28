if has('vim_starting')
	set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

call neobundle#begin(expand('~/.vim/bundle/'))
NeoBundleFetch 'Shougo/neobundle.vim'
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'ctrlpvim/ctrlp.vim'
"NeoBundle 'jiangmiao/auto-pairs'
"NeoBundle 'junegunn/vim-easy-align'
"NeoBundle 'Shougo/neocomplcache'
NeoBundle 'Yggdroot/indentLine'
NeoBundle 'forcia'
NeoBundle 'mattn/emmet-vim'
NeoBundle 't9md/vim-quickhl'
"NeoBundle 'Shougo/neocomplete.vim'
call neobundle#end()

" setting statusline
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
set statusline=%<%f\ %m%r%h%w
set statusline+=%{'['.(&fenc!=''?&fenc:&enc).']['.&fileformat.']'}
set statusline+=%=%l/%L,%c%V%8P
set laststatus=2

" ignore upper or lower case
set ignorecase

" ビジュアルモードで選択したテキストが、クリップボードに入るようにする
" http://nanasi.jp/articles/howto/editing/clipboard.html
set clipboard=autoselect

" 無名レジスタに入るデータを、*レジスタにも入れる。
"set clipboard+=unnamed
set clipboard=unnamedplus

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 1

" encoding
set fileencodings=iso-2022-jp,cp932,sjis,euc-jp,utf-8
set encoding=utf-8

" etc
set tabstop=4
set hlsearch
set number
set cursorline
set incsearch
let g:indentLine_char = '|'
set list listchars=trail:~,tab:\|\ 
hi SpecialKey guibg=NONE guifg=Gray40

"------------------------------------
""" neocomplete
"------------------------------------
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

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

"------------------------------------
""" emmet-vim
"------------------------------------
let g:user_emmet_leader_key='<C-y>'
let g:user_emmet_settings = {
    \    'variables': {
        \      'lang': "ja"
            \    },
                \   'indentation': '	'
                    \ }


"------------------------------------
""" vim-quickhl
"------------------------------------
nmap <Space>m <Plug>(quickhl-toggle)
xmap <Space>m <Plug>(quickhl-toggle)
nmap <Space>M <Plug>(quickhl-reset)
xmap <Space>M <Plug>(quickhl-reset)
nmap <Space>j <Plug>(quickhl-match)

filetype plugin indent on
