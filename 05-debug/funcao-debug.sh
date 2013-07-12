Debug(){

	[ $1 -le $DEBUG ] || return

	local prefixo
	case "$1" in
		1) prefixo="-- ";;
		2) prefixo="---- ";;
		3) prefixo="------ ";;
		*) echo "Mensagem não categorizada: $*"; return;;
	esac
	shift

	echo $prefixo$*
}
