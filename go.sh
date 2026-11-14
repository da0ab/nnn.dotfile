#!/bin/bash

USERNAME="da0ab"

# ===== Текущая папка = проект =====
PROJECT_NAME="$(basename "$(pwd)")"

# ===== Токен лежит на уровень выше =====
TOKEN_FILE="../.git_token"

if [ ! -f "$TOKEN_FILE" ]; then
  echo "Ошибка: файл с токеном не найден: $(cd .. && pwd)/.git_token"
  exit 1
fi

TOKEN="$(tr -d '[:space:]' < "$TOKEN_FILE")"

if [ -z "$TOKEN" ]; then
  echo "Ошибка: файл с токеном пустой: $TOKEN_FILE"
  exit 1
fi

REPO_URL="github.com/$USERNAME/$PROJECT_NAME"

echo "Проект:      $PROJECT_NAME"
echo "Репозиторий: $REPO_URL"
echo

# ===== Git операции =====

git pull "https://$USERNAME:$TOKEN@$REPO_URL" main || {
  echo "Предупреждение: git pull завершился с ошибкой (репозиторий пуст или ветки нет)."
}

git add .

if git diff --cached --quiet; then
  echo "Нет изменений для коммита."
else
  git commit -m "Обновление проекта"
fi

git push "https://$USERNAME:$TOKEN@$REPO_URL" main
