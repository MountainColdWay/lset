"Quickly Run Code
"""""""""""""""""""""""""""""""""""""""""""""""
map <C-y> :call CompileRunGcc()<CR>

func! CompileRunGcc()
	exec "w"
	if &filetype == 'c'
		exec '!g++ %'
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
let g:ycm_server_python_interpreter = '/usr/bin/python'
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

function! g:UltiSnips_Complete()
  call UltiSnips#ExpandSnippet()
  if g:ulti_expand_res == 0
    if pumvisible()
      return "\<C-n>"
    else
      call UltiSnips#JumpForwards()
      if g:ulti_jump_forwards_res == 0
        return "\<TAB>"
      endif
    endif
  endif
  return ""
endfunction

function! g:UltiSnips_Reverse()
  call UltiSnips#JumpBackwards()
  if g:ulti_jump_backwards_res == 0
    return "\<C-P>"
  endif

  return ""
endfunction


if !exists("g:UltiSnipsJumpForwardTrigger")
  let g:UltiSnipsJumpForwardTrigger = "<tab>"
endif
if !exists("g:UltiSnipsJumpBackwardTrigger")
  let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
endif

au InsertEnter * exec "inoremap <silent> " . g:UltiSnipsExpandTrigger     . " <C-R>=g:UltiSnips_Complete()<cr>"
au InsertEnter * exec "inoremap <silent> " .     g:UltiSnipsJumpBackwardTrigger . " <C-R>=g:UltiSnips_Reverse()<cr>"
