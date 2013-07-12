# Capítulo 7 — Shell Script Profissional

## passwd

Este arquivo é uma cópia do arquivo `/etc/passwd` usado no livro, para que você possa fazer os mesmos comandos e obter os mesmos resultados.

Apenas troque `/etc/passwd` por somente `passwd`. Por exemplo, o primeiro
comando é:

    grep ^root /etc/passwd

Então você só precisa fazer:

    grep ^root passwd


## txt2regex

O txt2regex é o programa citado no final do capítulo e serve para fazer expressões regulares apenas respondendo perguntas. Aqui está seu código-fonte:

[https://github.com/aureliojargas/txt2regex/blob/master/txt2regex.sh]()

Para executá-lo em sua máquina, basta [baixá-lo deste endereço](https://raw.github.com/aureliojargas/txt2regex/master/txt2regex.sh) e executá-lo na linha de comando:

    bash ~/Downloads/txt2regex.sh

Você também pode estudar o seu código-fonte para aprender técnicas avançadas de shell, pois este programa é feito inteiramente com os comandos builtin do Bash.

Mas cuidado! Este código eu fiz antes de "ver a luz" do código limpo, então não o tome como exemplo. Nunca mais toquei nele desde 2004 e já não sei mais como ele funciona :)

Aliás, se você gostar do programa e quiser se aprofundar em shell, um bom projeto é limpar este código seguindo as recomendações do livro. Que tal? Como ele é usado mundialmente, faça tudo em inglês. Se você conseguir fazer isso sem quebrar o programa, ganha o posto de dono. Qualquer coisa me avise.

