" Track the engine.
" Plugin 'SirVer/ultisnips'
" Snippets are separated from the engine. Add this if you want them:
" Plugin 'honza/vim-snippets'

"------------------------------------------------------------------------------
" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.

" let g:UltiSnipsExpandTrigger="<tab>"
" let g:UltiSnipsJumpForwardTrigger="<c-b>"
" let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" If you want :UltiSnipsEdit to split your window.
" let g:UltiSnipsEditSplit="vertical"
" You can define own snips in cfgs/snips
 let g:UltiSnipsSnippetDirectories=["UltiSnips", "../../cfgs/snips"]
 "

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
