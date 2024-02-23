#!/bin/bash
# Testing a single parentheses condition
#
echo $BASH_SUBSHELL
#
if (echo $BASH_SUBSHELL)
then
     echo "The subshell command operated successfully."
#
else
     echo "The subshell command was NOT successful."
#
fi




if (cd . ; touch ext.txt; rm -f ext.txt; echo "google"; (echo $BASH_SUBSHELL))
then
     (echo $BASH_SUBSHELL)
     echo "The subshell command and program list operate successfully."
#
else
     echo "The subshell command was NOT successful."
#
fi
