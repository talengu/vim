# vimrc
This is a vimrc project.  [settings.vim](settings.vim) is for vim and plugins configs. Files  [cfgs/*_cfg](cfgs) are used for config for corresponding plugin.



![screen_ctrp](README.img/screen_ctrp.png)


## Features
Now use [vim-plug](https://github.com/junegunn/vim-plug) Vim plugin manager 2025/01/22

## My plugins

plugins I am using...

| Type   | vim-plug                                 | cfgs                                          |
| ------ | ---------------------------------------- | --------------------------------------------- |
| MANAGER|                                          |                                               |
|        | junegunn/vim-plug                        | [plug.vim](cfgs/plug.vim)                     |
| THEMES |                                          |                                               |
|        | Plug 'itchyny/lightline.vim'             | [cfg](cfgs/lightline_cfg.vim)                 |
|        | Plug 'scrooloose/nerdtree'               | [cfg](cfgs/nerdtree_cfg.vim)                  |
|        | Plug 'Xuyuanp/nerdtree-git-plugin'       |                                               |
|        | Plug 'majutsushi/tagbar'                 | [cfg](cfgs/tagbar_cfg.vim)                    |
|        | Plug 'tpope/vim-fugitive'                | [cfg](cfgs/fugitive_cfg.vim)                  |
|        | Plug 'Plugin 'kien/ctrlp.vim'            | [cfg](cfgs/ctrlp_cfg.vim)                     |
| CODES  |                                          |                                               |
|        | Plug 'Valloric/YouCompleteMe'            | [cfg](cfgs/ycm_cfg.vim)                       |
|        | Plug 'SirVer/ultisnips'                  | [cfg](cfgs/snips_cfg.vim) [snips](cfgs/snips) |
|        | Plug 'honza/vim-snippets'                |                                               |
|        |                                          |                                               |
|        | Plug 'Yggdroot/indentLine'               |                                               |
|        | Plug 'tell-k/vim-autopep8'               | [cfg](cfgs/autopep8_cfg.vim)                  |
|        | Plug 'jiangmiao/auto-pairs'              |                                               |
|        | Plug 'terryma/vim-multiple-cursors'      | [cfg](cfgs/vim-multiple-cursors_cfg.vim)      |
|        | Plug 'ludovicchabant/vim-gutentags'      | [cfg](cfgs/gutentags_plus_cfg.vim)            |
|        | Plug 'skywind3000/gutentags_plus'        |                                               |
| RUNS   |                                          |                                               |
|        | Plug 'skywind3000/asyncrun.vim'          | [cfg](cfgs/asyncrun_cfg.vim)                  |
| HELPS  |                                          |                                               |
|        | Plug 'yianwillis/vimcdoc'                |                                               |
|        | Plug 'vim-utils/vim-man'                 |                                               |
| DOCS   |                                          |                                               |
|        | Plug 'iamcco/mathjax-support-for-mkdp'   | [cfg](cfgs/markdown_cfg.vim)                  |
|        | Plug 'iamcco/markdown-preview.vim'       |                                               |
|        | Plug 'dhruvasagar/vim-table-mode'        |                                               |
|        |                                          |                                               |
|        |                                          |                                               |
|        |                                          |                                               |
|        |                                          |                                               |
|        |                                          |                                               |



## Install 

- Use scripts

  ```
  curl https://raw.githubusercontent.com/talengu/vim/master/install.sh | sh
  ```


- Step by step

  

  

## Key-maps

| key         | thing                                                        |
| ----------- | ------------------------------------------------------------ |
| `<leader>s` | open the [settings.vim](settings.vim) in Vim and you can set key maps, add plugins. |
| `<leader>n` | open the NERDTree on the left                                |
| `<leader>t` | open the NERDTree tagbar on the right                        |
| `<leader>b` | call the YcmCompleter GoToDeclaration funtion                |
| `<leader>w` | jump between windows in a circle                             |
|             |                                                              |



## Theme
[talen_desert.vim](colors/talen_desert.vim) is a color theme based on desert.

my workspace like this...

![screen_theme](README.img/screen_theme.png)



thank you!

[1]: https://github.com/wklken/k-vim	"k-vim ycm tagbar 安装的参考"
[2]: https://github.com/amix/vimrc	"stars most in github"
[3]: https://github.com/humiaozuzu/dot-vimrc	"pictures good"
[4]: https://github.com/chxuan/vimplus  "vimplus"

