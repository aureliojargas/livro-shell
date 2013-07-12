#!/bin/bash
# brlinux-2008-2.sh
# Mostra as 5 últimas manchetes do BR-Linux
# Versão 2 que procura no código HTML
#
# Aurélio, Março de 2008

URL="http://br-linux.org"

# O padrão são linhas com "<h2><a href".
# O sed remove as tags HTML, restaura as aspas e
# apaga os espaços do início.
# O head limita o número de manchetes em 5.
#
lynx -source "$URL" |
	grep '<h2><a href' |
	sed '
		s/<[^>]*>//g
		s/&quot;/"/g' |
	tr -d '\t' |
	head -n 5
