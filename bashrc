# home
  HOME_BASHRC=~/.vim/bashrc
  HOME_TMUXRC=~/.vim/tmux.conf
  FILE_YCM_INSTALL_PY=~/.vim/plugins/YouCompleteMe/install.py
  . ~/.vim/z.sh
  alias vimbashrc='vim $HOME_BASHRC && source $HOME_BASHRC'
  alias vimtmuxrc='vim $HOME_TMUXRC && echo "Tip: leader +r to reload tmux.conf"'
  alias ycminstall='python3 $FILE_YCM_INSTALL_PY'
#  alias ycminstallcpp='python3 $FILE_YCM_INSTALL_PY --clang-completer --system-libclang'

# added  Miniconda3 or python
# export PATH="/xxxxx/miniconda3/bin:$PATH"
# export PYTHONPATH=/xxxx/xxx:$PYTHONPATH 

# ps1
 #export PS1="\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$  "
#export PS1="\[\033[01;34m\]\w\[\033[00m\]\$ "
 #export PS1="\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\W\[\033[00m\]\$ "
#export PS1="\[\e]0;\u@\h: \w\a\]${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$"

# tmux
  if [ `uname -s` != "Darwin" ];then
    export TERM="screen-256color"
	  export PS1="\[\e]0;\$(date +'%Y-%m-%d %H:%M')   \w\a\]${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\[\033[00m\]\[\033[01;34m\]\w\[\033[00m\]\$"
  fi
  alias ta='tmux att'
  alias ths='tmux split-window -h'
  alias tvs='tmux split-window -v'

# vimrc
  export TALEN_VIMRC=~/.vim/vimrc
  export VIMINIT="let &rtp='~/.vim,' . &rtp
  so $TALEN_VIMRC"

  alias novim="mv $TALEN_VIMRC $TALEN_VIMRC.bak"
  alias usevim="mv $TALEN_VIMRC.bak $TALEN_VIMRC"


  alias pi='pip install -i https://pypi.tuna.tsinghua.edu.cn/simple'
  alias pi3='pip3 install -i https://pypi.tuna.tsinghua.edu.cn/simple'
# alias gpuwatch='watch -n 1 nvidia-smi'
  alias gpuwatch='nvidia-smi -l'

# gits
  alias gitm='git commit -m'
  alias gits='git status -s'
  alias gitpull='git pull'
  alias gitpush='git push'
  alias gitweb='git instaweb --httpd=webrick --port $GIT_WEB_PORT'
  alias gitwebstop='git instaweb --httpd=webrick --stop'

# github use git commit --amend
# https://docs.github.com/zh/pull-requests/committing-changes-to-your-project/creating-and-editing-commits/changing-a-commit-message
  alias gitpush_amend='git push --force-with-lease origin master'
  
# apt install xclip
# alias gitsname='gits && gits |python3 ~/.vim/gitsname.py |xclip -selection clipboard'
  alias gitsname='gits |python ~/.vim/gitsname.py'
  





## svngit https://github.com/talengu/vim/tree/master/colors
## svn get part folder of github project
 
## gitinit name
  dot_git_root=~/git/
  alias gitinit='f(){ git init --bare $dot_git_root"$1".git; unset -f f; }; f'

# files
  alias countfiles='echo "total num: " && ls | wc -l && du -sh'
  alias treehtml='tree -L 3 -H ./ -o tree.html'
  alias treehere='tree -L 1 -C --dirsfirst'
  if [ `uname -s` = "Darwin" ];then
     alias ll='ls -ltrh'
     alias dum='du -m -d 1|sort -nr'
     [ -f /usr/local/etc/profile.d/autojump.sh ] && . /usr/local/etc/profile.d/autojump.sh
  else
     alias ll='ls -htrlF --time-style="+%H:%M %Y/%m/%d"'
     alias watchll='watch -n 1 "ls -htrlF --time-style=\"+%H:%M %Y/%m/%d\""'
     alias dum='du -a -d 1 -m |sort -nr'
     # alias dug='df -h && du -BG -d 1 --time |sort -nr'
     alias dug='du -BG -d 1 --time |sort -nr'
     [ -f /usr/share/autojump/autojump.sh ] && . /usr/share/autojump/autojump.sh
  fi

