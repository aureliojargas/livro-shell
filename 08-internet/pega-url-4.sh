#!/bin/bash
# pega-url-4.sh
# Extrai o endereço de um link HTML
#
# Aurélio, Agosto de 2006

TEXTO="Google"

for arquivo in pagina[1234].html
do
	tr '\n' ' ' < "$arquivo" |
	 	awk 'gsub("<[^/]", "\n&")' |
		fgrep -i ">$TEXTO</a>" |
 		tr A-Z a-z |
 		tr -d \" |
		sed 's/.*href=// ; s/>.*//'
done
