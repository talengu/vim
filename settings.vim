"{-------------------------------key map----------------------------------------
" =>key map
  let mapleader=";"                    " kep map <Leader>
  map <leader>t :Tagbar<CR>
  map <leader>n :NERDTreeToggle<CR>
  map <leader>w <c-w><c-w><CR>
  map <leader>q :q<CR>
  map <leader>s :e ~/.vim/settings.vim<CR>
  map <leader>f *<CR>
  nnoremap <leader>b :YcmCompleter GoToDeclaration<CR>
  nnoremap tr :let a=expand("<cword>")<Bar>exec '!translate ' .a<CR>
  map <leader>p :set paste<CR>  " fix the paste bug

" set listchars=eol:⏎,tab:␉·,trail:␠,nbsp:⎵
" set list
" set listchars=tab:␉·,nbsp:⎵,space:‧

" =>Smart way to move between windows
" map <C-j> <C-W>j
" map <C-k> <C-W>k
  map <C-j> <C-W>h
  map <C-k> <C-W>l

" =>c-u 来控制在insert model下面，使得整个单词大写。
  imap <c-u> <esc>viwUel
" http://learnvimscriptthehardway.onefloweroneworld.com/chapters/05.html
" 高阶的控制方法。

"}

"{-------------------------------plugins----------------------------------------
" 文件目录和文件查找

" =>页面与布局(Group)
  Plug 'itchyny/lightline.vim'
  source ~/.vim/cfgs/lightline_cfg.vim

" Plug 'vim-scripts/winmanager'
" Plug 'Lokaltog/vim-powerline'

  Plug 'scrooloose/nerdtree'
  source ~/.vim/cfgs/nerdtree_cfg.vim

  Plug 'majutsushi/tagbar'
  source ~/.vim/cfgs/tagbar_cfg.vim

" =>fugitive
  Plug 'tpope/vim-fugitive'
  source ~/.vim/cfgs/fugitive_cfg.vim

  Plug 'Xuyuanp/nerdtree-git-plugin'

  Plug 'kien/ctrlp.vim'
  source ~/.vim/cfgs/ctrlp_cfg.vim


" =>YouCompleteMe
" ./install.py --clang-completer
" ./third_party/ycmd/clang_archives/libclang-8.0.0-x86_64-unknown-linux-gnu.tar.bz2
" Plug 'Valloric/YouCompleteMe'
" source ~/.vim/cfgs/ycm_cfg.vim

" =>Track the engine.
" Plug 'SirVer/ultisnips'
" source ~/.vim/cfgs/snips_cfg.vim

" =>Snippets are separated from the engine. Add this if you want them:
  Plug 'honza/vim-snippets'

" =>gtags 自动跳转工具
" https://zhuanlan.zhihu.com/p/36279445/
" Plug 'ludovicchabant/vim-gutentags'
" Plug 'skywind3000/gutentags_plus'
" source ~/.vim/cfgs/gutentags_plus_cfg.vim


" =>缩进指示线(Group)
  Plug 'Yggdroot/indentLine'
  source ~/.vim/cfgs/indentline_cfg.vim
  
  Plug 'tell-k/vim-autopep8'
  source ~/.vim/cfgs/autopep8_cfg.vim
  
  Plug 'jiangmiao/auto-pairs' "有时候会影响copy

" =>multiple selections for Vim
  Plug 'terryma/vim-multiple-cursors'
  source ~/.vim/cfgs/vim-multiple-cursors_cfg.vim

" Plug 'Yggdroot/vim-mark'

" =>自动运行插件
" http://liuchengxu.org/posts/use-vim-as-a-python-ide/
  Plug 'skywind3000/asyncrun.vim'
  source ~/.vim/cfgs/asyncrun_cfg.vim

"}

"{-------------------------------others-----------------------------------
" =>vim-help-doc and markdown editor

  Plug 'yianwillis/vimcdoc'                       " vim-chinese-doc
  Plug 'vim-utils/vim-man'                        " man pages

" if OSX()
" endif
if 0                                               " for faster
  Plug 'iamcco/mathjax-support-for-mkdp'
  Plug 'iamcco/markdown-preview.vim'             " markdown插件
  Plug 'dhruvasagar/vim-table-mode'              " mardown table 的格式化
  source ~/.vim/cfgs/markdown_cfg.vim
endif

"}

" vim: fdm=marker foldmarker={,} 
