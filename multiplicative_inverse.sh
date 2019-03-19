#!/bin/bash
#
clear
#
echo "This programe calculates the multiplicative inverse of n mod m."
echo
read -p "What is your value for 'n'": n
read -p "What is your value for 'm'": m
temp1=$(mktemp -t temp1.XXXXXX)
val=1
echo "Calculating '(x * n) mod m' where x is an integer starting at 1 and increasing. All answers must be unique for x to be the multiplicative inverse.."
echo "Working...."
while true
do
  ans=$(echo "($val * $n) % $m" | bc)
  echo "trying $val...$ans" >> $temp1
    if [ $ans -eq 1 ]
    then
      echo
      tail -n 20 $temp1
      echo "The answer was $val"
      echo
      exit
    fi
  val=$[$val+1]
done
rm -f $temp1
