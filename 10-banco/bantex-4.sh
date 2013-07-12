# bantex.sh - Gerenciador do Banco Textual
#
# Biblioteca de funções para gerenciar os dados do banco textual.
# Use o comando "source" para inclui-la em seu script.
#
# 2006-10-31 v1 Fulano da Silva: Versão inicial
# 2006-10-31 v2 Fulano da Silva:
#   - Adicionada função tem_chave()
#   - Inserção e exclusão agora checam antes a existência da chave
#   - Adicionadas mensagens informativas na inserção e exclusão
# 2006-10-31 v3 Fulano da Silva:
#   - Adicionadas funções campos() e mostra_registro()
# 2006-10-31 v4 Fulano da Silva:
#   - Adicionada verificação de permissões do arquivo do banco
#   - Adicionada função pega_campo()
#   - Adicionadas funções mascara() e desmascara() e $MASCARA
#

#--------------------------------[ configuração ]-----------------------------

SEP=:                     # defina aqui o separador, padrão é :
TEMP=temp.$$              # arquivo temporário
MASCARA=§                 # caractere exótico para mascarar o separador


#----------------------------------[ funções ]--------------------------------

# O arquivo texto com o banco já deve estar definido
[ "$BANCO" ] || {
	echo "Base de dados não informada. Use a variável BANCO."
	return 1
}

# O arquivo deve poder ser lido e gravado
[ -r "$BANCO" -a -w "$BANCO" ] || {
	echo "Base travada, confira as permissões de leitura e escrita."
	return 1
}

# Esconde/revela o caractere separador quando ele for literal
mascara()    { tr $SEP $MASCARA ; }   # exemplo: tr : §
desmascara() { tr $MASCARA $SEP ; }   # exemplo: tr § :

# Verifica se a chave $1 está no banco
tem_chave() {
	grep -i -q "^$1$SEP" "$BANCO"
}

# Apaga o registro da chave $1 do banco
apaga_registro() {
	tem_chave "$1" || return                     # se não tem, nem tente
	grep -i -v "^$1$SEP" "$BANCO" > "$TEMP"      # apaga a chave
	mv "$TEMP" "$BANCO"                          # regrava o banco
	echo "O registro '$1' foi apagado"
}

# Insere o registro $* no banco
insere_registro() {
	local chave=$(echo "$1" | cut -d $SEP -f1)   # pega primeiro campo

	if tem_chave "$chave"; then
		echo "A chave '$chave' já está cadastrada no banco."
		return 1
	else                                         # chave nova
		echo "$*" >> "$BANCO"                     # grava o registro
		echo "Registro de '$chave' cadastrado com sucesso."
	fi
	return 0
}

# Mostra o valor do campo número $1 do registro de chave $2 (opcional)
pega_campo() {
	local chave=${2:-.*}
	grep -i "^$chave$SEP" "$BANCO" | cut -d $SEP -f $1 | desmascara
}

# Mostra os nomes dos campos do banco, um por linha
campos() {
	head -n 1 "$BANCO" | tr $SEP \\n
}

# Mostra os dados do registro da chave $1
mostra_registro() {
	local dados=$(grep -i "^$1$SEP" "$BANCO")
	local i=0
	[ "$dados" ] || return                       # não achei
	campos | while read campo; do                # para cada campo...
		i=$((i+1))                                # índice do campo
		echo -n "$campo: "                        # nome do campo
		echo "$dados" | cut -d $SEP -f $i | desmascara # conteúdo do campo
	done
}
