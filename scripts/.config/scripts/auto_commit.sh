#!/bin/bash

# Verifica se uma mensagem de commit foi fornecida como argumento
# nao sei o que fazer agora
if [ -n "$1" ]; then
  COMMIT_MESSAGE="$*"
else
  # Define a mensagem padrão de commit com a data e hora atual
  COMMIT_MESSAGE="Auto-commit: $(date '+%Y-%m-%d %H:%M:%S')"
fi

# Navega até o diretório do repositório (caso não esteja no diretório correto)
# cd /caminho/para/seu/repositorio

# Adiciona todos os arquivos ao stage do Git
git add .

# Realiza o commit com a mensagem gerada
git commit -m "$COMMIT_MESSAGE"

# Envia as alterações para o repositório remoto
git push -u origin main
