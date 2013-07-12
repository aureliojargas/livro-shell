#!/bin/bash
# mostra_path_pre.sh

# Vamos mostrar uma página HTML
echo Content-type: text/html
echo

# Adiciona um diretório falso ao PATH
PATH=$PATH:/noel

# Inicia um texto pré-formatado
echo "<PRE>"

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

# Fecha o texto pré-formatado
echo "</PRE>"
