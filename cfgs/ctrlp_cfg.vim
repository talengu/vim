"-------------------------------------------------------------------------------
" ctrlp settings
" let g:ctrlp_map = '<c-p>'
  let g:ctrlp_map = ',,'
  let g:ctrlp_cmd = 'CtrlP'

  let g:ctrlp_working_path_mode = 'ra'

  set wildignore+=*.so,*.swp,*.zip,bundle,plugins    " MacOSX/Linux */tmp/*
" set wildignore+=*\\tmp\\*,*.swp,*.zip,*.exe  " Windows

" let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
  let g:ctrlp_custom_ignore = {
    \ 'dir':  '\v[\/]\.(git|hg|svn)$',
    \ 'file': '\v\.(jpg|png|jpeg|exe|so|dll)$',
    \ }

" let g:ctrlp_user_command = 'find %s -type f'        " MacOSX/Linux
" let g:ctrlp_user_command = 'dir %s /-n /b /s /a-d'  " Windows
