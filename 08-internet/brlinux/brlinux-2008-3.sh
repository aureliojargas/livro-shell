#!/bin/bash
# brlinux-2008-3.sh
# Mostra as 5 últimas manchetes do BR-Linux
# Versão 3 que procura no Feed XML
#
# Aurélio, Março de 2008

URL="http://br-linux.org/feed/"

# O padrão são linhas com "<title>".
# O sed remove as tags HTML, restaura as aspas,
# apaga os espaços do início e remove a primera linha.
# O head limita o número de manchetes em 5.
#
lynx -source "$URL" |
	grep '<title>' |
	sed '
		s/<[^>]*>//g
		s/&quot;/"/g
		1d' |
	tr -d '\t' |
	head -n 5
