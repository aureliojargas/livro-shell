#!/bin/bash
# usuarios.sh
#
# Mostra os logins e nomes de usuários do sistema
# Obs.: Lê dados do arquivo /etc/passwd
#
# Versão 1: Mostra usuários e nomes separados por TAB
# Versão 2: Adicionado suporte à opção -h
# Versão 3: Adicionado suporte à opção -V e opções inválidas
# Versão 4: Arrumado bug quando não tem opções, basename no
#           nome do programa, -V extraindo direto dos cabeçalhos,
#           adicionadas opções --help e --version
#
# Aurélio, Novembro de 2007
#

MENSAGEM_USO="
Uso: $(basename "$0") [-h | -V]

  -h, --help        Mostra esta tela de ajuda e sai
  -V, --version     Mostra a versão do programa e sai
"

# Tratamento das opções de linha de comando
case "$1" in
	-h | --help)
		echo "$MENSAGEM_USO"
		exit 0
	;;

	-V | --version)
		echo -n $(basename "$0")
		# Extrai a versão diretamente dos cabeçalhos do programa
		grep '^# Versão ' "$0" | tail -1 | cut -d : -f 1 | tr -d \#
		exit 0
	;;

	*)
		if test -n "$1"
		then
			echo Opção inválida: $1
			exit 1
		fi
	;;
esac

# Processamento
cut -d : -f 1,5 /etc/passwd | tr : \\t
