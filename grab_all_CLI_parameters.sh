#!/bin/bash
#Exploring different methods for grabbing all parameters.
#
echo
echo "Using the \$* method: $*"
count=1
for param in "$*"
do
        echo "\$* Parameter #$count = $param"
        count=$[ $count+1 ]
done


#
echo
echo "Using the \$@ method: $@"
count=1
for param in "$@"
do
     echo "\$@ Parameter #$count = $param"
     count=$[ $count + 1 ]
done
echo
exit


#[loongson@localhost ~]$ ./test.sh one two three four
#
#Using the $* method: one two three four
#$* Parameter #1 = one two three four
#
#Using the $@ method: one two three four
#$@ Parameter #1 = one
#$@ Parameter #2 = two
#$@ Parameter #3 = three
#$@ Parameter #4 = four
#
