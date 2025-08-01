#!/bin/bash

echo "🚀 Начинаем деплой v23.0..."

# Добавляем все изменения
git add .

# Коммитим изменения
git commit -m "v23.0: Переименован раздел в THREADS, добавлена функциональность подключения Threads API"

# Пушим в ветку gh-pages
git push origin gh-pages

echo "✅ Деплой завершен! Проверьте https://maximilianus.github.io/threads-mini-app/" 