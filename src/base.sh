#!/bin/bash

# 替换文本
OLD_TEXTS=("旧文本1" "旧文本2" "旧文本3")
NEW_TEXTS=("新文本1" "新文本2" "新文本3")

# 查找当前目录及其子目录中所有.js、.html、.css、.php、.wxml、.wxss和.json文件，并替换其中的多个文本信息
for ((i=0; i<${#OLD_TEXTS[@]}; i++))
do
    find . \( -name "*.js" -o -name "*.html" -o -name "*.css" -o -name "*.php" -o -name "*.wxml" -o -name "*.wxss" -o -name "*.json" \) -type f -print0 | xargs -0 sed -i "s/${OLD_TEXTS[$i]}/${NEW_TEXTS[$i]}/g"
done
