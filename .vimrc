"                       _____      __         _   _
"                      (_   _)     \ \       | \ | |
"                        | |/  \/ /  > \ / __)     |
"                        | ( ()  <  / ^ \> _)| |\  |
"                        |_|\__/\_\/_/ \_\___)_| \_|
"  .vimrc                                                talen 2018/3/27
"===============================================================================
" 使用talen的个性化配置
let NICE_VIM_DIR="$HOME/.vim"           " where you vimrc files
let VIMRC_PATH=NICE_VIM_DIR/talen.vimrc

if filereadable(expand(VIMRC_PATH))
   source VIMRC_PATH
endif
