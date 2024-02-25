#The last parameter is four
#!/bin/bash
# Testing grabbing the last parameter 
#
echo The number of parameters is $# 
echo The last parameter is ${!#} 
exit
$
$ ./goodlastparamtest.sh one two three four 
The number of parameters is 4
The last parameter is four 
$
$ ./goodlastparamtest.sh
The number of parameters is 0
The last parameter is ./goodlastparamtest.sh                                         23 
$
