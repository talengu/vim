# home
  HOME_BASHRC=~/.vim/talen.bashrc
  alias vimbashrc='vim $HOME_BASHRC && source $HOME_BASHRC'

# vimrc
TALEN_VIMRC=~/.vim/talen.vimrc
if [ -f $TALEN_VIMRC ]; then
  export VIMINIT="let &rtp='~/.vim,' . &rtp
  so $TALEN_VIMRC"
fi


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

# pandoc `tohtml file.md` to html and so on 
  alias tohtml='f(){ pandoc --standalone --self-contained --css ~/.vim/pandoc_css/pandoc.css "$1" --output "$1".html; unset -f f; }; f'
  alias todomd='find ./ -name "*.md"| xargs grep TODO'
# svn get part folder of github project
  alias svngit='f(){ svn checkout `echo $1 | sed "s/tree\/master/trunk/g"` ; unset -f f; }; f'

# docker
  alias allusers='awk  -F'\'':'\'' '\''$3>999 {print $3 " " $1 }'\'' /etc/passwd | column -t | grep -v nobody'
  alias dnet='netstat -tunlp'
  alias decho='echo ------------------------------------------------------------------------------------------------------------------------------------------------'
  alias dexe='f(){ docker exec -it "$1" /bin/bash; unset -f f; }; f'
  alias dll='clear && decho && docker images && decho && docker ps -s && decho'
  alias dls='clear && decho && docker images && decho && docker ps -sa && decho'
  alias drm='docker rm'
  alias dstart='docker start'
  alias dstop='docker stop'

