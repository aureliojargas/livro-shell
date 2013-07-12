#!/bin/bash
# pulos.sh
#
# Desenha na tela o gráfico de exemplo dos pulos de cursor:
#
#    H
#    
#    F     A
#    G    D.C
#    E     B
#

# Explicação dos códigos está no capítulo Caracteres de Controle
echo -e '\033c\033[HH\033[4;7H.C\033[3DD\033[AA\033[GF\nG\nE\033[7GB'
