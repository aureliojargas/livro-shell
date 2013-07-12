#!/bin/bash
# teste_html_2.sh

echo Content-type: text/html
echo

echo "<h1>Testando... 1, 2, 3</h1>"

hora_atual=$(date +%X)
x=2
y=3

echo "<P>Agora são $hora_atual</P>"
echo "Se eu somar <U>$x</U> com <U>$y</U>, fico com <U>$((x+y))</U>."
