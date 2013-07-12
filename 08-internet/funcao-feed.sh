# Função feed: Extrai as manchetes mais recentes de um Feed
# Passe o endereço do feed como argumento
# Exemplo: feed http://br-linux.org/feed/
#
feed() {
	lynx -source "$1" | grep '<title>' | tr -d \\t |
 		sed 's/ *<[^>]*>//g; s/&quot;/"/g; 1d'
}
