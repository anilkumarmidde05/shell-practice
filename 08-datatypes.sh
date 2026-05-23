#!/bin/bash

NUM1=100
#NUM2=200
NUM2=Anilkumar
SUM=$(($NUM1+$NUM2))

echo "sum is: $SUM"

##arrays
FRUITS=("Apples", "Mangos","JAMAKAYA")
 echo "FRUITS are: ${FRUITS[@]}"