#!/bin/bash

echo "🚀 Автоматический деплой ThreadsZavod Mini App"
echo "================================================"

# Проверяем наличие токена
if [ -z "$GITHUB_TOKEN" ]; then
    echo "❌ Не найден GITHUB_TOKEN"
    echo ""
    echo "📝 Инструкция для создания токена:"
    echo "1. Зайди на https://github.com/settings/tokens"
    echo "2. Нажми 'Generate new token (classic)'"
    echo "3. Выбери 'repo' права"
    echo "4. Скопируй токен"
    echo "5. Установи: export GITHUB_TOKEN=your_token"
    echo ""
    echo "🔗 Или создай репозиторий вручную:"
    echo "1. Зайди на github.com"
    echo "2. Создай репозиторий 'threads-mini-app'"
    echo "3. Загрузи файлы: index.html, README.md, INSTRUCTIONS.md"
    echo "4. Включи GitHub Pages"
    echo ""
    echo "📁 Готовые файлы в текущей папке:"
    ls -la *.html *.md
    exit 1
fi

echo "✅ Токен найден, создаем репозиторий..."

# Создаем репозиторий
RESPONSE=$(curl -s -H "Authorization: token $GITHUB_TOKEN" \
    -H "Accept: application/vnd.github.v3+json" \
    -d '{
        "name": "threads-mini-app",
        "description": "ThreadsZavod Mini App - Telegram Mini App для автоматизации публикаций",
        "private": false,
        "auto_init": true
    }' \
    https://api.github.com/user/repos)

# Проверяем ответ
if echo "$RESPONSE" | grep -q '"html_url"'; then
    REPO_URL=$(echo "$RESPONSE" | grep '"html_url"' | cut -d'"' -f4)
    echo "✅ Репозиторий создан: $REPO_URL"
else
    echo "❌ Ошибка создания репозитория:"
    echo "$RESPONSE"
    exit 1
fi

# Добавляем удаленный репозиторий
git remote add origin https://github.com/mttMxr/threads-mini-app.git

# Пушим файлы
echo "📤 Загружаем файлы..."
git push -u origin main

# Включаем GitHub Pages
echo "🌐 Включаем GitHub Pages..."
sleep 5

PAGES_RESPONSE=$(curl -s -H "Authorization: token $GITHUB_TOKEN" \
    -H "Accept: application/vnd.github.v3+json" \
    -d '{
        "source": {
            "branch": "main",
            "path": "/"
        }
    }' \
    https://api.github.com/repos/mttMxr/threads-mini-app/pages)

if echo "$PAGES_RESPONSE" | grep -q '"url"'; then
    PAGES_URL=$(echo "$PAGES_RESPONSE" | grep '"url"' | cut -d'"' -f4)
    echo "✅ GitHub Pages включен: $PAGES_URL"
else
    echo "⚠️ GitHub Pages может быть уже включен"
    PAGES_URL="https://mttMxr.github.io/threads-mini-app"
fi

echo ""
echo "🎉 РАЗВЕРТЫВАНИЕ ЗАВЕРШЕНО!"
echo "================================================"
echo "🌐 URL Mini App: $PAGES_URL"
echo ""
echo "📝 Обновите URL в боте:"
echo "Замените строку в Threads/main.py:"
echo "web_app_url = \"$PAGES_URL\""
echo ""
echo "🎯 Mini App готов к использованию!" 