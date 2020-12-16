""-------------------------------------------------------------
"" FZF
""-------------------------------------------------------------
" Commands
command! CtrlP execute (len(system('git rev-parse'))) ? ':Files' : ':GFiles'

" Mappings
nnoremap <silent> <C-P>  :<C-U>CtrlP<CR>
nnoremap <silent> <C-T>  :<C-U>Tags<CR>
nnoremap <silent> <F3>   :<C-U>Ag<CR>
