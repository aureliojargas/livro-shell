#!/bin/bash
# grita.sh
#
# Mostra uma palavra ($TXT) em maiúsculas e com exclamações
# Exemplo: foo -> !!!!!FOO!!!!!

TXT="gritaria"

TXT="     $TXT     "            # Adiciona 5 espaços ao redor

echo "TXT com espaços    : [$TXT]"
TXT=$(echo $TXT | tr ' ' '!')   # Troca os espaços por exclamações
echo "TXT com exclamações: [$TXT]"

TXT=$(echo $TXT | tr a-z A-Z)   # Deixa o texto em maiúsculas
echo "$TXT"                     # Mostra a mensagem
