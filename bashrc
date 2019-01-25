# home
  HOME_BASHRC=~/.vim/bashrc
  alias vimbashrc='vim $HOME_BASHRC && source $HOME_BASHRC'

# vimrc
  export TALEN_VIMRC=~/.vim/vimrc
  export VIMINIT="let &rtp='~/.vim,' . &rtp
  so $TALEN_VIMRC"

  alias pi='pip install -i https://pypi.tuna.tsinghua.edu.cn/simple'
  alias pi3='pip3 install -i https://pypi.tuna.tsinghua.edu.cn/simple'
  alias gpuwatch='watch -n 1 nvidia-smi'

# autojump
. /usr/share/autojump/autojump.sh

# gits
  alias gitm='git commit -m'
  alias gits='git status -s'

## svngit https://github.com/talengu/vim/tree/master/colors
## svn get part folder of github project
  alias svngit='f(){ svn checkout `echo $1 | sed "s/tree\/master/trunk/g"` ; unset -f f; }; f'
 
## gitinit name
  dot_git_root=~/git/
  alias gitinit='f(){ git init --bare $dot_git_root"$1".git; unset -f f; }; f'

# files
  alias countfiles='echo "total num: " && ls | wc -l && du -sh'
  alias ll='ls -htrlF --time-style="+%H:%M %Y/%m/%d"'
  alias dum='du -a -d 1 -m |sort -nr'
  alias dug='df -h && du -BG -d 1 --time |sort -nr'


# man
  alias man='~/.vim/viman'

# pandoc `tohtml file.md` to html and so on 
  alias tohtml='f(){ pandoc --standalone --self-contained --css ~/.vim/pandoc_css/pandoc.css "$1" --output "$1".html; unset -f f; }; f'
  alias todomd='find ./ -name "*.md"| xargs grep TODO'

# docker
  alias decho='echo ------------------------------------------------------------------------------------------------------------------------------------------------'
  alias dll='clear && decho && docker images && decho && docker ps -s && decho'
  alias dls='clear && decho && docker images && decho && docker ps -sa && decho'
  alias dnet='netstat -tunlp'
  alias drm='docker rm'
  alias dstart='docker start'
  alias dstop='docker stop'
  alias dexe='f(){ docker exec -it "$1" /bin/bash; unset -f f; }; f'

