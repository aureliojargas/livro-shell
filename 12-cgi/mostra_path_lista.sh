#!/bin/bash
# mostra_path_lista.sh

# Vamos mostrar uma página HTML
echo Content-type: text/html
echo

# Adiciona um diretório falso ao PATH
PATH=$PATH:/noel

# Inicia uma lista de itens
echo "<UL>"

# Para cada diretório do $PATH...
IFS=:
for diretorio in $PATH; do
	
	# Confirme se ele existe
	if test -d $diretorio; then
		extra="existe"
	else
		extra="não existe"
	fi
	
	# E mostre o resultado na tela (item da lista)
	echo "<LI>$diretorio ($extra)</LI>"
done

# Fecha a lista
echo "</UL>"
