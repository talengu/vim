"-------------------------------------------------------------------------------
" nerdtree settings
" map <C-n> :NERDTreeToggle<CR>
" autocmd vimenter * NERDTree          "打开文件自动打开文件目录
" close when only has Nerdtree view
" autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
