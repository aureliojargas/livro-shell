#!/bin/bash
# mostra_path_lista_cor.sh

# Vamos mostrar uma página HTML
echo Content-type: text/html
echo

# Adiciona um diretório falso ao PATH
PATH=$PATH:/noel

# Título da página
echo "<h1>Componentes de seu PATH</h1>"

# Inicia uma lista de itens
echo "<UL>"

# Para cada diretório do $PATH...
IFS=:
for diretorio in $PATH; do
	
	# Confirme se ele existe
	if test -d $diretorio; then
		extra='<FONT COLOR="green">existe</FONT>'
	else
		extra='<FONT COLOR="red">não existe</FONT>'
	fi
	
	# E mostre o resultado na tela (item da lista)
	echo "<LI>$diretorio $extra</LI>"
done

# Fecha a lista
echo "</UL>"
