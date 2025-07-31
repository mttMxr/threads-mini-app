#!/bin/bash

echo "🚀 Развертывание ThreadsZavod Mini App на GitHub Pages"

# Проверяем наличие git
if ! command -v git &> /dev/null; then
    echo "❌ Git не установлен"
    exit 1
fi

# Проверяем наличие gh (GitHub CLI)
if ! command -v gh &> /dev/null; then
    echo "⚠️ GitHub CLI не установлен. Установите его:"
    echo "brew install gh"
    echo ""
    echo "Или создайте репозиторий вручную:"
    echo "1. Зайдите на github.com"
    echo "2. Создайте новый репозиторий 'threads-mini-app'"
    echo "3. Сделайте его публичным"
    echo "4. Загрузите файлы index.html, README.md, INSTRUCTIONS.md"
    echo "5. Включите GitHub Pages в настройках"
    exit 1
fi

# Авторизация в GitHub
echo "🔐 Авторизация в GitHub..."
gh auth login --web

# Создание репозитория
echo "📦 Создание репозитория..."
gh repo create threads-mini-app --public --source=. --remote=origin --push

# Включение GitHub Pages
echo "🌐 Включение GitHub Pages..."
gh repo edit threads-mini-app --enable-pages --source=main

# Получение URL
echo "🔗 Получение URL..."
sleep 10
PAGES_URL=$(gh repo view threads-mini-app --json pages --jq '.pages[0].url')

echo "✅ Готово!"
echo "🌐 URL Mini App: $PAGES_URL"
echo ""
echo "📝 Обновите URL в боте:"
echo "Замените строку в Threads/main.py:"
echo "web_app_url = \"$PAGES_URL\"" 