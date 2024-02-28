#!/bin/bash
# using recursion 
function factorial {
   if [ $1 -eq 1 ]
   then                                                                              20 
      echo 1
   else
      local temp=$[ $1 - 1 ]
      local result=$(factorial $temp) 
      echo $[ $result * $1 ]
   fi 
}
read -p "Enter value: " value                                                        22 
result=$(factorial $value)
echo "The factorial of $value is: $result" 
$
$ ./test13
Enter value: 5 23
The factorial of 5 is: 120 
$
