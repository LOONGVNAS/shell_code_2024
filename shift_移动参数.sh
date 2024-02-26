#!/bin/bash
# Shifting through the parameters 
#
echo
echo "Using the shift method:"
count=1                                                                              23 
while [ -n "$1" ]
do
  echo "Parameter #$count = $1"
  count=$[ $count + 1 ] 
  shift
done
echo
exit 

#Uage
#shift_usage.sh one two three four


$ cat bigshiftparams.sh 
#!/bin/bash
# Shifting multiple positions through the parameters 
#
echo
echo "The original parameters: $*"
echo "Now shifting 2..." 
shift 2
echo "Here's the new first parameter: $1" 
echo
exit 
$
$ ./bigshiftparams.sh alpha bravo charlie delta 
The original parameters: alpha bravo charlie delta
Now shifting 2...
Here's the new first parameter: charlie
