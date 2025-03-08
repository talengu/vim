#!/usr/bin/python3
# -*- coding: utf-8 -*-
"""
up.py
"""
import os
import ftplib

# 1. 获取本地文件夹A的git差异文件列表
def get_git_diff_files(folder_path):
    command = f'cd {folder_path} && git diff --name-only HEAD'
    result = os.popen(command).read().strip().split('\n')
    return [file for file in result if file]

# 2. 登录FTP服务器
def login_ftp(host, username, password):
    ftp = ftplib.FTP(host)
    ftp.login(username, password)
    return ftp



# 确保远程目录存在
def ensure_remote_directory_exists(ftp, remote_dir):
    dirs = remote_dir.split('/')
    current_dir = ''
    for part in dirs:
        if part:
            current_dir += '/' + part
            try:
                ftp.cwd(current_dir)
            except ftplib.error_perm:
                print(f'create:{current_dir}')
                ftp.mkd(current_dir)
                ftp.cwd(current_dir)


# 3. 上传并比较文件与服务器上文件夹B的对应文件名的大小，并覆盖
def upload_and_compare(ftp, diff_file, local_dir,remote_dir):
    remote_file = os.path.join(remote_dir, diff_file)
    local_file = os.path.join(local_dir,diff_file)
    
    try:
        # 检查远程文件是否存在
        remote_size = ftp.size(remote_file)
    except ftplib.error_perm:
        remote_size = -1

    local_size = os.path.getsize(local_file)
    if remote_size != local_size or remote_size == -1:
        ensure_remote_directory_exists(ftp,os.path.dirname(remote_file))
        ftp.cwd("/")
        with open(local_file, 'rb') as file:
            ftp.storbinary(f'STOR {remote_file}', file)
        print(f'Uploaded and replaced: {local_size}->{remote_size} {remote_file}')
    else:
        print(f'No need to replace: {remote_file}')


# 主函数
def local2remote(local_folder,remote_folder,sshpass):
    # ftp_host = '10.10.10.10'
    # ftp_user = 'cc'
    # ftp_pass = 'xxxx'
    # sshpass="sshpass -p mimaxx ssh xxx@10.10.10.10"
    infos=sshpass.split(" ")
    ftp_pass=infos[2]
    ftp_user=infos[4].split("@")[0]
    ftp_host=infos[4].split("@")[1]
    
    # 获取差异文件列表
    diff_files = get_git_diff_files(local_folder)
    print(f'\n📅{local_folder}')
    print("GIT DIFFS:")
    for e in [os.path.join(local_folder,x) for x in diff_files]:
        print(e)

    # 登录FTP服务器
    ftp = login_ftp(ftp_host, ftp_user, ftp_pass)

    files = ftp.nlst("/")
    print("\nLOGIN FTP: ",files)

    # 切换到远程目录
    ftp.cwd("/")

    #上传并比较文件
    print(f'\nUPLOADING( {infos[4]} ):\n===>{remote_folder}\n')
    for file in diff_files:
        upload_and_compare(ftp, file, local_folder,remote_folder)

    # 关闭FTP连接
    ftp.quit()
d={
    "cspkernel5.4"       : "xx/kernel5.4",
}



if __name__ == '__main__':
    
    S="sshpass -p xxx ssh someone@10.10.10.10"
    R="project_name"
    l=[
        ['kernel5.4'    , 0],

    ]
    
    _py_path = os.path.abspath(__file__)
    
    for e in l:
        if e[1]:
            local_folder=os.path.join(os.path.dirname(_py_path),e[0])
            remote_folder=os.path.join(R,d[e[0]])
            local2remote(local_folder,remote_folder,S)


