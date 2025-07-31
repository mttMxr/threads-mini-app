# 🚀 Быстрая загрузка Mini App на GitHub Pages

## Шаг 1: Создай репозиторий на GitHub
1. Зайди на [github.com](https://github.com)
2. Нажми зеленую кнопку "New repository"
3. Назови репозиторий: `threads-mini-app`
4. **ВАЖНО**: Сделай его **Public** (иначе GitHub Pages не заработает)
5. Нажми "Create repository"

## Шаг 2: Загрузи файл
1. В новом репозитории нажми "uploading an existing file"
2. Перетащи файл `index.html` в область загрузки
3. Нажми "Commit changes"

## Шаг 3: Включи GitHub Pages
1. Перейди в "Settings" (вкладка сверху)
2. Прокрути вниз до раздела "Pages"
3. В "Source" выбери "Deploy from a branch"
4. В "Branch" выбери "main"
5. Нажми "Save"

## Шаг 4: Получи URL
Через 2-3 минуты получишь URL вида:
`https://username.github.io/threads-mini-app`

## Шаг 5: Обнови бота
Замени URL в файле `Threads/main.py` на строке 784:
```python
web_app_url = "https://username.github.io/threads-mini-app"
```

## Шаг 6: Настрой BotFather
1. Отправь `/mybots` в BotFather
2. Выбери своего бота
3. Нажми "Menu Button"
4. Отправь URL Mini App

## ✅ Готово!
Теперь Mini App будет работать в Telegram с красивым дизайном как у BotFather! 