#!/bin/bash
# caixa.sh
# Encaixota um texto qualquer vindo da STDIN
#
# Usando caracteres de controle, primeiro desenha uma caixa:
#             +----------+
#             |          |
#             |          |
#             +----------+
#
# Depois coloca o texto recebido via STDIN dentro dessa caixa:
#             +----------+
#             | O texto  |
#             | recebido |
#             +----------+
#
# A separação do código em dois passos permite personalizar
# separadamente a caixa e o texto, podendo-se facilmente
# adicionar cores ou fazer outras formatações.
#


# Configuração do usuário
caixa_largura=60
caixa_coluna_inicio=5
caixa_linha_inicio=5
texto_max_linhas=20
distancia_borda_texto=1
caixa_cor='33;1'
texto_cor='32'
#caixa_cor='33;43'      # descomente essa linha para uma surpresa!

#---------------------------------------------------------------------
# Daqui para baixo não mexa

### Configuração Dinâmica
caixa_coluna_fim=$((   caixa_coluna_inicio+caixa_largura-1))
texto_coluna_inicio=$((caixa_coluna_inicio+distancia_borda_texto+1))
texto_largura=$((      caixa_largura-distancia_borda_texto))
texto=$(               fmt -sw $texto_largura)
num_linhas=$(          echo "$texto" | wc -l)
total_linhas=$((       num_linhas+2))    # texto + bordas horizontais

### Checagem do tamanho do texto
if [ $num_linhas -gt $texto_max_linhas ];then
	echo "Texto muito extenso, não vai caber na tela"
	exit 1
fi

### Compõe a linha horizontal da caixa
# É $caixa_largura-2 porque os "cantos" serão feitos com o +
for i in $(seq $((caixa_largura-2))); do
	linha_caixa="$linha_caixa-"
done

### Limpa a tela
echo -ne '\033c'

### Desenha a caixa
echo -ne "\033[$caixa_linha_inicio;0H"       # pula p/a linha inicial
echo -ne "\033[${caixa_cor}m"                # liga a cor da caixa
for i in $(seq $total_linhas); do            # para cada linha...
	echo -ne "\033[${caixa_coluna_inicio}G"       # vai p/coluna inicial
	if [ $i -eq 1 -o $i -eq $total_linhas ]; then # 1a ou última linha
		echo +$linha_caixa+                   # borda horizontal
	else                                          # senão
		echo -e "|\033[${caixa_coluna_fim}G|" # bordas verticais
	fi
done
echo -e '\033[m'                             # desliga as cores

### Coloca o texto dentro da caixa
echo -ne "\033[$((caixa_linha_inicio+1));0H" # pula p/a linha inicial
echo -ne "\033[${texto_cor}m"                # liga a cor do texto
echo "$texto" | while read LINHA; do         # para cada linha...
	echo -e "\033[${texto_coluna_inicio}G$LINHA"  # posiciona e mostra
done
echo -e '\033[m'                             # desliga as cores
echo
