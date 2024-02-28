#!/bin/bash
# using the return command in a function 
function dbl {
   read -p "Enter a value: " value 
   echo "doubling the value"
   return $[ $value * 2 ] 
}
dbl
echo "The new value is $?" 

#当用这种方法从函数中返回值时，一定要小心。为了避免出问题，牢记以下两个技巧。
#  函数执行一结束就立刻读取返回值。
#  退出状态码必须介于 0~255。


#将函数的输出保存到shell变量中，而非通过状态码来获取函数输出结构，可以有效杜绝上面的问题。
function db2 {
   read -p "Enter a value: " value 
   echo $[ $value * 2 ]
}
result=$(db2)
echo "The new value is $result"

Output:
Enter a value: 200
The new value is 400 22
$
$ ./test5b
Enter a value: 1000
The new value is 2000                                                                23 
$
