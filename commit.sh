#!/bin/bash

# 切换到代码所在目录
# cd /path/to/your/directory

# 更新本地代码仓库
git pull

# 获取当前时间并格式化
time=$(date +"%Y-%m-%d %H:%M:%S")

# 设置提交信息，包含时间信息
commit_msg="update on ${time}"

# 添加所有文件到暂存区
git add .

# 提交代码到本地仓库
git commit -m "$commit_msg"

# 推送代码到远程仓库
git push origin master

# 输出提交信息
echo "Successfully committed and pushed changes to the remote repository."
