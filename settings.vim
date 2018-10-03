"-------------------------------------------------------------------------------
" key map

  let mapleader=";"                    " kep map <Leader>
  map <leader>t :Tagbar<CR>
  map <leader>n :NERDTreeToggle<CR>
  map <leader>w <c-w><c-w><CR>
  map <leader>q :q<CR>
  map <leader>s :e ~/.vim/settings.vim<CR>
  map <leader>f *<CR>
  nnoremap <leader>b :YcmCompleter GoToDeclaration<CR>

" Smart way to move between windows
" map <C-j> <C-W>j
" map <C-k> <C-W>k
  map <C-j> <C-W>h
  map <C-k> <C-W>l

"-------------------------------------------------------------------------------
" 文件目录和文件查找

  Plugin 'itchyny/lightline.vim'
" Plugin 'Lokaltog/vim-powerline'
  Plugin 'scrooloose/nerdtree'
  Plugin 'majutsushi/tagbar'
  Plugin 'tpope/vim-fugitive'
  Plugin 'Xuyuanp/nerdtree-git-plugin'

  Plugin 'kien/ctrlp.vim'

" Plugin 'vim-scripts/winmanager'

"-------------------------------------------------------------------------------
" YouCompleteMe

  Plugin 'Valloric/YouCompleteMe'

" Track the engine.
  Plugin 'SirVer/ultisnips'

" Snippets are separated from the engine. Add this if you want them:
  Plugin 'honza/vim-snippets'

" 缩进指示线
  Plugin 'Yggdroot/indentLine'
  Plugin 'tell-k/vim-autopep8'
  Plugin 'jiangmiao/auto-pairs'

" multiple selections for Vim
  Plugin 'terryma/vim-multiple-cursors'

" Plugin 'Yggdroot/vim-mark'

" 自动运行插件
" http://liuchengxu.org/posts/use-vim-as-a-python-ide/
  Plugin 'skywind3000/asyncrun.vim'

"-------------------------------------------------------------------------------
" Plugin configs

  source ~/.vim/cfgs/lightline_cfg.vim
  source ~/.vim/cfgs/tagbar_cfg.vim

  source ~/.vim/cfgs/ycm_cfg.vim
  source ~/.vim/cfgs/snips_cfg.vim

  source ~/.vim/cfgs/fugitive_cfg.vim
  source ~/.vim/cfgs/ctrlp_cfg.vim

  source ~/.vim/cfgs/nerdtree_cfg.vim
  source ~/.vim/cfgs/vim-multiple-cursors_cfg.vim

  source ~/.vim/cfgs/indentline_cfg.vim
  source ~/.vim/cfgs/autopep8_cfg.vim

  source ~/.vim/cfgs/asyncrun_cfg.vim

"-------------------------------------------------------------------------------
" vim-help-doc and markdown editor

  Plugin 'yianwillis/vimcdoc'                       " vim-chinese-doc
  Plugin 'vim-utils/vim-man'                        " man pages

" if OSX()
if 0                                               " for faster
  Plugin 'iamcco/mathjax-support-for-mkdp'
  Plugin 'iamcco/markdown-preview.vim'             " markdown插件
  Plugin 'dhruvasagar/vim-table-mode'              " mardown table 的格式化
  source ~/.vim/cfgs/markdown_cfg.vim
endif
