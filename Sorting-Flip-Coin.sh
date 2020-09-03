#! /bin/bash
declare -A singlets
singlets[H]=0
singlets[T]=0
declare -A doublets
doublets[HH]=0
doublets[HT]=0
doublets[TH]=0
doublets[TT]=0
declare -A triplets
triplets[HHH]=0
triplets[HHT]=0
triplets[HTH]=0
triplets[HTT]=0
triplets[THH]=0
triplets[THT]=0
triplets[TTH]=0
triplets[TTT]=0
for((count=1; count<=10; count++))
do
	firstCoinFlip=$((RANDOM%2))
	secondCoinFlip=$((RANDOM%2))
	thirdCoinFlip=$((RANDOM%2))
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
	if [ $firstCoinFlip == $secondCoinFlip ] && [ $secondCoinFlip == $thirdCoinFlip ]
	then
		if [ $firstCoinFlip -eq 0 ]
		then
			value="${triplets[HHH]}"
			((value++))
			triplets[HHH]=$value
		else
			value="${triplets[TTT]}"
         ((value++))
         triplets[TTT]=$value
		fi
	fi
	if [ $firstCoinFlip == $secondCoinFlip ]
	then
		if [ $thirdCoinFlip -eq 0 ]
		then
			value="${triplets[TTH]}"
         ((value++))
         triplets[TTH]=$value
		else
			value="${triplets[HHT]}"
         ((value++))
         triplets[HHT]=$value
		fi
	fi
	if [ $firstCoinFlip == $thirdCoinFlip ]
	then
		if [ $secondCoinFlip -eq 0 ]
		then
			value="${triplets[THT]}"
         ((value++))
         triplets[THT]=$value
		else
			value="${triplets[HTH]}"
         ((value++))
         triplets[HTH]=$value
		fi
	fi
	if [ $secondCoinFlip == $thirdCoinFlip ]
	then
		if [ $firstCoinFlip -eq 0 ]
		then
			value="${triplets[HTT]}"
         ((value++))
         triplets[HTT]=$value
		else
			value="${triplets[THH]}"
         ((value++))
         triplets[THH]=$value
		fi
	fi
done
maxSinglet=0
maxDoublet=0
maxTriplet=0
for key in "${!singlets[@]}"
do
	if [ $maxSinglet -lt "${singlets[$key]}" ]
	then
		winningKey=$key
	fi
done
echo "The winning singlet combination is: $winningKey"
for key in "${!doublets[@]}"
do
	if [ $maxDoublet -lt "${doublets[$key]}" ]
   then
      winningKey=$key
   fi
done
echo "The winning doublet combination is: $winningKey"
for key in "${!triplets[@]}"
do
   if [ $maxTriplet -lt "${triplets[$key]}" ]
   then
      winningKey=$key
   fi
done
echo "The winning triplet combination is: $winningKey"
