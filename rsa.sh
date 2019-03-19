#/bin/bash
clear
#
echo "Example values:"
echo "p = 11, where p is a very large Prime"
echo "q = 13, where q is a very large Prime"
echo "e = 7, where e is the exponent (any number between 1 and tot(n) that is Prime) "
#
read -p "What is your value for p?: " p
read -p "What is your value for q?: " q
totn=$(echo "($p-1)*($q-1)" | bc)
read -p "What is your value for e? (must be a prime less than $totn): " e
#
#
multiplicativeInverse () {
temp1=$(mktemp -t temp1.XXXXXX)
  val=1
    while true
    do
      ans=$(echo "($val * $e) % $totn" | bc)
      echo "trying $val...$ans" >> $temp1
      if [ $ans -eq 1 ]
      then
       break
      fi
  val=$[$val+1]
  done
  rm -f $temp1
}
#
#
n=$(echo "$p * $q" | bc)
  echo "Values for calculation..."
  echo
  echo "n = p x q"
  echo
  echo "tot(n) = (p-1) x (q-1)" 
  echo
multiplicativeInverse
  echo "d = e ^-1 (mod tot(n))"
  d=$(echo $val)
  echo
  echo "n = $n"
  echo "e = $e"
  echo "d = $d" 
  echo
  echo "Private key (d,n): $d,$n"
  echo "Public key (e,n):  $e,$n"
sleep 1
echo
read -p "What number would you like to encrypt?: " enc
echo
echo "-----------------------------------------------------------------------"
cipher=$(echo "$enc^$e % $n" | bc)
echo "Ciphertext = Plaintext ^e mod n"
echo "You have encrypted the plaintext of $enc, the ciphertext is: $cipher"
cleartext=$(echo "$cipher^$d % $n" | bc)
echo
echo "Plaintext = Ciphertext ^d mod n"
echo "You have decrypted the ciphertext $cipher to reveal the plaintext of $cleartext"
echo "-----------------------------------------------------------------------"
