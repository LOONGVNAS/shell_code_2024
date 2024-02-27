
#!/bin/bash
# Check systems on local network allowing for
# a variety of input methods
#
#
########### Determine Input Method ###################
#
# Check for command-line options here using getopts.
# If none, then go on to File Input Method
#
# 当CLI选项不存在时，条件不成立，直接执行获得file mode处理逻辑
while getopts t: opt
do
     case "$opt" in
          t) # Found the -t option
             if [ $OPTARG = "IPv4" ]
             then
                  pingcommand=$(which ping)
             #
             elif [ $OPTARG = "IPv6" ]
             then
                 pingcommand=$(which ping6)
             #
             else
                 echo "Usage: -t IPv4 or -t IPv6"
                 echo "Exiting script..."
                 exit
             fi
             ;;
          *) echo "Usage: -t IPv4 or -t IPv6"
             echo "Exiting script..."
             exit;;
     esac
     #
     echo "Test OPTIND IS : $OPTIND"
     shift $[ $OPTIND - 1 ]
     #
     if [ $# -eq 0 ]
     then
          echo
          echo "IP Address(es) parameters are missing."
          echo
          echo "Exiting script..."
          exit
     fi
     #
     for ipaddress in "$@"
     do
          echo
          echo "Checking system at $ipaddress..."
          echo
          $pingcommand -q -c 3 $ipaddress
          echo
     done
     exit
done
#
########### File Input Method ###################
#
echo
echo "Please enter the file name with an absolute directory
reference..."
echo
choice=0
while [ $choice -eq 0 ]
do
     read -t 60 -p "Enter name of file: " filename
     if [ -z $filename ]
     then
          quitanswer=""
          read -t 10 -n 1 -p "Quit script [Y/n]? " quitanswer
          #
          case $quitanswer in
          Y | y) echo
                 echo "Quitting script..."
                 exit;;
          N | n) echo
                 echo "Please answer question: "
                 choice=0;;
          *)     echo
                 echo "No response. Quitting script..."
                 exit;;
          esac
     else
          choice=1
     fi
done
#
if [ -s $filename ] && [ -r $filename ]
     then
          echo "$filename is a file, is readable, and is not empty."
          echo
          cat $filename | while read line
          do
               ipaddress=$line
               read line
               iptype=$line
               if [ $iptype = "IPv4" ]
               then
                    pingcommand=$(which ping)
               else
                    pingcommand=$(which ping6)
               fi
               echo "Checking system at $ipaddress..."
               $pingcommand -q -c 3 $ipaddress
               echo
          done
          echo "Finished processing the file. All systems checked."
     else
          echo
          echo "$filename is either not a file, is empty, or is"
          echo "not readable by you. Exiting script..."
fi
#
#################### Exit Script #####################
#
exit


#CLI 的用法 百度IPv4地址
[loongson@localhost ~]$ ./test.sh -t IPv4 110.242.68.4
Test OPTIND IS : 3

Checking system at 110.242.68.4...

PING 110.242.68.4 (110.242.68.4) 56(84) bytes of data.

--- 110.242.68.4 ping statistics ---
3 packets transmitted, 3 received, 0% packet loss, time 2003ms
rtt min/avg/max/mdev = 10.600/16.077/24.836/6.258 ms

 
#FILE 的用法： 回环地址和百度IPv6地址
[loongson@localhost ~]$ cat 1.txt
127.0.0.1
IPv4
2400:da00::dbf:0:100
IPv6
[loongson@localhost ~]$ ./test.sh

Please enter the file name with an absolute directory
reference...

Enter name of file: 1.txt
1.txt is a file, is readable, and is not empty.

Checking system at 127.0.0.1...
PING 127.0.0.1 (127.0.0.1) 56(84) bytes of data.

--- 127.0.0.1 ping statistics ---
3 packets transmitted, 3 received, 0% packet loss, time 1999ms
rtt min/avg/max/mdev = 0.014/0.061/0.140/0.056 ms

Checking system at 2400:da00::dbf:0:100...
PING 2400:da00::dbf:0:100(2400:da00::dbf:0:100) 56 data bytes

--- 2400:da00::dbf:0:100 ping statistics ---
3 packets transmitted, 0 received, 100% packet loss, time 2014ms


Finished processing the file. All systems checked.
