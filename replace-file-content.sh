#!/bin/bash

# 指定目录，可以修改为其他目录
DIR="."

# 指定文件类型
FILE_TYPES=("js" "html" "css" "php" "wxml" "wxss" "json")

# 替换文本
OLD_TEXTS=("旧文本1" "旧文本2" "旧文本3")
NEW_TEXTS=("新文本1" "新文本2" "新文本3")

# 是否备份原始文件
BACKUP_FILES=true

# 是否包含子目录
INCLUDE_SUBDIRS=true

# 是否全词匹配
EXACT_MATCH=false

# 是否不匹配大小写
IGNORE_CASE=false

# 根据参数生成sed选项
SED_OPTIONS=""
if [ "$EXACT_MATCH" = true ]; then
    SED_OPTIONS+="w"
fi
if [ "$IGNORE_CASE" = true ]; then
    SED_OPTIONS+="i"
fi
if [ -n "$SED_OPTIONS" ]; then
    SED_OPTIONS="-e s/${OLD_TEXTS[$i]}/${NEW_TEXTS[$i]}/g$SED_OPTIONS"
else
    SED_OPTIONS="-e s/${OLD_TEXTS[$i]}/${NEW_TEXTS[$i]}/g"
fi

# 查找指定目录下的指定类型文件，并替换其中的多个文本信息
if [ "$INCLUDE_SUBDIRS" = true ]; then
    find "$DIR" -type f -regextype posix-extended -regex ".*\.(${FILE_TYPES[*]})$" -print0 | while IFS= read -r -d '' file; do
        if [ "$BACKUP_FILES" = true ]; then
            cp "$file" "$file.bak"
        fi
        for ((i=0; i<${#OLD_TEXTS[@]}; i++)); do
            sed -i "$SED_OPTIONS" "$file"
        done
    done
else
    find "$DIR" -maxdepth 1 -type f -regextype posix-extended -regex ".*\.(${FILE_TYPES[*]})$" -print0 | while IFS= read -r -d '' file; do
        if [ "$BACKUP_FILES" = true ]; then
            cp "$file" "$file.bak"
        fi
        for ((i=0; i<${#OLD_TEXTS[@]}; i++)); do
            sed -i "$SED_OPTIONS" "$file"
        done
    done
fi