# find
  alias todomd='find ./ -name "*.md" -print0 | xargs -0 grep TODO > /tmp/find_tmp_log.log && vim /tmp/find_tmp_log.log'
  alias countlines='f(){ find . -name "*.$1" -print0 | xargs -0 cat|grep -v ^$|wc -l; unset -f f; }; f'
  alias findmd='f(){ find ./ -name "*.md" -print0 | xargs -0 grep "$1" > /tmp/find_tmp_log.txt && vim /tmp/find_tmp_log.txt; unset -f f; }; f'
  alias findfile='f(){ find ./ -name "*.$1" -type f -print0 | xargs -0 grep "$2" > /tmp/find_tmp_log.txt && vim /tmp/find_tmp_log.txt; unset -f f; }; f'

# man
  alias man='~/.vim/viman'

# pandoc `tohtml file.md` to html and so on 
  alias tohtml='f(){ pandoc --standalone --self-contained --css ~/.vim/pandoc_css/pandoc.css "$1" --output "$1".html; unset -f f; }; f'
# tex tlmgr install xxxx
# nbconvert path /usr/local/lib/python2.7/dist-packages/nbconvert/templates/latex


# docker
  alias decho='echo ------------------------------------------------------------------------------------------------------------------------------------------------'
  alias dll='clear && decho && docker images && decho && docker ps -s && decho'
  alias dls='clear && decho && docker images && decho && docker ps -sa && decho'
  alias dnet='netstat -tunlp'
  alias drm='docker rm'
  alias dstart='docker start'
  alias dstop='docker stop'
  alias dexesh='f(){ docker exec -it "$1" sh; unset -f f; }; f'
  alias dexe='f(){ docker exec -it "$1" bash; unset -f f; }; f'
# docker 
  alias dcp='docker-compose up -d'
  alias dcs='docker-compose stop'
  
# translate to chinese use youdao
translate(){
    word=$1
    [ "x$word" = "x" ] && return 1
    start=0;
    wget -q -O - "http://fanyi.youdao.com/openapi.do?keyfrom=youdao111&key=60638690&type=data&doctype=xml&version=1.1&q=$word" |\
    while read line;do if echo "$line" | grep "<explains>" >/dev/null; then start=1;fi; if test $start -eq 1 && echo "$line" | grep '<!\[CDATA\[' >/dev/null; then echo $line| sed -n 's/^.*CDATA\[\(.*\)\]].*$/\1/gp';fi; if echo $line | grep "</explains" >/dev/null; then break; fi;done
}
# export -f  translate

# git fun
gitfun(){
	author_git_name=$1;git log --author=$author_git_name --format="%ad" --date="format:%H"|awk '{n=$1+0;if(H[n]++>max)max=H[n]}END{for(i=0;i<24;i++){printf"%02d -%5d ",i,H[i];for(n=0;n<H[i]/max*50;n++){printf "*"}print""}}'
		
}

tovim(){ $1 > /tmp/to_vim.txt && vim /tmp/to_vim.txt;}
alias togitdiff='tovim "git diff" git_diff'
alias togitlog='tovim "git log" git_log'

# make alias
alias grun='f(){ gcc -m64 "$1" && ./a.out; unset if f;   }; f'
alias grun32='f(){ gcc -m32 "$1" && ./a.out; unset if f;   }; f'
# alias mk='f(){ make $1> build.log 2>&1; unset -f f;   }; f'
# alias watchlog='watch -n 1 "tail -n 13 build.log"'
alias mk='f(){ make $1> build_$1.log 2>&1; unset -f f;  }; f'
alias watchlog='watch -n 1 "grep -rsn 'error:' *.log;ls -t | head -1 | xargs -n 1 tail -n 13"'

#os judge
# sysOS=`uname -s`
# if [ $sysOS == "Darwin" ];then
# 	echo "I'm MacOS"
# elif [ $sysOS == "Linux" ];then
# 	echo "I'm Linux"
# else
# 	echo "Other OS: $sysOS"
# fi

