#                       _____      __         _   _                                                              
#                      (_   _)     \ \       | \ | |
#                        | |/  \/ /  > \ / __)     |
#                        | ( ()  <  / ^ \> _)| |\  |
#                        |_|\__/\_\/_/ \_\___)_| \_|
#  .bashrc                                                            2017/4/27
#===============================================================================
# =>home
  HOME_BASHRC=~/.vim/bashrc
  HOME_TMUXRC=~/.vim/tmux.conf
  FILE_YCM_INSTALL_PY=~/.vim/plugins/YouCompleteMe/install.py
  . ~/.vim/z.sh
  alias vimbashrc='vim $HOME_BASHRC && source $HOME_BASHRC'
  alias vimtmuxrc='vim $HOME_TMUXRC && echo "Tip: leader +r to reload tmux.conf"'
  alias ycminstall='python3 $FILE_YCM_INSTALL_PY'
# alias ycminstallcpp='python3 $FILE_YCM_INSTALL_PY --clang-completer --system-libclang'

# =>added  Miniconda3 or python
# export PATH="/xxxxx/miniconda3/bin:$PATH"
# export PYTHONPATH=/xxxx/xxx:$PYTHONPATH 

# =>ps1
# export PS1="\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$  "
# export PS1="\[\033[01;34m\]\w\[\033[00m\]\$ "
# export PS1="\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\W\[\033[00m\]\$ "
# export PS1="\[\e]0;\u@\h: \w\a\]${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$"

# =>ps kill -9 xx if system is busy
psmac10() {
    local lines=10  # 默认显示前10条
	(ps aux | head -n 1; ps aux | sort -k6nr | head -n $((lines + 1))) | awk '{
        cmd = $11
        for (i=12; i<=NF; i++) cmd = cmd " " $i
        if (match(cmd, /\.app/)) {
            cmd = substr(cmd, 1, RSTART+3)  # 截取到.app路径
        }
        printf "%-8s %-6s %-5s %-5s %-10s %-10s %-3s %-8s %-10s %-10s %s\n", 
            $1, $2, $3, $4, $5, $6, $7, $8, $9, $10, cmd
    }'
}
  alias ps10='ps aux --sort=-rss --width 30 |head -10'
  if [ `uname -s` = "Darwin" ];then
    alias ps10='psmac10'
  fi

# =>tmux
  if [ `uname -s` != "Darwin" ];then
    export TERM="xterm-256color"
	  export PS1="\[\e]0;\$(date +'%Y-%m-%d %H:%M')   \w\a\]${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\[\033[00m\]\[\033[01;34m\]\w\[\033[00m\]\$"
  fi
  alias ta='tmux att'
  alias ths='tmux split-window -h'
  alias tvs='tmux split-window -v'

# =>vimrc
  export TALEN_VIMRC=~/.vim/vimrc
  export VIMINIT="let &rtp='~/.vim,' . &rtp
  so $TALEN_VIMRC"

  alias novim="mv $TALEN_VIMRC $TALEN_VIMRC.bak"
  alias usevim="mv $TALEN_VIMRC.bak $TALEN_VIMRC"


  alias pi='pip install -i https://pypi.tuna.tsinghua.edu.cn/simple'
  alias pi3='pip3 install -i https://pypi.tuna.tsinghua.edu.cn/simple'
# alias gpuwatch='watch -n 1 nvidia-smi'
  alias gpuwatch='nvidia-smi -l'

# =>gits
  alias gitm='git commit -m'
  alias gits='git status -s'
  alias gitpull='git pull'
  alias gitpush='git push'
  alias gitweb='git instaweb --httpd=webrick --port $GIT_WEB_PORT'
  alias gitwebstop='git instaweb --httpd=webrick --stop'

# github use git commit --amend
# https://docs.github.com/zh/pull-requests/committing-changes-to-your-project/creating-and-editing-commits/changing-a-commit-message
  alias gitpush_amend='git push --force-with-lease origin master'

# =>svn get part folder of github project
  alias svngit='f(){ svn checkout `echo $1 | sed "s/tree\/master/trunk/g"` ; unset -f f; }; f'
# svngit https://github.com/talengu/vim/tree/master/colors

 
# gitinit name 通过ssh 管理git
  dot_git_root=~/git/
  alias gitinit='f(){ git init --bare $dot_git_root"$1".git; unset -f f; }; f'
# alias githri='f(){ git clone ssh://name@192.168.1.100:8100/data/name/git/"$1".git; unset -f f; }; f'
# alias gitremotehri='f(){ git remote add origin ssh://name@192.168.1.100:8100/~/git/"$1".git; unset -f f; }; f'
    
  

# =>files
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

