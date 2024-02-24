#!/bin/bash
# piping a loop to another command

for state in "North Dakota" Connecticut Illinois Alabama Tennessee
do
   echo "$state is the next place to go" 7
done | sort
echo "This completes our travels"
