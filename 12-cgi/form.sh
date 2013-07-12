#!/bin/bash
# form.sh

# Vamos mostrar uma página HTML
echo Content-type: text/html
echo

# Função para decodificar acentos e símbolos na tripa
# Exemplo: "%E3" vira "á"
urldecode() {
	echo -e $(sed 's/%/\\x/g')
}

########## PARTE 1 - Extrair os dados

# Lê os dados do formulário via STDIN
read TRIPA

# Usa o IFS para separar os pares de campo=valor
IFS='&'
set - $TRIPA

# Para cada par de dados...
for nome_valor; do

	# Extrai cada componente do par
	nome_campo=$( echo "$nome_valor" | cut -d= -f1)
	valor_campo=$(echo "$nome_valor" | cut -d= -f2 | tr + ' ' | urldecode)

	# Usa o eval para guardar em uma variável
	# Ex.: eval idade="18-30"
	eval $nome_campo=\"$valor_campo\"
done

########## PARTE 2 - Processar os dados

primeiro_nome=$(echo $nome | cut -d' ' -f1)

case "$idade" in
	   17) idade="Menos de 18 anos";;
	18-30) idade="Entre 18 e 30 anos";;
	   31) idade="Mais de 30 anos";;
esac

[ "$sexo" = F ] && sexo=Feminino || sexo=Masculino


########## PARTE 3 - Mostrar os dados (usando um modelo)

cat <<FIM

	<H1>Dados de $primeiro_nome:</H1>

	<UL>
		<LI><B>Nome: </B> $nome </LI>
		<LI><B>Idade:</B> $idade</LI>
		<LI><B>Sexo: </B> $sexo </LI>
	</UL>
FIM
