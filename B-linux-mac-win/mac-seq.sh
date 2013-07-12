# Implementação do comando seq no Mac OS X
seq ()
{
	local inicio=1 fim=1 passo=1 sep
	
	# Foi passado algum separador? -s
	if test "$1" = "-s"
	then
		sep="$2"
		shift 2
	fi
	
	# Guarde os números da seqüência
	test $# -eq 1 && fim=$1
	test $# -eq 2 && inicio=$1 fim=$2
	test $# -eq 3 && inicio=$1 passo=$2 fim=$3
	
	# Mostre a seqüência
	if test "$sep"
	then
		jot -s $sep - $inicio $fim $passo
	else
		jot - $inicio $fim $passo
	fi
}
