"------------------------------------------------------------------------------
" Quick run via <leader>r
  nnoremap <leader>r :call <SID>compile_and_run()<CR>
" map <leader>r :call <SID>compile_and_run()<CR>


  augroup SPACEVIM_ASYNCRUN
      autocmd!
      " Automatically open the quickfix window
      autocmd User AsyncRunStart call asyncrun#quickfix_toggle(15, 1)
  augroup END

  function! s:compile_and_run()
      exec 'w'
      if &filetype == 'c'
          exec "AsyncRun! gcc % -o %<; time ./%<"
      elseif &filetype == 'cpp'
         "exec "AsyncRun! g++ -std=c++11 % -o bin/%<; time ./bin/%<"
		 exec "AsyncRun! mkdir bin; g++ -std=c++11 % -o bin/%<; ./bin/%<"
      elseif &filetype == 'java'
         exec "AsyncRun! javac %; time java %<"
      elseif &filetype == 'sh'
         exec "AsyncRun! time bash %"
      elseif &filetype == 'python'
         exec "AsyncRun! time python3 %"
      endif
  endfunction
