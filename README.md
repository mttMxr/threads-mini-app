# ThreadsZavod Mini App

Красивая Telegram Mini App для автоматизации публикаций в Threads.

## 🚀 Быстрая загрузка на GitHub Pages

### Шаг 1: Создай репозиторий
1. Зайди на [github.com](https://github.com)
2. Нажми "New repository"
3. Назови репозиторий: `threads-mini-app`
4. Сделай его **Public** (важно!)
5. Нажми "Create repository"

### Шаг 2: Загрузи файлы
1. Скопируй файл `index.html` в корень репозитория
2. Нажми "Commit changes"

### Шаг 3: Включи GitHub Pages
1. Перейди в "Settings" репозитория
2. Прокрути вниз до "Pages"
3. В "Source" выбери "Deploy from a branch"
4. В "Branch" выбери "main"
5. Нажми "Save"

### Шаг 4: Получи URL
Через 2-3 минуты получишь URL вида:
`https://username.github.io/threads-mini-app`

## 🔧 Настройка бота

После получения URL:

1. Обнови URL в файле `Threads/main.py`:
```python
web_app_url = "https://username.github.io/threads-mini-app"
```

2. Настрой в BotFather:
   - Отправь `/mybots` в BotFather
   - Выбери своего бота
   - Нажми "Menu Button"
   - Отправь URL Mini App

## ✨ Особенности

- 🎨 Красивый дизайн как у BotFather
- 📱 Адаптивный интерфейс
- 🔄 Анимации и переходы
- 🎯 Пошаговая настройка
- 📊 Статистика и аналитика

## 🛠 Технологии

- HTML5 + CSS3
- JavaScript ES6+
- Telegram Web App API
- CSS Grid & Flexbox
- CSS Variables для тем Telegram 