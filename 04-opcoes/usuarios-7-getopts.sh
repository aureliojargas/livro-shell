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
# Versão 5: Adicionadas opções -s e --sort
# Versão 6: Adicionadas opções -r, --reverse, -u, --uppercase,
#           leitura de múltiplas opções (loop)
# Versão 7: Melhorias no código para que fique mais legível,
#           adicionadas opções -d e --delimiter
# Versão 7g: Modificada para usar o getopts
#
# Aurélio, Novembro de 2007
#

ordenar=0           # A saída deverá ser ordenada?
inverter=0          # A saída deverá ser invertida?
maiusculas=0        # A saída deverá ser em maiúsculas?
delim='\t'          # Caractere usado como delimitador de saída

MENSAGEM_USO="
Uso: $(basename "$0") [OPÇÕES]

OPÇÕES:
  -d C     Usa o caractere C como delimitador
  -r       Inverte a listagem
  -s       Ordena a listagem alfabeticamente
  -u       Mostra a listagem em MAIÚSCULAS

  -h       Mostra esta tela de ajuda e sai
  -V       Mostra a versão do programa e sai
"

# Tratamento das opções de linha de comando
while getopts ":hVd:rsu" opcao
do
	case "$opcao" in

		# Opções que ligam/desligam chaves
		s) ordenar=1    ;;
		r) inverter=1   ;;
		u) maiusculas=1 ;;
	
		d)
			delim="$OPTARG"
		;;
		
		h)
			echo "$MENSAGEM_USO"
			exit 0
		;;

		V)
			echo -n $(basename "$0")
			# Extrai a versão diretamente dos cabeçalhos do programa
			grep '^# Versão ' "$0" | tail -1 | cut -d : -f 1 | tr -d \#
			exit 0
		;;

		\?)
			echo Opção inválida: $OPTARG
			exit 1
		;;

		:)
			echo Faltou argumento para: $OPTARG
			exit 1
		;;
	esac
done

# Extrai a listagem
lista=$(cut -d : -f 1,5 /etc/passwd)

# Ordena, inverte ou converte para maiúsculas (se necessário)
test "$ordenar"    = 1 && lista=$(echo "$lista" | sort)
test "$inverter"   = 1 && lista=$(echo "$lista" | tac)
test "$maiusculas" = 1 && lista=$(echo "$lista" | tr a-z A-Z)

# Mostra o resultado para o usuário
echo "$lista" | tr : "$delim"
