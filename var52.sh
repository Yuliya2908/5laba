#!/bin/bash

# Написать shell-процедуру, которая:
# вводит 3 символьные строки; 
# в каждой введенной строке ищет подстроку, передаваемую в качестве параметра; 
# заменяет каждую найденную подстроку на пробел; 
# образует из полученных строк четвертую строку так, чтобы в ней чередовались 
# слова из первой, второй и третьей строк; 
# выводит на экран введенные строки и новую строку.

# TO_REPLACE=$1
TO_REPLACE=second
TMP_FILE=tmp.bak 

# read -p "Enter line1: " LINE1
# read -p "Enter line2: " LINE2
# read -p "Enter line3: " LINE3

LINE1="first second"
LINE2="third fours"
LINE3="fifth six"
NEW_LINE1=$(echo "$LINE1" | sed "s/$TO_REPLACE/ /")
NEW_LINE2=$(echo "$LINE2" | sed "s/$TO_REPLACE/ /")
NEW_LINE3=$(echo "$LINE3" | sed "s/$TO_REPLACE/ /")

# storing LINEs to tmpfile
echo $NEW_LINE1 >> $TMP_FILE
echo $NEW_LINE2 >> $TMP_FILE
echo $NEW_LINE3 >> $TMP_FILE

echo "Lines after replace substring=\"$TO_REPLACE\":"
cat $TMP_FILE


echo; echo "Result line:"
# transpose a file
awk '
{ 
    for (i=1; i<=NF; i++)  {
        a[NR,i] = $i
    }
}
NF>p { p = NF }
END {    
    for(j=1; j<=p; j++) {
        str=a[1,j]
        for(i=2; i<=NR; i++){
            str=str" "a[i,j];
        }
        printf str
    }
}' $TMP_FILE
echo
# cleaning trash
rm $TMP_FILE


