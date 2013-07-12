USAR_CORES=1         # Chave para usar cores (0 desliga, 1 liga)

# ...

# O terminal VT100 não sabe nada de cores
if test "$TERM" = "vt100"
then
	USAR_CORES=0
fi

# ...

if test $USAR_CORES -eq 1
then
	msg_colorida $mensagem    # chama a função "msg_colorida"
else
	echo $mensagem            # usa o echo normal
fi
