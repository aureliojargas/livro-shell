#!/bin/bash
# modelo.sh

# Vamos mostrar uma página HTML
echo Content-type: text/html
echo

# Obtém dados do usuário
login=$(whoami)
grupos=$(groups)
nome=$(grep "^$login:" /etc/passwd | cut -d : -f 5)

# Obtém dados do sistema
data=$(date "+%d.%m.%Y")
raiz=$(df / | tail -n 1 | tr -s ' \t' | cut -d ' ' -f 5)
barra_bin=$(ls -1 /bin | wc -l)

# Mostra o modelo, com os dados coletados
cat <<FIM

<H1>Dados do usuário</H1>

<UL>
	<LI><B>Nome:</B> $nome</LI>
	<LI><B>Login:</B> $login</LI>
	<LI><B>Grupos:</B> $grupos</LI>
	<LI><B>Home:</B> $HOME</LI>
</UL>	

<H1>Dados do sistema</h1>

<UL>
	<LI><B>Data atual:</B> $data</LI>
	<LI><B>Diretório corrente:</B> $PWD</LI>
	<LI><B>Partição raiz:</B> $raiz ocupada</LI>
	<LI><B>Programas no /bin:</B> $barra_bin</LI>
</UL>

FIM
