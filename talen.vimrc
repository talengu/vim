"                       _____      __         _   _
"                      (_   _)     \ \       | \ | |
"                        | |/  \/ /  > \ / __)     |
"                        | ( ()  <  / ^ \> _)| |\  |
"                        |_|\__/\_\/_/ \_\___)_| \_|
"  talen.vimrc                                                talen 2018/3/27
"===============================================================================
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
" 使用bundle管理插件
   if filereadable(expand("$HOME/.vim/bundles.vimrc"))
       source $HOME/.vim/bundles.vimrc
   endif

"-------------------------------------------------------------------------------
" vim自带设置
  set t_Co=256 " 开启256色支持
  colorscheme talen_desert
  set fileencodings=utf-8,gb2312,gb18030,gbk,ucs-bom,cp936,latin1

  set conceallevel=0
 " hi link HelpBar Normal
 " hi link HelpStar Normal

" 定义快捷键的前缀，即<Leader>
  let mapleader=";"
  set nocp                             " 设置与vi不兼容
  set number                           " 设置行号
  syntax on                            " 语法高亮
  set ic                               " 忽略大小写
  set mouse+=a                         " 使用鼠标
  set clipboard+=unnamed
  set autoindent                       " 自动缩进
  set tabstop=4                        " Tab键的宽度
  set softtabstop=4                    " 统一缩进为4
  set shiftwidth=4
" set nobackup                         " 禁止生成临时文件
" set noswapfile

" set paste                            " 会影响youcomplete插件的使用
  set backspace=indent,eol,start       " 保证在insert模式下可以删除
 
  set splitright                       " Puts new vsplit windows to the right of the current
  set splitbelow                       " Puts new split windows to the bottom of the current
  autocmd BufEnter * if bufname("") !~ "^\[A-Za-z0-9\]*://" | lcd %:p:h | endif
                                       " 切换到编辑文档所在目录

  set synmaxcol=200                    " highlight最大的列数为200，200后的代码将没有高亮，
                                       " 防止处理含有特别长的行的时候，拖慢vim
  
  set incsearch                        " 实时搜索
  set hlsearch                         " 高亮搜索结果"

" set virtualedit=onemore              " 最后一下单词后可以编辑

"-------------------------------------------------------------------------------
" 界面调整
" 折叠属性
  set foldenable 
  set foldmethod=syntax                " 设置语法折叠
  set foldcolumn=1                     " 设置折叠区域的宽度
  setlocal foldlevel=2                 " 设置折叠层数为
" set foldclose=all                    " 设置为自动关闭折叠
  hi Folded guibg=NONE guifg=NONE ctermfg=grey ctermbg=NONE
  hi FoldColumn guibg=NONE guifg=NONE ctermfg=4 ctermbg=NONE
  nnoremap <space> @=((foldclosed(line('.')) < 0) ? 'zc' : 'zo')<CR>
                                       " 用空格键来开关折叠
" cursorline属性
  set cursorline
" set cursorcolumn                     " 当前列
  highlight CursorLine   cterm=NONE ctermbg=236 ctermfg=NONE guibg=NONE guifg=NONE
" highlight CursorColumn cterm=NONE ctermbg=238 ctermfg=NONE guibg=NONE guifg=NONE

" cmdline属性
  if has('cmdline_info')
      set ruler                   " Show the ruler
      set rulerformat=%30(%=\:b%n%y%m%r%w\ %l,%c%V\ %P%) " A ruler on steroids
      set showcmd                 " Show partial commands in status line and
                                  " Selected characters/lines in visual mode
  endif
 
  if has('statusline')
      set laststatus=2
      " Broken down into easily includeable segments
      set statusline=%<%f\                     " Filename
      set statusline+=%w%h%m%r                 " Options
      set statusline+=%{fugitive#statusline()} " Git Hotness
      set statusline+=\ [%{&ff}/%Y]            " Filetype
      set statusline+=\ [%{getcwd()}]          " Current dir
      set statusline+=%=%-14.(%l,%c%V%)\ %p%%  " Right aligned file nav info
  endif

" 行号属性
" 插入模式下用绝对行号, 普通模式下用相对
"  set relativenumber               " 第一次初始化成相关行号
"   au FocusLost * :set norelativenumber number
"   au FocusGained * :set relativenumber
"   autocmd InsertEnter * :set norelativenumber number
"   autocmd InsertLeave * :set relativenumber
"   function! NumberToggle()
"       if(&relativenumber == 1)
"           set norelativenumber number
"       else
"           set relativenumber
"       endif
"   endfunc
" nnoremap <C-n> :call NumberToggle()<cr> "改变Number的快捷键

"-------------------------------------------------------------------------------
" map 快捷键
 "map <leader>r :call CompileRunFile()<CR>
  
  map <leader>t :Tagbar<CR>
  map <leader>n :NERDTreeToggle<CR>
  map <leader>w <c-w><c-w><CR>
  map <leader>s :e ~/.vim/bundles.vimrc<CR>
 
"-------------------------------------------------------------------------------
" 自定义函数

" 执行文件
  func! CompileRunFile()
    exec "w"
    
	if &filetype == 'c'
      exec "!g++ % -o %< && %<"
    " exec "!time ./%<"
    elseif &filetype == 'cpp'
      exec "!g++ % -o %<"
      exec "!time ./%<"
    elseif &filetype == 'java'
      exec "!javac %"
      exec "!time java %<"
    elseif &filetype == 'sh'
      :!time bash %
    elseif &filetype == 'python'
    " exec "!time python2.7 %"
    " exec "!python3 %"
    elseif &filetype == 'html'
      exec "!firefox % &"
    elseif &filetype == 'go'
    " exec "!go build %<"
      exec "!time go run %"
    elseif &filetype == 'markdown'
    " exec "!~/.vim/markdown.pl % > %.html &"
    " exec "!firefox %.html &"
      :MarkdownPreview
    endif
  endfunc

" C++的编译和运行
" map <F5> :call CompileRunGpp()<CR>
" func! CompileRunGpp()
"   exec "w"
"   exec "!g++ % -o %<"
"   exec "! ./%<"
" endfunc

" map <F10> :call RunGpp()<cr>
" func! RunGpp()
"   exec "w"
"   exec "! ./%<"
" endfunc

" 按F5运行python"
" map <F5> :call RunPython()<CR>
" function RunPython()
"    let mp = &makeprg
"    let ef = &errorformat
"    let exeFile = expand("%:t")
"    setlocal makeprg=python\ -u
"    set efm=%C\ %.%#,%A\ \ File\ \"%f\"\\,\ line\ %l%.%#,%Z%[%^\ ]%\\@=%m
"    silent make %
"    copen
"    let &makeprg = mp
"    let &errorformat = ef
" endfunction
 
