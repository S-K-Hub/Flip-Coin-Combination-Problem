#! /bin/bash
declare -A singlets
singlets[H]=0
singlets[T]=0
for((count=1; count<=10; count++))
do
	coinFlip=$((RANDOM%2))
	if [ $coinFlip -eq 0 ]
	then
		value="${singlets[H]}"
		((value++))
		singlets[H]=$value
	else
		value="${singlets[T]}"
      ((value++))
      singlets[T]=$value
	fi
done
for key in "${!singlets[@]}"
do
	echo "Percentage of $key: $((${singlets[$key]}*10))"
done
