#! /bin/bash
declare -A singlets
singlets[H]=0
singlets[T]=0
declare -A doublets
doublets[HH]=0
doublets[HT]=0
doublets[TH]=0
doublets[TT]=0
for((count=1; count<=10; count++))
do
	firstCoinFlip=$((RANDOM%2))
	secondCoinFlip=$((RANDOM%2))
	if [ $firstCoinFlip -eq 0 ]
   then
   	value="${singlets[H]}"
      ((value++))
      singlets[H]=$value
	else
		 value="${singlets[T]}"
       ((value++))
       singlets[T]=$value
	fi
	if [ $firstCoinFlip -eq $secondCoinFlip ]
	then
		if [ $firstCoinFlip -eq 0 ]
		then
			value="${doublets[HH]}"
			((value++))
			doublets[HH]=$value
		else
			value="${doublets[TT]}"
			((value++))
			doublets[TT]=$value
		fi
	else
      if [ $firstCoinFlip -eq 0 ]
      then
         value="${doublets[HT]}"
         ((value++))
         doublets[HT]=$value
      else
         value="${doublets[TH]}"
         ((value++))
         doublets[TH]=$value
      fi
	fi
done
for key in "${!singlets[@]}"
do
	echo "Percentage of $key: $((${singlets[$key]}*10))"
done
for key in "${!doublets[@]}"
do
   echo "Percentage of $key: $((${doublets[$key]}*10))"
done

