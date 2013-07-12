#!/bin/bash
# cinco.sh
#
# Conta até cinco :)

echo $((0+1))
echo $((0+2))
set -xv       # liga debug
echo $((0+3))
set +xv       # desliga debug
echo $((0+4))
echo $((0+5))
