#!/bin/bash

if test $1 -eq $2
then
	echo "$1 é igual a $2"
elif test $1 -lt $2
then
	echo "$1 é menor que $2"
else
	echo "$1 é maior que $2"
fi
