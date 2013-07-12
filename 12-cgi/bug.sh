#!/bin/bash
# bug.sh

# Vamos mostrar texto
echo Content-type: text/plain
echo

# Conecta a STDERR com a STDOUT
exec 2>&1

# Ops!
mv