# =>find
  alias todomd='find ./ -name "*.md" -print0 | xargs -0 grep TODO > /tmp/find_tmp_log.log && vim /tmp/find_tmp_log.log'
  alias countlines='f(){ find . -name "*.$1" -print0 | xargs -0 cat|grep -v ^$|wc -l; unset -f f; }; f'
  alias findmd='f(){ find ./ -name "*.md" -print0 | xargs -0 grep "$1" > /tmp/find_tmp_log.txt && vim /tmp/find_tmp_log.txt; unset -f f; }; f'
  alias findfile='f(){ find ./ -name "*.$1" -type f -print0 | xargs -0 grep "$2" > /tmp/find_tmp_log.txt && vim /tmp/find_tmp_log.txt; unset -f f; }; f'

# man
viman() {
    vim -c "Man $1 $2" -c 'silent only'
}

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


# guake
  alias gr='guake -r'
  alias gsl='guake --split-vertical' 
  alias gs-='guake --split-horizontal' 
  alias gn='guake -n NEW_TAB'
  alias gp='guake -p'

# tools python 脚本
  HOME_TOOLS_PY=~/.vim/tools_py
  alias vimup="vim $HOME_TOOLS_PY/up.py"
  alias vimgvim="vim $HOME_TOOLS_PY/gvim.py"
  alias vimgitcommit="vim $HOME_TOOLS_PY/gitcommit.py"

  alias cpup='cp $HOME_TOOLS_PY/up.py ./up.py && chmod +x ./up.py && echo "copy up.py success!"&& ll ./up.py'
  alias gfind='f(){ python3 $HOME_TOOLS_PY/gvim.py -g ./ -n "$1"; unset -f f;  }; f'
  alias gvim='f(){ python3 $HOME_TOOLS_PY/gvim.py -m vim -vn "$1"; unset -f f;  }; f'
  alias gitcommit='f(){ python3 $HOME_TOOLS_PY/gitcommit.py -c "$1"; unset -f f;  }; f'


# apt install xclip
  alias gitsname='gits |python $HOME_TOOLS_PY/gitsname.py'
  alias path_site_package='python3 -c "from distutils.sysconfig import get_python_lib; print(get_python_lib())"'
  alias gitsnamec='gits && gits |python3 $HOME_TOOLS_PY/gitsname.py | xclip -selection clipboard'
  alias gclip='xclip -selection c -o' #当前剪切板

# rdesktop
## alias rtwo='cd ~/Desktop && rdesktop 10.10.10.10 -r disk:share_name=./'

# recordmydesktop
## alias ffgif='f(){ file="${1%.ogv}"; ffmpeg -i "${file}.ogv" -f gif "${file}.gif"; unset -f f; }; f'
  alias ffgif='f(){ file="${1%.webm}"; ffmpeg -i "${file}.webm" -f gif "${file}.gif"; unset -f f; }; f'

# git_pull.sh
# alias gitpullall='./git_pull.sh >gitpullall.log 2>&1'
## list all git folders
# for dir in *; do
#  echo "## $dir"
#  if [ -d "$dir" ] && [ -d "$dir/.git" ]; then
#   echo "Pulling from $dir..."
#   cd $dir
#   git pull -r
#   cd ../
#  fi
#  echo " "
# done

# git rebase 处理git冲突的方法
## 1. gerrit 页面选择checkout命令
## git fetch origin
## git rebase origin/master

## 2. 解决冲突 
## git status -a可能存在冲突 

## 3. 合入提交
## git add .
## git rebase --continue
## git push origin HEAD:refs/drafts/master


# debian禁止自动挂起
# ref:https://wiki.debian.org/Suspend
# sudo systemctl mask sleep.target suspend.target hibernate.target hybrid-sleep.target
# 恢复
# sudo systemctl unmask sleep.target suspend.target hibernate.target hybrid-sleep.target

# OS judge
# sysOS=`uname -s`
# if [ $sysOS == "Darwin" ];then
# 	echo "I'm MacOS"
# elif [ $sysOS == "Linux" ];then
# 	echo "I'm Linux"
# else
# 	echo "Other OS: $sysOS"
# fi

# proxy 临时代理
# alias proxy='export http_proxy=127.0.0.1:1080;export https_proxy=$http_proxy'
# alias unproxy='unset http_proxy;unset https_proxy'


# rsync 通过ssh同步
# RS_PORT=22
# RS_IP=192.168.1.100
# RS_UNAME=ubuntu
# alias putone='f(){ rsync -Pauz -e "ssh -p $RS_PORT" "$1" $RS_UNAME@$RS_IP:~/"$1"; unset -f f; }; f'
# alias getone='f(){ rsync -Pauz -e "ssh -p $RS_PORT" $RS_UNAME@$RS_IP:~/"$1" "$1"; unset -f f; }; f'


# youtube-dl
#  alias youtube-dl='youtube-dl --proxy socks5://127.0.0.1:1080'
#  alias youtube-mp3='youtube-dl -x --audio-format mp3 '
