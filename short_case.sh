#!/bin/bash
# Using a short case statement 
##case variable in
##pattern1 | pattern2) commands1;; 
##pattern3) commands2;;
##*) default commands;; 
##esac
#
case $USER in
rich | christine)
     echo "Welcome $USER"
     echo "Please enjoy your visit.";; 
barbara | tim)
     echo "Hi there, $USER"
     echo "We're glad you could join us.";; 
testing)
     echo "Please log out when done with test.";; 
*)
     echo "Sorry, you are not allowed here." 
esac
