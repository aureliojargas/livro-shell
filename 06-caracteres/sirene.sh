#!/bin/bash
# sirene.sh
# Bom para chamar a atenção dos colegas de trabalho :)

echo -n "[11;900]"   # Cada bipe dura quase um segundo
while :                   # Loop eterno
do
	echo -n "[10;500]" ; sleep 1  # Tom alto (agudo)
	echo -n "[10;400]" ; sleep 1  # Tom baixo (grave)
done

