#!/bin/bash
# trying to pass an array variable
function testit {
   echo "The parameters are: $@"
   local newarray
   newarray=(`echo "$@"`)
   echo "The received array is ${newarray[@]}"
   #thisarray=$1
   #echo "The received array is ${thisarray[@]}"
}
myarray=(1 2 3 4 5)
echo "The original array is: ${myarray[*]}"
#testit ${myarray[@]}
testit ${myarray[*]}
