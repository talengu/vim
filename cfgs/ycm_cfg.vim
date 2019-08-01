"-------------------------------------------------------------------------------
" YoucompleteMe自动补全配置
" let mapleader=";"
" nnoremap <leader>b :YcmCompleter GoToDeclaration<CR>
  highlight Pmenu ctermfg=2 ctermbg=3 guifg=#ffffff guibg=#0000ff
 " let g:ycm_global_ycm_extra_conf='~/.vim/plugins/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'
 let g:ycm_global_ycm_extra_conf='~/.vim/plugins/YouCompleteMe/third_party/ycmd/.ycm_extra_conf.py'
" let g:ycm_confirm_extra_conf=0

  set completeopt=longest,menu
  let g:ycm_key_list_previous_completion=['<Down>']
  let g:ycm_key_list_previous_completion=['<Up>']
  let g:ycm_collect_identifiers_from_tags_files=1
  let g:ycm_min_num_of_chars_for_completion=2
  let g:ycm_seed_identifiers_with_syntax=1


  let g:ycm_complete_in_comments=1
  let g:ycm_complete_in_strings=1
  let g:ycm_collect_identifiers_from_comments_and_strings=0

" 补全菜单颜色
  hi Pmenu  guifg=#1c1c1c guibg=#F1F1F1 ctermfg=black ctermbg=Lightgray
  hi PmenuSbar  guifg=#8A95A7 guibg=#F8F8F8 gui=NONE ctermfg=darkcyan ctermbg=lightgray cterm=NONE
  hi PmenuThumb  guifg=#F8F8F8 guibg=#8A95A7 gui=NONE ctermfg=lightgray ctermbg=darkcyan cterm=NONE
