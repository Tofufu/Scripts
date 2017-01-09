#!/bin/bash

# Random heart - really messy code oh well
trap "tput reset; tput cnorm; exit" 2
clear
row=$(($(tput lines)/2)) #row it will start from at the top~ starts from 0 (rows)
column=$(($(tput cols)/2)) # the column, where it will start from in the middle here
color=126
tput setaf $color

maxInOneRow=7; # max number of blocks to fill in per row
#---------- the 2 top parts of the heart ----------
#let testing=7/2; # truncates remainder
numspace=3;
numtopblocks=2;
for ((toprow=0; toprow<2; toprow++))
{
    tput cup $row $column
    for ((j=1; j<=maxInOneRow; j++))
    {
        echo -n '▒'
        if [ $j -eq $numtopblocks ];
        then
            for ((space=1; space<=numspace; space++))
            {
                echo -n " ";
                let j++;
            }
        fi
    }
    let numtopblocks++;
    let color=color+2;
    let numspace-=2;
    let row++;
}

#let row++; # moves down 1
# ------------ Inverse Triangle ------------

# number of rows on the bottom triangle
for ((trianglerow=0; trianglerow<4; trianglerow++))
{
    tput cup $row $column # set at middle of the terminal
    for ((i=1; i<=maxInOneRow; i++)) # echos out to max num blocks
    {
        echo -n '▒' # -n gets rid of new line
    }

    let maxInOneRow=maxInOneRow-2; # -2 for reverse triangle
    let row++; # moves down for next row
    let column++; # moves right
    let color=color+2; #changing colors
    tput setaf $color; # changing color for next row
}



echo ""; echo ""; echo ""; echo "";
printf '\e[%sm' 0
