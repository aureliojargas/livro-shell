#!/bin/bash

CD="/Applications/CocoaDialog.app/Contents/MacOS/CocoaDialog"

resposta=$($CD ok-msgbox \
	--text "Título da janela" \
	--informative-text "Texto de dentro da janela" \
	--no-newline --float)

case "$resposta" in
	1) echo "O usuário apertou o botão OK";;
	2) echo "O usuário apertou o botão Cancel";;
esac
