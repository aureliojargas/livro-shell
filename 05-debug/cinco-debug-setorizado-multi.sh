#!/bin/bash
# cinco.sh
#
# Conta até cinco :)

set -v        # liga debug de linhas
echo $((0+1))
echo $((0+2))
set +v        # desliga debug de linhas
echo $((0+3))
set -x        # liga debug de comandos
echo $((0+4))
echo $((0+5))
set +x        # desliga debug de comandos
