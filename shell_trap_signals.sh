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



[loongson@localhost ~]$ sh test.sh
This is a test script.
Loop #1
Loop #2
 Sorry! I have trapped Ctrl-C
Loop #3
Loop #4
 Sorry! I have trapped Ctrl-C
Loop #5
 Sorry! I have trapped Ctrl-C
This is the end of test script.
