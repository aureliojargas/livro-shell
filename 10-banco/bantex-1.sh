# bantex.sh - Gerenciador do Banco Textual
#
# Biblioteca de funções para gerenciar os dados do banco textual.
# Use o comando "source" para inclui-la em seu script.
#
# 2006-10-31 Fulano da Silva
#

#--------------------------------[ configuração ]-----------------------------

SEP=:                     # defina aqui o separador, padrão é :
TEMP=temp.$$              # arquivo temporário


#----------------------------------[ funções ]--------------------------------

# O arquivo texto com o banco já deve estar definido
[ "$BANCO" ] || {
	echo "Base de dados não informada. Use a variável BANCO."
	return 1
}

# Apaga o registro da chave $1 do banco
apaga_registro() {
	grep -i -v "^$1$SEP" "$BANCO" > "$TEMP"      # apaga a chave
	mv "$TEMP" "$BANCO"                          # regrava o banco
}

# Insere o registro $* no banco
insere_registro() {
	echo "$*" >> "$BANCO"                        # grava o registro
}
