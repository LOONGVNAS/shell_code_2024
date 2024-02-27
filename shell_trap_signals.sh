#!/bin/bash
#Testing signal trapping
# trap commands signals(多个信号之间以空格分隔)
trap "echo ' Sorry! I have trapped Ctrl-C'" SIGINT
#
echo This is a test script.
#
count=1
while [ $count -le 5 ]
do
     echo "Loop #$count"
     sleep 1
     count=$[ $count + 1 ]
done
#
echo "This is the end of test script."
exit
$


[loongson@localhost ~]$ cat test.sh
#!/bin/bash

#Remove  a set trap
#
trap "echo ' Sorry...Ctrl-C is trapped.'" SIGINT
#
count=1
while [ $count -le 3 ]
do
     echo "Loop #$count"
     sleep 1
     count=$[ $count + 1 ]
done
#
#trap - SIGINT  移除对信号的捕获，使用默认的操作终止脚本运行，按Ctrl-c脚本直接退出 
# 移除信号捕获后，脚本会按照默认行为处理 SIGINT 信号，也就是终止脚本运行。
# 忽略对SIGINT 函数的处理，此时按Ctrl-c 终端不会有任何反应
trap "" SIGINT 
echo "The trap is now removed."
#
count=1
while [ $count -le 3 ]
do
     echo "Loop #$count"
     sleep 1
     count=$[ $count + 1 ]
done
# 忽略捕获的效果
[loongson@localhost ~]$ ./test.sh
Loop #1
Loop #2
 Sorry...Ctrl-C is trapped.
Loop #3
The trap is now removed.
Loop #1
Loop #2
Loop #3

