#! /bin/bash
heads=0
tails=0
declare -A singlets
for((count=1; count<=10; count++))
do
	coinFlip=$((RANDOM%2))
	singlets[$count]=$coinFlip
done
for key in "${!singlets[@]}"
do
	if [ "${singlets[$key]}" -eq 0 ]
	then
		((heads++))
	else
		((tails++))
	fi
done
echo "Percentage of heads: $(($heads*10))"
echo "Percentage of tails: $(($tails*10))"
