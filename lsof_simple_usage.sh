#!/bin/bash
# testing lsof with file descriptors
exec 3> test18file1
exec 6> test18file2
exec 7< testfile
lsof -a -p $$ -d0,1,2,3,6,7,8
sleep 2
exit

#
#output
#COMMAND  PID     USER   FD   TYPE DEVICE SIZE/OFF    NODE NAME
#test.sh 2259 loongson    0u   CHR  136,0      0t0       3 /dev/pts/0
#test.sh 2259 loongson    1u   CHR  136,0      0t0       3 /dev/pts/0
#test.sh 2259 loongson    2u   CHR  136,0      0t0       3 /dev/pts/0
#test.sh 2259 loongson    3w   REG    8,1        0 2572438 /home/loongson/test18file1
#test.sh 2259 loongson    6w   REG    8,1        0 2574199 /home/loongson/test18file2
#test.sh 2259 loongson    7r   REG    8,1        0 2574217 /home/loongson/testfile
