#!/bin/bash

#DO NOT REMOVE THE FOLLOWING TWO LINES
git add $0 >> .local.git.out
git commit -a -m "Lab 2 commit" >> .local.git.out
git push >> .local.git.out || echo


#Your code here
if [ -z "$1" ]; then
    echo "USAGE: " 
    echo "$0 {password file}"
    exit
fi

password=`cat $1`

# If the password has less than 6, or more than 32 characters
if [ ${#password} -le 6 -o ${#password} -ge 32 ]; then
    echo "Error: Password length invalid."
    exit
fi

# For any valid password: +1 for each character
score=${#password}

# If the password contains one of the following special characters (#$+%@) + 5
if [[ $password == *['#'\$+%@]* ]]
then
    score=$(( $score+5 ))
fi

# If the password contains at least one number (0-9) +5
if [[ $password == *[0-9]* ]]
then
    score=$(( $score+5 ))
fi

#If the password contains at least one alpha character (A-Za-z) +5
if [[ $password == *[a-zA-Z]* ]]
then
    score=$(( $score+5 ))
fi

#If the password contains repeated number or character (0-9 A-Z a-z) -10
check=`egrep -E '([[a-zA-Z]|[0123456789]])\1+' $1`
if [ "$password" = "$check" ]; then
	score=$(( $score-10 ))
fi
# If the password contains 3 or more consecutive lowercase characters (i.e. bbb, abe, this)
check=`grep -e '[a-z][a-z][a-z]' $1`
if [ "$password" = "$check" ]; then
	score=$(( $score-3 ))
fi

# If the password contains 3 or more consecutive uppercase characters (i.e. BBB, ABE, this)
check=`grep -e '[A-Z][A-Z][A-Z]' $1`
if [ "$password" = "$check" ]; then
    score=$(( $score-3 ))
fi

echo "Password Score: $score"
