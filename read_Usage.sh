#使用 read 命令时要当心。脚本可能会一直苦等着用户输入。
#如果不管是否有数据输入，脚本都必须继续执行，你可以用-t 选项来指定一个计时器。-t 选项会指定 read 命令等待输入的秒数。如果计时器超时，则 read 命令会返回非 0 退出状态码：
#$ cat asknametimed.sh 
#!/bin/bash
# Using the read command with a timer 
#
if read -t 5 -p "Enter your name: " name 
then
     echo "Hello $name, welcome to my script." 
else
     echo
     echo "Sorry, no longer waiting for name." 
fi
exit
