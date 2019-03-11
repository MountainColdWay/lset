"Quickly Run Code
"""""""""""""""""""""""""""""""""""""""""""""""
map <C-y> :call CompileRunGcc()<CR>

func! CompileRunGcc()
	exec "w"
	if &filetype == 'c'
		exec '!g++ % -o %<'
		exec '!time ./%<'
	elseif &filetype == 'cpp'
		exec '!g++ % -o %<'
		exec '!time ./%<'
	elseif &filetype == 'python'
		exec '!time python %'
	elseif &filetype == 'sh'
		:!time bash %
	elseif &filetype=='lua'
		exec '!time lua5.3 %'
	elseif &filetype=='ruby'
		exec '!time ruby %'
	endif
endfunc
"""""""""""""""""""""""""""""""""""""""""""""""
:set vb
set number
set whichwrap=b,s,<,>,[,]
:set encoding=utf-8
:filetype indent on
:syntax on
set cursorline 
set spell 

"""""""""""auto remmber the cousr""""""""""
augroup resCur
  autocmd!
  autocmd BufReadPost * call setpos(".", getpos("'\""))
augroup END


execute pathogen#infect()
filetype plugin indent on


"""""""youcompleteme""""""""
""""""""""""""""""""""""""""""""""""""
""YcmLocationOpened auto""
function! s:CustomizeYcmLocationWindow()
  " Move the window to the top of the screen.
  wincmd K
  " Set the window height to 5.
  5wincmd _
  " Switch back to working window.
  wincmd p
endfunction

autocmd User YcmLocationOpened call s:CustomizeYcmLocationWindow()
""""""""""""""""""""""""""
""YcmQuickFixOpened auto""
function! s:CustomizeYcmQuickFixWindow()
  " Move the window to the top of the screen.
  wincmd K
  " Set the window height to 5.
  5wincmd _
endfunction

autocmd User YcmQuickFixOpened call s:CustomizeYcmQuickFixWindow()
""""""""""""""""""""""""""
let g:ycm_server_python_interpreter = '/usr/bin/python2'
let g:ycm_min_num_of_chars_for_completion = 1
let g:ycm_min_num_identifier_candidate_chars = 0
let g:ycm_max_num_candidates = 50
let g:ycm_max_num_identifier_candidates = 10
let g:ycm_auto_trigger = 1
let g:ycm_show_diagnostics_ui = 1
let g:ycm_error_symbol = '>>'
let g:ycm_warning_symbol = '>>'
let g:ycm_enable_diagnostic_signs = 1
let g:ycm_enable_diagnostic_highlighting = 1
let g:ycm_echo_current_diagnostic = 1
let g:ycm_always_populate_location_list = 0
let g:ycm_open_loclist_on_ycm_diags = 1
let g:ycm_complete_in_comments = 1
let g:ycm_complete_in_strings = 1
let g:ycm_collect_identifiers_from_comments_and_strings = 1
let g:ycm_seed_identifiers_with_syntax = 1
let g:ycm_key_list_select_completion = ['<TAB>', '<Down>']
let g:ycm_global_ycm_extra_conf = '~/.vim/.ycm_extra_conf.py'
let g:ycm_semantic_triggers =  { 			
			\ 'c,cpp,python,java,go,erlang,perl': ['re!\w{2}'], 			
			\ 'cs,lua,javascript': ['re!\w{2}'], 	
			\  }
map <C-n> :YcmCompleter GoTo<CR>

""""""airline-vim"""""""""""
let g:airline_section_b= '%{strftime("%c")}'
let g:airline_section_y= 'BN: %{bufnr("%")}'
let g:airline_left_sep = '>>'
let g:airline_right_sep = '<<'
let g:airline_detect_modified=1
let g:airline_theme='base16_google'

""""""NERDTree-vim"""""""""""""
map <C-f> :NERDTreeToggle<CR>
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'

"""""""taglist""""""""""
let Tlist_Compact_Format = 1
let Tlist_GainFocus_On_ToggleOpen = 1
let Tlist_Close_On_Select = 1
nnoremap <C-l> :TlistToggle<CR>

"""""""colorscheme""""""""""
"colorscheme solarized

"""""""keymap""""""""
noremap <C-h> <left>
noremap <C-j> <down>
noremap <C-k> <up>
noremap <C-l> <right>
inoremap <C-h> <left>
inoremap <C-j> <down>
inoremap <C-k> <up>
inoremap <C-l> <right>
