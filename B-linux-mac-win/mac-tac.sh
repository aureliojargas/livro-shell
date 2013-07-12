# Implementação do comando tac no Mac OS X
tac ()
{
	sed '1!G;h;$!d'
}
