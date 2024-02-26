#使用 read 命令时要当心。脚本可能会一直苦等着用户输入。
#如果不管是否有数据输入，脚本都必须继续执行，你可以用-t 选项来指定一个计时器。-t 选项会指定 read 命令等待输入的秒数。如果计时器超时，则 read 命令会返回非 0 退出状态码：
#$ cat asknametimed.sh 
#!/bin/bash
# Using the read command with a timer 
#
# 计时器超时 if语句不成立，执行else部分
if read -t 5 -p "Enter your name: " name 
then
     echo "Hello $name, welcome to my script." 
else
     echo
     echo "Sorry, no longer waiting for name." 
fi
exit

#本例中使用了-n 选项和数值 1，告 诉 read 命令在接收到单个字符后退出。只要按下单个字 
#符进行应答，read 命令就会接受输入并将其传给变量，无须按 Enter 键

#!/bin/bash
# Using the read command for one character 
#
read -n 1 -p "Do you want to continue [Y/N]? " answer 
#
case $answer in 
Y | y) echo
       echo "Okay. Continue on...";; 
N | n) echo
       echo "Okay. Goodbye" 
       exit;;
esac
echo "This is the end of the script." 
exit
