# -*- coding: utf-8 -*-
"""
python gvim.py -g ./ -n *.c
python gvim.py -g ./ -m vim -vn 1

alias vimgvim='vim ~/gvim.py'
alias gfind='f(){ python ~/gvim.py -g ../../../../ -n "$1"; unset -f f; }; f'
alias gvim='f(){ python ~/gvim.py -m vim -vn "$1"; unset -f f; }; f'
"""

import argparse,os,subprocess

def run(command):
    try:
        output = subprocess.check_output(command, shell=True, universal_newlines=True)
    except subprocess.CalledProcessError as e:
        output = e.output
    return output


parser = argparse.ArgumentParser()
parser.add_argument("-m", "--mode", type=str, default="find", help="mode")
parser.add_argument("-n", "--name", type=str, default="*.c", help="name to find")
parser.add_argument("-g", "--gpath", type=str, default="./", help="global path")
parser.add_argument("-vn", "--vn", type=str, default="1", help="vim $NUM")


args = parser.parse_args()
GVIM_PATH=".gvim/"
GVIM_PATH_LOG=".gvim/log"
GVIM_PATH_HIS=".gvim/his"
if not os.path.exists(GVIM_PATH):
    os.makedirs(GVIM_PATH)

NAME  = args.name
GPATH = args.gpath
MODE = args.mode
def find():
    CMD_GFIND='find %s -iname "%s"'%(GPATH,NAME)
    # print(CMD_GFIND)
    # os.system(CMD_GFIND)
    res=run(CMD_GFIND)
    print("id  file")

    lines=[]
    for idx,line in enumerate(res.splitlines()):
        print("%3d %s"%(idx+1,line))
        lines+=[line+"\n"]

    with open(GVIM_PATH_LOG,mode='w') as f:
        f.writelines(lines)


def vim(num):
    if num ==0:
        num =0
    else:
        num=num-1
    with open(GVIM_PATH_LOG,mode='r') as f:
        lines=f.readlines()
    FILE=lines[num]
    CMD_VIM="vim %s"%FILE
    os.system(CMD_VIM)
    
    try:
        his=[]
        with open(GVIM_PATH_HIS,mode='r+') as f:
            his=f.readlines()
    except:
        pass
    with open(GVIM_PATH_HIS,mode='a+') as f:
        if FILE not in his:
            f.write(FILE)

def show():
    with open(GVIM_PATH_HIS,mode='r') as f:
        lines=f.readlines()

    lines=lines[::-1]#倒序
    for idx,line in enumerate(lines[:5]):#暂时前几个
        print("%3d %s"%(idx+1,line.strip()))
    with open(GVIM_PATH_LOG,mode='w') as f:
        f.writelines(lines)

if MODE == "find":
    find()

NUM= args.vn

if MODE == "vim":
    if NUM=='':
        show()
    else:
        vim(int(NUM))
