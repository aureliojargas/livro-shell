#!/bin/bash
# som.sh
# Demonstração de mudança da freqüência do Speaker
# Dica: Digite Ctrl+C para finalizar.
#

# Restaura o bipe padrão (f=750, t=100ms)
echo -e '\033[10;750]\033[11;100]'

freq=0                          # freqüência inicial
while : ; do                    # loop infinito
	freq=$((freq+1))                # aumenta freqüência
	echo -e "\033[10;$freq]"        # muda freqüência no Speaker
	echo    "frequência=$freq"      # mostra freqüência atual
	echo -e '\a'                    # emite um bipe
	usleep 100                      # espera 100us
done
