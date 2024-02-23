!/bin/bash
# redirecting output to different locations 
exec 2>testerror
echo "This is the start of the script"
echo "now redirecting all output to another location" 
exec 1>testout
echo "This output should go to the testout file" 
echo "but this should go to the testerror file" >&2


#exec 命令会启动一个新  shell 并将  STDOUT 文件描述符重定向到指定文件。脚本中送往 STDOUT 的所有输出都会被重定向。
