#!/bin/bash
#first line just indicates which sys is going to be running program (had to change it from sh to bash that was set as default for xcode - because the by putting /sh it wasn't working with my terminal (different variations of echo exists.. echo -n to remove the new line didn't exist)
#can't have spaces for variables has to be var=thing, $(expr|variable)
# tput = portable terminal control, allows us to get back status/info about terminal, set colors, clear the screen, etc - can be used for "drawing"
#TESTING=$(tput cols) #width of current terminal
#echo $TESTING
#tput setaf 2
#tput colors - shows all avaliable colors
#0=black, 1=red, 2=green, 3=yellow, 4=blue, 5=pink, 6=lightblue, 7=white, 8=grey


#-----This just prints out all the colors for the terminal----
MAXCOLORS=$(tput colors) #max colors for tput
#echo $MAXCOLORS
for ((i=0; i<$MAXCOLORS; i++))
{
    tput setaf $i # sets the text colors of the terminal
    echo -n $i
    echo -n ▒ " " # -n removes echo's default \n
    REMAINDER=$(($i % 10)) #expressions need $(())
    if [ $REMAINDER -eq 0 ]; # need to make sure that [_expression_]
    then echo ""
    fi
}
echo ""
printf '\e[%sm' 0
