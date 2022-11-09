#!/bin/bash/

if [[ $# -lt 2 ]] ; then
	return 1
fi

index=1
total=$(wc $2 | awk '{print $1}')
readTotal=$(($total * $1))
finalrange=$(( readTotal / 100 ))


while [ $index -le $finalrange ]
	do
		lineval=$(($RANDOM % ($total - 1) + 1))
		textLine=$(sed "${lineval}q;d" $2)
		echo $textLine
		index=$((index + 1))
	done

