$ cat myfuncs
# my script functions 
function addem {
   echo $[ $1 + $2 ] 
}
function multem { 
   echo $[ $1 * $2 ] 
}
function divem { 
   if [ $2 -ne 0 ] 
   then
      echo $[ $1 / $2 ] 
   else
      echo -1 
   fi
} 
$


#!/bin/bash
# using functions defined in a library file 
. ./myfuncs 
#
value1=10 
value2=5
result1=$(addem $value1 $value2)
result2=$(multem $value1 $value2)
result3=$(divem $value1 $value2)
20
$
The result of dividing them is: 2 
$

#脚本成功地使用了 myfuncs 库文件中定义的函数。
#使用函数库的关键在于 source 命令。source 命令会在当前 shell 的上下文中执行命令，而不是创建新的 shell 并在其中执行命令。
#可以用 source 命令在脚本中运行库文件。source 命令有个别名，称作点号操作符。要 在 shell 脚本中运行 myfuncs 库文件。
