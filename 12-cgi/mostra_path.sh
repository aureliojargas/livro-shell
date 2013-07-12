#!/bin/bash
# mostra_path.sh

# Adiciona um diretório falso ao PATH
PATH=$PATH:/noel

# Para cada diretório do $PATH...
IFS=:
for diretorio in $PATH; do
	
	# Confirme se ele existe
	if test -d $diretorio; then
		extra="existe"
	else
		extra="não existe"
	fi
	
	# E mostre o resultado na tela
	echo "$diretorio ($extra)"
done
