#!/bin/bash
# cinco.sh
#
# Conta até cinco :)

set -x           # liga debug
trap read DEBUG  # liga passo a passo
echo $((0+1))
echo $((0+2))
trap "" DEBUG    # desliga passo a passo
echo $((0+3))
echo $((0+4))
echo $((0+5))
