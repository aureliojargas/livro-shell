#!/bin/bash
# form.sh

# Vamos mostrar uma página HTML
echo Content-type: text/html
echo

echo "<H1>Os dados enviados foram:</H1>"
echo "<PRE>"

# Lê os dados do formulário via STDIN
read TRIPA

# Mostra os dados na tela
echo "$TRIPA" | tr '&+' '\n '
