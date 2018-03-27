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

"-------------------------------------------------------------------------------
  set nocompatible                  " 去除VI一致性,必须
  filetype off                      " 必须

  set rtp+=~/.vim/bundle/Vundle.vim " 设置包括vundle和初始化相关的runtime path
" call vundle#begin('~/some/path/here')
" 另一种选择, 指定一个vundle安装插件的路径
  call vundle#begin()

"===============================================================================
" 插件本身
  Plugin 'VundleVim/Vundle.vim'
  Plugin 'yianwillis/vimcdoc'
" markdown插件
  Plugin 'iamcco/mathjax-support-for-mkdp'
  Plugin 'iamcco/markdown-preview.vim'

" 文件目录和函数结构
  Plugin 'scrooloose/nerdtree'
  Plugin 'majutsushi/tagbar'

" git plus
  Plugin 'tpope/vim-fugitive'
  Plugin 'Xuyuanp/nerdtree-git-plugin'

  Plugin 'kien/ctrlp.vim'

  "Plugin 'vim-scripts/winmanager'
  Plugin 'Lokaltog/vim-powerline'
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
" dash vim
  Plugin 'rizzatti/dash.vim'
"===============================================================================
" 以下范例用来支持不同格式的插件安装.
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


  call vundle#end()
  filetype plugin indent on    " 必须 加载vim自带和插件相应的语法和文件类型相关脚本
" filetype plugin on          " 或者忽视插件改变缩进

" 简要帮助文档
" :PluginList       - 列出所有已配置的插件
" :PluginInstall    - 安装插件,追加 `!` 用以更新或使用 :PluginUpdate
" :PluginSearch foo - 搜索 foo ; 追加 `!` 清除本地缓存
" :PluginClean      - 清除未使用插件,需要确认; 追加 `!` 自动批准移除未使用插件
"
" 查阅 :h vundle 获取更多细节和wiki以及FAQ
" 下面执行插件的设置工作

"-------------------------------------------------------------------------------
" Markdown插件
  if OSX()
    let g:mkdp_path_to_chrome = '/Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome '
  endif
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
"-------------------------------------------------------------------------------
" nerdtree settings
  map <C-n> :NERDTreeToggle<CR>
" autocmd vimenter * NERDTree          "打开文件自动打开文件目录
" close when only has Nerdtree view
" autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
"-------------------------------------------------------------------------------
" ctrlp settings
 " let g:ctrlp_map = '<c-p>'
 let g:ctrlp_map = ',,'
 
 let g:ctrlp_cmd = 'CtrlP'

  let g:ctrlp_working_path_mode = 'ra'
  set wildignore+=*.so,*.swp,*.zip     " MacOSX/Linux */tmp/*
" set wildignore+=*\\tmp\\*,*.swp,*.zip,*.exe  " Windows

" let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
  let g:ctrlp_custom_ignore = {
    \ 'dir':  '\v[\/]\.(git|hg|svn)$',
    \ 'file': '\v\.(jpg|png|jpeg|exe|so|dll)$',
    \ }
  let g:ctrlp_user_command = 'find %s -type f'        " MacOSX/Linux
" let g:ctrlp_user_command = 'dir %s /-n /b /s /a-d'  " Windows
"-------------------------------------------------------------------------------
" YoucompleteMe自动补全配置
let mapleader=";"
nnoremap <leader>b :YcmCompleter GoToDeclaration<CR>

let g:ycm_global_ycm_extra_conf='~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'
"let g:ycm_confirm_extra_conf=0


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
"-------------------------------------------------------------------------------
" 缩进指示线
let g:indentLine_char='┆'
let g:indentLine_enabled = 0 
"autopep8设置"
let g:autopep8_disable_show_diff=1
"------------------------------------------------------------------------------
" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.

"let g:UltiSnipsExpandTrigger="<tab>"
"let g:UltiSnipsJumpForwardTrigger="<c-b>"
"let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" If you want :UltiSnipsEdit to split your window.
"let g:UltiSnipsEditSplit="vertical"
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
