#!/bin/bash
# ambiente_tabela.sh

# Vamos mostrar uma página HTML
echo Content-type: text/html
echo

# Mostra o nome do servidor no título
echo "<h1>Ambiente CGI - $SERVER_NAME</h1>"

# Mostra as variáveis especiais do ambiente CGI
echo '<TABLE BORDER="1" CELLPADDING="5">'
env | sort | fgrep = | sed 's/^/<TR><TD>/ ; s/=/<\/TD><TD>/'
