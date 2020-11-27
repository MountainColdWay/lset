"""""""""""compile fun""""""""""""
map <C-y> :call CompileAndRun()<CR>
func! CompileAndRun()
	exec "w"
	if &filetype == 'c'
		exec '!gcc %'
		exec '!time ./a.out'
	elseif &filetype == 'cpp'
		exec '!g++ % -o %<'
		exec '!time ./%<'
	elseif &filetype == 'python'
		exec '!time python %'
	elseif &filetype == 'sh'
		:!time bash %
	elseif &filetype=='lua'
		exec '!time lua5.3 %'
	elseif &filetype=='go'
		exec '!time go run %'
	elseif &filetype=='javascript'
		exec '!time node %'
	elseif &filetype=='d'
		exec '!dmd %'
		exec '!time ./%<'
	endif
endfunc

"""""""""""vim setting""""""""""""
set encoding=utf-8
" set bell
set vb
" file type check
filetype indent on
" add omni complete
filetype plugin on
set omnifunc=syntaxcomplete#Complete
" word high light
syntax on
" cursor line
set cursorline
" spell check
set spell
" number
set number
" mouse
set mouse=a
" indent
set smartindent
" auto remember the cursor
augroup resCur
	autocmd!
	autocmd BufReadPost * call setpos(".", getpos("'\""))
augroup END

"""""""""""vim plug manager"""""""
execute pathogen#infect()
filetype plugin indent on

"""""""""""airline-vim""""""""""""
let g:airline_section_b= '%{strftime("%c")}'
let g:airline_section_y= 'BN: %{bufnr("%")}'
let g:airline_left_sep = ''
let g:airline_right_sep = ''
let g:airline_detect_modified=1
let g:airline_theme='base16_google'

"""""""""""NERDTree-vim"""""""""""
map <C-n> :NERDTreeToggle<CR>
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'

"""""""""""vim-rainbow""""""""""""
let g:rainbow_active = 1
let g:rainbow_load_separately = [
			\ [ '*' , [['(', ')'], ['\[', '\]'], ['{', '}']] ],
			\ [ '*.tex' , [['(', ')'], ['\[', '\]']] ],
			\ [ '*.cpp' , [['(', ')'], ['\[', '\]'], ['{', '}']] ],
			\ [ '*.{html,htm}' , [['(', ')'], ['\[', '\]'], ['{', '}'], ['<\a[^>]*>', '</[^>]*>']] ],
			\ ]
let g:rainbow_guifgs = ['RoyalBlue3', 'DarkOrange3', 'DarkOrchid3', 'FireBrick']
let g:rainbow_ctermfgs = ['lightblue', 'lightgreen', 'yellow', 'red', 'magenta']

"""""""""""vim-autoformat"""""""""
nnoremap <C-f> :Autoformat<CR>
let g:autoformat_verbosemode=1
autocmd FileType proto au BufWrite * :Autoformat

"""""""""""ultisnips""""""""""""""
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<s-tab>"
let g:UltiSnipsJumpBackwardTrigger="<c-tab>"
let g:UltiSnipsEditSplit="vertical"

"""""""""""gofmt.vim""""""""""""""
let g:gofmt_exe = 'gofmt'
let g:gofmt_on_save = '1'


"""""""""""tagbar"""""""""""""""""
nnoremap <C-l> :TagbarToggle<CR>
let g:tagbar_position = 'left'
autocmd VimEnter * TagbarToggle

"""""""""""ack.vim""""""""""""""""
if executable('ag')
	let g:ackprg = 'ag --vimgrep'
endif

"""""""""""deoplete.vim"""""""""""
set completeopt+=noselect
set completeopt+=noinsert
let g:deoplete#enable_at_startup = 1
let g:python3_host_prog  = '/bin/python3'
let g:python3_host_skip_check = 1
let g:deoplete#sources#go#gocode_binary = $GOPATH.'/bin/gocode'
let g:deoplete#sources#go#sort_class = ['package', 'func', 'type', 'var', 'const']
call deoplete#custom#option({
			\ 'camel_case': v:true,
			\ })
call deoplete#custom#option('omni_patterns', { 'go': '[^. *\t]\.\w*' })
