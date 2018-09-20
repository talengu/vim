"-------------------------------------------------------------------------------
" Tagbar setting
   let g:tagbar_type_tex = {
            \ 'ctagstype' : 'latex',
            \ 'kinds'     : [
                \ 's:sections',
                \ 'g:graphics:0:0',
                \ 'l:labels',
                \ 'r:refs:1:0',
                \ 'p:pagerefs:1:0'
            \ ],
            \ 'sort'    : 0,
            \ 'deffile' : '~/.vim/cfgs/tagbar_cnf/latex.cnf'
        \ }
	let g:tagbar_type_markdown = {
		\ 'ctagstype' : 'markdown',
		\ 'kinds' : [
			\ 'h:Heading_L1',
			\ 'i:Heading_L2',
			\ 'k:Heading_L3'
		\ ],
		 \ 'deffile' : '~/.vim/cfgs/tagbar_cnf/markdown.cnf'
		 \ }
	let g:tagbar_type_css = {
		\ 'ctagstype' : 'css',
		\ 'kinds' : [
			\ 'c:class',
			\ 'v:variable',
			\ 't:tag',
			\'m:media'
		\ ],
		 \ 'deffile' : '~/.vim/cfgs/tagbar_cnf/css.cnf'
		 \ }
