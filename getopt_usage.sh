#[loongson@localhost ~]$   getopt ab:cd -a -b BValue -cde test1 test2
#getopt：无效选项 -- e
# -a -b BValue -c -d -- test1 test2
#[loongson@localhost ~]$   getopt ab:cde -a -b BValue -cde test1 test2
# -a -b BValue -c -d -e -- test1 test2
#[loongson@localhost ~]$

set 命令有一个选项是双连字符（--），可以将位置变量的值替换成 set 命令所指定的值。
具体做法是将脚本的命令行参数传给 getopt 命令，然后再将 getopt 命令的输出传给set命令，用 getopt 格式化后的命令行参数来替换原始的命令行参数，如下所示：
set -- $(getopt -q ab:cd "$@")


#!/bin/bash
# Extract command-line options and values with getopt
#
set -- $(getopt -q ab:cd "$@")
#
echo
while [ -n "$1" ]
do
     case "$1" in
          -a) echo "Found the -a option" ;;
          -b) param=$2
              echo "Found the -b option with parameter value $param"
              shift;;
          -c) echo "Found the -c option" ;;
          --) shift
              break;;
          *) echo "$1 is not an option" ;;
     esac
     shift
done
#
echo
count=1
for param in $@
do
     echo "Parameter #$count: $param"
     count=$[ $count + 1 ]
done
exit

[loongson@localhost ~]$ sh  extractPARA_getopt.sh  -c -d -b Bvalue -a test1 test2

Found the -c option
-d is not an option
Found the -b option with parameter value 'Bvalue'
Found the -a option

Parameter #1: 'test1'
Parameter #2: 'test2'
[loongson@localhost ~]$ sh  extractPARA_getopt.sh  -c -d -b Bvalue -a "test1 test2" test3

Found the -c option
-d is not an option
Found the -b option with parameter value 'Bvalue'
Found the -a option

Parameter #1: 'test1
Parameter #2: test2'
Parameter #3: 'test3'
[loongson@localhost ~]$ sh  extractPARA_getopt.sh  -c -d -b Bvalue -a "test1" "test2"

Found the -c option
-d is not an option
Found the -b option with parameter value 'Bvalue'
Found the -a option

Parameter #1: 'test1'
Parameter #2: 'test2'



#getopt 命令并不擅长处理带空格和引号的参数值。它会将空格当作参数分隔符，而不是根据双引号将二者当作一个参数。
