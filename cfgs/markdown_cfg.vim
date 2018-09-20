" markdown插件
" Plugin 'iamcco/mathjax-support-for-mkdp'
" Plugin 'iamcco/markdown-preview.vim'

" mardown table 的格式化
" Plugin 'dhruvasagar/vim-table-mode'

"-------------------------------------------------------------------------------
" Markdown插件
  if OSX()
  let g:mkdp_path_to_chrome = '/Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome '
  let g:mkdp_auto_start = 0
    " set to 1, the vim will open the preview window once enter the markdown
    " buffer

  let g:mkdp_auto_open = 0
    " set to 1, the vim will auto open preview window when you edit the
    " markdown file

  let g:mkdp_auto_close = 1
    " set to 1, the vim will auto close current preview window when change
    " from markdown buffer to another buffer

  let g:mkdp_refresh_slow = 0
    " set to 1, the vim will just refresh markdown when save the buffer or
    " leave from insert mode, default 0 is auto refresh markdown as you edit or
    " move the cursor

  let g:mkdp_command_for_global = 0
    " set to 1, the MarkdownPreview command can be use for all files,
    " by default it just can be use in markdown file
  endif

"------------------------------------------------------------------------------
" Markdown table
  function! s:isAtStartOfLine(mapping)
    let text_before_cursor = getline('.')[0 : col('.')-1]
    let mapping_pattern = '\V' . escape(a:mapping, '\')
    let comment_pattern = '\V' . escape(substitute(&l:commentstring, '%s.*$', '', ''), '\')
    return (text_before_cursor =~? '^' . ('\v(' . comment_pattern . '\v)?') . '\s*\v' . mapping_pattern . '\v$')
  endfunction

  inoreabbrev <expr> <bar><bar>
          \ <SID>isAtStartOfLine('\|\|') ?
          \ '<c-o>:TableModeEnable<cr><bar><space><bar><left><left>' : '<bar><bar>'
  inoreabbrev <expr> __
          \ <SID>isAtStartOfLine('__') ?
          \ '<c-o>:silent! TableModeDisable<cr>' : '__'
