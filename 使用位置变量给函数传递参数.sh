#函数名保存在 $0 变量中，函数参数依次保存在$1、$2 等变量中。
#特殊变量$#来确定传给函数的参数 数量。
#!/bin/bash
# passing parameters to a function 
function addem {
   if [ $# -eq 0 ] || [ $# -gt 2 ] 
   then
      echo -1
   elif [ $# -eq 1 ] 
   then
      echo $[ $1 + $1 ] 
   else
      echo $[ $1 + $2 ] 
   fi
}
echo -n "Adding 10 and 15: " 
value=$(addem 10 15)
echo $value
echo -n "Let's try adding just one number: " 
value=$(addem 10)
echo $value
echo -n "Now try adding no numbers: " 
value=$(addem)
echo $value
echo -n "Finally, try adding three numbers: " 
value=$(addem 10 15 20)
echo $value
