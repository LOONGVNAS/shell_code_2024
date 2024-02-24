#!/bin/bash
# process new user accounts 
input="users.csv"
while IFS=',' read -r loginname name 
do
  echo "adding $loginname"
  useradd -c "$name" -m $loginname 
done < "$input"

##
#-c<备注> 　加上备注文字。备注文字会保存在/etc/passwd的备注栏位中
#-c, --comment COMMENT         新账户的 GECOS 字段
#-m, --create-home             创建用户的主目录
