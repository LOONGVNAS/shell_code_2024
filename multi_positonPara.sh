#!/bin/bash
# Handling lots of command-line parameters 
# default max positon para is $9
product=$[ ${10} * ${11} ]
echo The tenth parameter is ${10}.                                                   21 
echo The eleventh parameter is ${11}.
echo The product value is $product. 
exit
$
$ ./positional10.sh 1 2 3 4 5 6 7 8 9 10 11 12
The tenth parameter is 10.
The eleventh parameter is 11.
The product value is 110.
