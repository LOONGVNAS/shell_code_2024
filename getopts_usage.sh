#!/bin/bash
#Extract command-line options and values with getopts
#

# getopts（注意是复数）是 bash shell 的内建命令，和近亲 getopt 看起来很像，但多了一些扩展功能。 
# getopt 与 getopts 的不同之处在于，前者在将命令行中选项和参数处理后只生成一个输出，而后者能够和已有的 shell 位置变量配合默契。
# getopts 每次只处理一个检测到的命令行参数。在处理完所有的参数后，getopts 会退出并返回一个大于 0 的退出状态码。这使其非常适合用在解析命令行参数的循环中。
# getopts 命令的格式如下：
# getopts optstring variable                                                            
# optstring 值与 getopt 命令中使用的值类似。有效的选项字母会在 optstring 中列出，如果选项字母要求有参数值，就在其后加一个冒号。
# 不想显示错误消息的话，可以在 optstring之前加一个冒号。getopts 命令会将当前参数保存在命令行中定义的 variable 中。                       
# getopts 命令要用到两个环境变量。如果选项需要加带参数值，那么 OPTARG 环境变量保

echo
while getopts ab:c opt
do
        case "$opt" in
                a) echo "Found the -a option" ;;
                b) echo "Found the -b option with parameter value $OPTARG";;
                c) echo "Found the -a option" ;;
                *) echo "Unknown option: $opt";;
        esac
done
exit

##[loongson@localhost ~]$ ./extractwithgetopts.sh -ab Bvalue -c
Found the -b option with parameter value Bvalue
Found the -a option
[loongson@localhost ~]$ ./extractwithgetopts.sh -ab Bvalue -c  -d

Found the -a option
Found the -b option with parameter value Bvalue
Found the -a option
Unknown option: ?
[loongson@localhost ~]$ vim extractwithgetopts.sh
[loongson@localhost ~]$ ./extractwithgetopts.sh -ab Bvalue -c  -d

Found the -a option
Found the -b option with parameter value Bvalue
Found the -a option
./extractwithgetopts.sh: 非法选项 -- d
Unknown option: ?


#!/bin/bash
#Extract command-line options and values with getopts
#

echo
while getopts :ab:cd opt
do
        case "$opt" in
                a) echo "Found the -a option"  ;;
                b) echo "Found the -b option with parameter value $OPTARG" ;;
                c) echo "Found the -c option"  ;;
                d) echo "Found the -d option"  ;;
                *) echo "Unknown option: $opt" ;;
        esac
done
#在处理每个想选时，getopts会将OPTIND加1, 处理完选项后，可以使用shift和OPTIND来移动参数
echo  $OPTIND
shift $[ $OPTIND - 1 ]
#
echo
count=1
for param in "$@"
do
     echo "Parameter $count: $param"
     count=$[ $count + 1 ]
done
exit


