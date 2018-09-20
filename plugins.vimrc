"                       _____      __         _   _
"                      (_   _)     \ \       | \ | |
"                        | |/  \/ /  > \ / __)     |
"                        | ( ()  <  / ^ \> _)| |\  |
"                        |_|\__/\_\/_/ \_\___)_| \_|
"  talen.vundles                                                talen 2018/3/27
"===============================================================================
"
" more: https://github.com/VundleVim/Vundle.vim
"
"-------------------------------------------------------------------------------
" 检测系统
    silent function! OSX()             " 检测mac  if OSX() endif
        return has('macunix')
    endfunction

    silent function! LINUX()           " 检测linux
        return has('unix') && !has('macunix') && !has('win32unix')
    endfunction

    silent function! WINDOWS()         " 检测windows
        return  (has('win16') || has('win32') || has('win64'))
    endfunction

"===============================================================================
" vundle初始化
  set nocompatible                     " 去除VI一致性,必须
  filetype off                         " 必须

" 设置包括vundle和初始化相关的runtime path
  set rtp+=~/.vim/bundle/Vundle.vim

  call vundle#begin()
" 或者指定vundle插件的路径 call vundle#begin('~/some/path/here')

" 插件管理工具
  Plugin 'VundleVim/Vundle.vim'

" vim中文帮助文档
  Plugin 'yianwillis/vimcdoc'

if OSX()
" markdown插件
  Plugin 'iamcco/mathjax-support-for-mkdp'
  Plugin 'iamcco/markdown-preview.vim'
" mardown table 的格式化
  Plugin 'dhruvasagar/vim-table-mode'
endif

" 文件目录和函数结构
  Plugin 'scrooloose/nerdtree'
  Plugin 'majutsushi/tagbar'

" git plus
  Plugin 'tpope/vim-fugitive'
  Plugin 'Xuyuanp/nerdtree-git-plugin'

  Plugin 'kien/ctrlp.vim'

" Plugin 'vim-scripts/winmanager'
"  Plugin 'Lokaltog/vim-powerline'
  Plugin 'itchyny/lightline.vim'
  Plugin 'Valloric/YouCompleteMe'

" Track the engine.
  Plugin 'SirVer/ultisnips'
" Snippets are separated from the engine. Add this if you want them:
  Plugin 'honza/vim-snippets'

" 缩进指示线
  Plugin 'Yggdroot/indentLine'
  Plugin 'tell-k/vim-autopep8'
  Plugin 'jiangmiao/auto-pairs'

" man pages
  Plugin 'vim-utils/vim-man'

" multiple selections for Vim
  Plugin 'terryma/vim-multiple-cursors'
  "Plugin 'Yggdroot/vim-mark'

" 自动运行插件
" http://liuchengxu.org/posts/use-vim-as-a-python-ide/
  Plugin 'skywind3000/asyncrun.vim'


" vundle end
  call vundle#end()

" 必须 加载vim自带和插件相应的语法和文件类型相关脚本
  filetype plugin indent on

" filetype plugin on          " 或者忽视插件改变缩进

"===============================================================================
" vundle 简要帮助文档

" :PluginList       - 列出所有已配置的插件
" :PluginInstall    - 安装插件,追加 `!` 用以更新或使用 :PluginUpdate
" :PluginSearch foo - 搜索 foo ; 追加 `!` 清除本地缓存
" :PluginClean      - 清除未使用插件,需要确认; 追加 `!` 自动批准移除未使用插件

" 配置方式
" Github上的插件
" 格式为 Plugin '用户名/插件仓库名'

" 来自 http://vim-scripts.org/vim/scripts.html 的插件
" Plugin '插件名称' 实际上是 Plugin 'vim-scripts/插件仓库名' 只是此处的用户名可以省略
" Plugin 'L9'

" 由Git支持但不再github上的插件仓库 Plugin 'git clone 后面的地址'
" Plugin 'git://git.wincent.com/command-t.git'

" 本地的Git仓库(例如自己的插件) Plugin 'file:///+本地插件仓库绝对路径'
" Plugin 'file:///home/gmarik/path/to/plugin'

" 插件在仓库的子目录中.
" 正确指定路径用以设置runtimepath. 以下范例插件在sparkup/vim目录下
" Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}

" 安装L9，如果已经安装过这个插件，可利用以下格式避免命名冲突
" Plugin 'ascenator/L9', {'name': 'newL9'}


"===============================================================================
" 插件的配置

 source ~/.vim/cfgs/lightline_cfg.vim
 source ~/.vim/cfgs/tagbar_cfg.vim
 source ~/.vim/cfgs/ycm_cfg.vim
 source ~/.vim/cfgs/snips_cfg.vim
source ~/.vim/cfgs/fugitive_cfg.vim
 source ~/.vim/cfgs/ctrlp_cfg.vim
 source ~/.vim/cfgs/nerdtree_cfg.vim
 if OSX()
    source ~/.vim/cfgs/markdown_cfg.vim
 endif

 source ~/.vim/cfgs/vim-multiple-cursors_cfg.vim

 source ~/.vim/cfgs/asyncrun_cfg.vim
 source ~/.vim/cfgs/indentline_cfg.vim
 source ~/.vim/cfgs/autopep8_cfg.vim
