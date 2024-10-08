#!/bin/bash
# author:vans
# url:www.loongson.cn

echo "遍历数组... ..."
my_array=(A B "C" D)

for((i=0; i< ${#my_array[@]}; ++i))
do
        echo    ${my_array[i]}
done
echo

echo "关联数组... ..."
#Bash 支持关联数组，可以使用任意的字符串、或者整数作为下标来访问数组元素。
#关联数组使用 declare 命令来声明，语法格式如下：

#declare -A array_name
#-A 选项就是用于声明一个关联数组。

#关联数组的键是唯一的。

#declare -A site=(["google"]="www.google.com" ["runoob"]="www.runoob.com" ["taobao"]="www.taobao.com")
declare -A site
site["google"]="www.google.com"
site["runoob"]="www.runoob.com"
site["taobao"]="www.taobao.com"

echo "数组的键为: ${!site[*]}"
echo "数组的键为: ${!site[@]}"
echo
echo "数组的值为: ${site[*]}"
echo "数组的值为: ${site[@]}"

echo
echo "数组长度... ..."
echo "site数组元素个数为: ${#site[*]}"
echo "my_array数组元素个数为: ${#my_array[@]}"

exit 0
