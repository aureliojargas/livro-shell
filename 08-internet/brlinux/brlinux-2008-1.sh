#!/bin/bash
# brlinux-2008-1.sh
# Mostra as 5 últimas manchetes do BR-Linux
# Versão 1 que procura no texto
#
# Aurélio, Março de 2008

URL="http://br-linux.org"

# O padrão são linhas que iniciam com maiúsculas.
# A primeira linha é apagada, pois é o nome do site.
#
lynx -dump -nolist "$URL" |
	grep '^[A-Z]' |
	sed '1d' |
	head -n 5
