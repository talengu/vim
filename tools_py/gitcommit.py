# -*- coding: utf-8 -*-
"""
gitcommit.py
"""

import os
import subprocess
import shutil
import zipfile


import argparse
parser = argparse.ArgumentParser()
parser.add_argument("-c", "--commit", type=str, default="HEAD", help="cmmoit id")


args = parser.parse_args()


g_commit=args.commit

def cmd_run(cmd):
    stream = os.popen(cmd)
    return stream.read()

def get_diff_files(commit_hash):
    cmd = f'git diff --name-only {commit_hash}^ {commit_hash}'
    output = cmd_run(cmd)
    return output.splitlines()

def copy_files_to_dir(file_list, dest_dir):
    for file in file_list:
        if os.path.isfile(file):
            # 获取文件所在的目录结构
            dir_name = os.path.dirname(file)
            # 创建目标目录（如果不存在）
            target_dir = os.path.join(dest_dir, dir_name)
            if not os.path.exists(target_dir):
                os.makedirs(target_dir)
            # 复制文件到目标目录
            shutil.copy2(file, target_dir)


def zip_directory(dir_path, zip_path):
    with zipfile.ZipFile(zip_path, 'w', zipfile.ZIP_DEFLATED) as zipf:
        for root, dirs, files in os.walk(dir_path):
            for file in files:
                file_path = os.path.join(root, file)
                zipf.write(file_path, arcname=os.path.relpath(file_path, dir_path))

def main():
    commit_hash = g_commit
    
    # 获取差异文件列表
    diff_files = get_diff_files(commit_hash)
    print(diff_files)

    # # output folder name

    OUT=f'commit_{commit_hash}'

    # # 创建old和new目录
    old_dir = f'{OUT}/old'
    new_dir = f'{OUT}/new'
    if not os.path.exists(old_dir):
        os.makedirs(old_dir)
    if not os.path.exists(new_dir):
        os.makedirs(new_dir)
    
    # # 切换到旧版本
    cmd = f'git checkout {commit_hash}^'
    print(cmd_run(cmd))
    
    # # 将差异文件复制到old目录
    copy_files_to_dir(diff_files, old_dir)
    
    # # 切换回新版本
    cmd = f'git checkout {commit_hash}'
    print(cmd_run(cmd))
    
    # # 将差异文件复制到new目录
    copy_files_to_dir(diff_files, new_dir)
    
    # # 打包整个commit目录
    zip_directory(f'{OUT}', f'{OUT}.zip')
    
    desktop_path = os.path.join(os.path.expanduser("~"), "Desktop")
   
    shutil.move(f'{OUT}.zip', os.path.join(desktop_path, f'{OUT}.zip'))
    print("commit diff out=> "+os.path.join(desktop_path, f'{OUT}.zip'))
    # # 删除临时目录
    shutil.rmtree(f'{OUT}')

if __name__ == "__main__":
    main()


