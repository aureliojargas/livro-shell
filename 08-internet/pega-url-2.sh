#!/bin/bash
# pega-url-2.sh
# Extrai o endereço de um link HTML
#
# Aurélio, Agosto de 2006

TEXTO="Google"

fgrep ">$TEXTO</a>" pagina[12].html | sed 's/.*href="// ; s/".*//'
