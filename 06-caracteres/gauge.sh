#!/bin/bash
# gauge.sh
# Barra de progresso usando caracteres de controle
#
#    [.................................................]  0%
#    [########################.........................] 50%
#    [#################################################] 100
#

# barra vazia
echo -n '[.................................................]  0%'

passo='#####'

for i in 10 20 30 40 50 60 70 80 90 100; do
	sleep 1
	pos=$((i/2-5))           # calcula a posição atual da barra
	echo -ne '\033[G'        # vai para o começo da linha
	echo -ne "\033[${pos}C"  # vai para a posição atual da barra
	echo -n  "$passo"        # preenche mais um passo
	echo -ne '\033[53G'      # vai para a posição da porcentagem
	echo -n  "$i"            # mostra a porcentagem
done
echo
