#!/bin/bash
# Extract command-line options and parameters
#
echo
while [ -n "$1" ]
do
     case "$1" in
          -a) echo "Found the -a option" ;;
          -b) echo "Found the -b option" ;;
          -c) echo "Found the -c option" ;;
          --) shift  
              break;;
          *) echo "$1 is not an option" ;;
     esac
     shift #在遇到双连字符时，脚本会用 break 命令跳出 while 循环。由于提前结束了循环，因此需要再加入另一个 shift 命令来将双连字符移出位置变量。
done

#
echo
echo "Using the shift method:"
count=1
for param in $@
do
     echo "Parameter #$count: $param"
     count=$[ $count + 1 ]
done
echo
exit


[loongson@localhost ~]$ ./test.sh -a -b -c -d -- test1 test2 test3 test4

Found the -a option
Found the -b option
Found the -c option
-d is not an option

Using the shift method:
Parameter #1: test1
Parameter #2: test2
Parameter #3: test3
Parameter #4: test4

