#!/bin/bash
# brlinux-1.sh
# Mostra as 5 últimas manchetes do BR-Linux
# Versão 1 que procura no texto
#
# Aurélio, Agosto de 2006

URL="http://br-linux.org"

# O padrão são linhas que iniciam com maiúsculas.
# Até a linha "Destaques de hoje" é lixo.
#
lynx -dump -nolist "$URL" |
	grep '^[A-Z]' |
	sed '1,/^Destaques de hoje/ d' |
	head -n 5
