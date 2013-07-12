#!/bin/bash
# cores.sh
# Mostra todas as combinações de cores do console

for letra in 0 1 2 3 4 5 6 7; do      # LINHAS: cores das letras
  for brilho in '' ';1'; do           # liga/desliga cor brilhante
    for fundo in 0 1 2 3 4 5 6 7; do  # COLUNAS: cores dos fundos
      seq="4$fundo;3$letra"           # compõe código de cores
      echo -e "\033[$seq${brilho}m\c" # liga a cor
      echo -e " $seq${brilho:-  } \c" # mostra o código na tela
      echo -e "\033[m\c"              # desliga a cor
    done; echo                        # quebra a linha
  done
done
