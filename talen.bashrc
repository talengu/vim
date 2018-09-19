# home
  HOME_BASHRC=~/.vim/talen.bashrc
  alias vimbashrc='vim $HOME_BASHRC && source $HOME_BASHRC'

# vimrc
  export TALEN_VIMRC=~/.vim/talen.vimrc
  export VIMINIT="let &rtp='~/.vim,' . &rtp
  so $TALEN_VIMRC"

  alias pi='pip install -i https://pypi.tuna.tsinghua.edu.cn/simple'
  alias gpuwatch='watch -n 1 nvidia-smi'

# gits
  alias gitm='git commit -m'
  alias gits='git status -s'

# files
  alias countfiles='echo "total num: " && ls | wc -l && du -sh'
  alias ll='ls -htrlF --time-style="+%H:%M %Y/%m/%d"'
  alias dum='du -a -d 1 -m |sort -nr'
  alias dug='df -h /dev/sdb5 && du -BG -d 1 --time |sort -nr'


# man
  alias man='~/.vim/viman'
