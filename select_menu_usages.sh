#select 命令只需要一个命令就可以创建出菜单，然后获取输入并自动处理。select 命令的格式如下：
#select variable in list 
#do
#    commands 
#done
#list 参数是由空格分隔的菜单项列表，该列表构成了整个菜单。select 命令会将每个列表项显示成一个带编号的菜单项，然后显示一个由 PS3 环境变量定义的特殊提示符，指示用户的选择。

#!/bin/bash
# simple script menu
function diskspace {
   clear
   df -k
}

function whoseon {
   clear
   who
}

function memusage {
   clear
   cat /proc/meminfo
}

PS3="Enter option: "
select option in "Display disk space" "Display logged on users"  \
"Display memory usage" "Exit program"
do
   case $option in
   "Exit program")
         break ;;
   "Display disk space")
         diskspace ;;
   "Display logged on users")
         whoseon ;;
   "Display memory usage")
         memusage ;;
   *)
         clear
         echo "Sorry, wrong selection";;
   esac
done
clear
