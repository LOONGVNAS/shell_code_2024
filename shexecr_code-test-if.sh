#!/bin/bash
if grep "loondagson" /etc/passwd
then
        echo "loongson is exist"
elif grep "rooddt" /etc/passwd
then
        echo "root is exist"
else
        echo noting
fi


if test
then
        echo "no test condition is true"
else
        echo "no test condistion is false"
fi


# Misusing string comparisons
#
string1=soccer
string2=zorbfootball
#
if [ $string1 > $string2 ]
then
     echo "$string1 is greater than $string2"
else
     echo "$string1 is less than $string2"
fi

# 判断两个数值是否相等
if test 1 -eq 1; then
  echo "The two numbers are equal."
else
  echo "The two numbers are not equal."
fi

# 判断第一个数值是否小于第2个
if test 1 -lt 2; then
  echo "The first number is less than the second number."
else
  echo "The first number is not less than the second number."
fi

# 试图比较两个数值
var=$[1+1]
var1=$((1+1))
if test 1 -eq $var1; then
  echo "The two numbers are equal."
else
  echo "The two numbers are not equal."
fi
