#! /bin/bash
heads=0
tails=0
declare -A singlets
declare -A doublets
for((count=1; count<=10; count++))
do
	firstCoinFlip=$((RANDOM%2))
	secondCoinFlip=$((RANDOM%2))
	singlets[$count]=$firstCoinFlip
	if [ $firstCoinFlip -eq $secondCoinFlip ]
	then
		doublets[$count]=$firstCoinFlip
	fi
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
echo "Percentage of head singlets: $(($heads*10))"
echo "Percentage of tail singlets: $(($tails*10))"
heads=0
tails=0
for key in "${!doublets[@]}"
do
   if [ "${doublets[$key]}" == 0 ]
   then
      ((heads++))
   else
      ((tails++))
   fi
done
echo "Percentage of head doublets: $(($heads*10))"
echo "Percentage of tail doublets: $(($tails*10))"
