#!/bin/bash
# grita.sh
#
# Mostra uma palavra ($TXT) em maiúsculas e com exclamações
# Exemplo: foo -> !!!!!FOO!!!!!

TXT="gritaria"

TXT="     $TXT     "            # Adiciona 5 espaços ao redor
TXT=$(echo "$TXT" | tr ' ' '!') # Troca os espaços por exclamações
TXT=$(echo $TXT | tr a-z A-Z)   # Deixa o texto em maiúsculas
echo "$TXT"                     # Mostra a mensagem



TXT="gritaria"

TXT="     $TXT     "            # Adiciona 5 espaços ao redor

set -v           # liga debug
trap read DEBUG  # liga passo a passo

TXT=$(echo "$TXT" | tr ' ' '!') # Troca os espaços por exclamações
TXT=$(echo $TXT | tr a-z A-Z)   # Deixa o texto em maiúsculas

trap "" DEBUG    # desliga passo a passo
set +v           # desliga debug

echo "$TXT"                     # Mostra a mensagem
