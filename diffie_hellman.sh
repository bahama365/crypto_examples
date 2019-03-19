#/bin/bash
clear
#
echo "Example values:"
echo "P = 23, where P is a very large Prime publically known"
echo "n = 5, where n is a publically known primative root modulo of P, such that: n ^x mod P is always unique "
echo "a = 4, where a is the Clients secret random number"
echo "b = 3, where b is the Servers secret random number"
#
#
echo
read -p "What is your value for P?: " P
read -p "What is your value for n?: " n
read -p "What is your client value for a?: " a
read -p "What is your server value for b?: " b
#
echo
A=$(echo "$n^$a % $P" | bc) 
B=$(echo "$n^$b % $P" | bc)
echo
echo "Client    <----------------------'P,n' Server"
sleep 1
echo
echo "Client will calculate 'A' and share it with the Server......$A"
echo "A = n ^a mod P"
echo
echo "Server will calculate 'B' and share it with the Client......$B"
echo "B = n ^b mod P"
sleep 1
echo
echo "Client 'A' ---------------------->     Server"
echo "Client     <---------------------- 'B' Server"
echo
sleep 1
  CSecret=$(echo "$B^$a % $P" | bc)
  SSecret=$(echo "$A^$b % $P" | bc)

  echo "Shared Secret = B ^a mod P"
  echo "ans = $CSecret"
  echo
  echo "Shared Secret = A ^b mod P"
  echo "ans = $SSecret"
