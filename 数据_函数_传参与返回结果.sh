#!/bin/bash
# returning an array value
function arraydblr {
   local origarray
   local newarray
   local elements
   local i
   origarray=($(echo "$@"))
   newarray=($(echo "$@"))
   elements=$[ $# - 1 ] #//4
   for (( i = 0; i <= $elements; i++ ))
   {
      newarray[$i]=$[ ${origarray[$i]} * 2 ]
   }


   #return values
   echo ${newarray[*]}
}

myarray=(1 2 3 4 5)
echo "The original array is: ${myarray[*]}"
arg1=$(echo ${myarray[*]})

#函数名 参数列表
result=$(arraydblr $arg1)
echo "The new array is: ${result[*]}"


#该脚本通过$arg1 变量将数组元素作为参数传给 arraydblr 函数。
#arraydblr 函数将传 入的参数重组成新的数组变量，生成该数组变量的副本。
#然后对数据元素进行遍历，将每个元素的值翻倍，并将结果存入函数中的数组变量副本。
#arraydblr 函数使用 echo 语句输出每个数组元素的值。脚本用 arraydblr 函数的输出重组了一个新的数组变量。
