#!/bin/bash

# Verifica se o diretório é um repositório Git
if git rev-parse --is-inside-work-tree > /dev/null 2>&1; then
    echo "Este é um repositório Git."
else
    echo "Este diretório não é um repositório Git. Saindo..."
    code .
fi

# Apanha o nome da branch atual
branch=$(git rev-parse --abbrev-ref HEAD)

# Comando para fazer o pull da branch atual
git pull origin "$branch"

# Comando que ativa o ambiente virtual, se existir
if [ -d ".venv" ]; then
    echo "Ativando o ambiente virtual..."
    source .venv/bin/activate
else
    echo "O ambiente virtual (.venv) não foi encontrado."
fi

v .
