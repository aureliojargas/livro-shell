#!/bin/bash
# pega-url-3.sh
# Extrai o endereço de um link HTML
#
# Aurélio, Agosto de 2006

TEXTO="Google"

fgrep -i ">$TEXTO</a>" pagina[123].html |
 	tr A-Z a-z |
 	tr -d \" |
	sed 's/.*href=// ; s/>.*//'
