#!/bin/bash
 # reading values from a file 
 file="states.txt"
 IFS=$'\n'
 for state in $(cat $file) 
 do
    echo "Visit beautiful $state" 
 done

#####特殊的环境变量 IFS（internal field separator，内部字段分隔符）。IFS
#####环境变量定义了 bash shell 用作字段分隔符的一系列字符。在默认情况下，bash shell 会将下列字      5 
#####符视为字段分隔符。
#####  空格
#####  制表符                                                                                                                                                      6
#####  换行符
#####如果 bash shell 在数据中看到了这些字符中的任意一个，那么它就会认为这是列表中的一个 
#####新字段的开始。
