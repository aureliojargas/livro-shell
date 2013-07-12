#!/bin/bash

i=$1
while test $i -ge 0
do
	echo -n "$i "
	i=$((i-1))
done
echo
