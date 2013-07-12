#!/bin/bash
#
# mensagem.sh
# Mostra uma mensagem colorida na tela, lendo os
# dados de um arquivo de configuração externo.
#
# 2006-10-31 Fulano da Silva

CONFIG="mensagem.conf"            # Arquivo de configuração

# Configurações (serão lidas do $CONFIG)
USAR_CORES=0                      # config: UsarCores
COR_LETRA=                        # config: CorLetra
COR_FUNDO=                        # config: CorFundo
MENSAGEM='Mensagem padrão'        # config: Mensagem

# Carregando a configuração do arquivo externo
eval $(./parser.sh $CONFIG)

# Processando os valores
[ "$(echo $CONF_USARCORES | tr A-Z a-z)" = 'on' ] && USAR_CORES=1
COR_FUNDO=$(echo $CONF_CORFUNDO | tr -d -c 0-9) # só números
COR_LETRA=$(echo $CONF_CORLETRA | tr -d -c 0-9) # só números
[ "$CONF_MENSAGEM" ] && MENSAGEM=$CONF_MENSAGEM

# Configurações lidas, mostre a mensagem

if [ $USAR_CORES -eq 1 ]; then
	# Mostrar mensagem colorida
	# Exemplo: \033[40;32mOlá\033[m
	echo -e "\033[$COR_FUNDO;${COR_LETRA}m$MENSAGEM\033[m"
else
	# Não usar cores
	echo "$MENSAGEM"
fi
