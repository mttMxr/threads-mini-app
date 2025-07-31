# 🚀 Быстрый деплой Mini App

## Шаг 1: Создай репозиторий на GitHub
1. Зайди на [github.com](https://github.com)
2. Нажми зеленую кнопку "New repository"
3. Назови: `threads-mini-app`
4. Сделай **Public** (важно!)
5. Нажми "Create repository"

## Шаг 2: Загрузи файлы
В новом репозитории:
1. Нажми "uploading an existing file"
2. Перетащи эти файлы:
   - `index.html` (основной файл)
   - `README.md` (описание)
   - `INSTRUCTIONS.md` (инструкции)

## Шаг 3: Включи GitHub Pages
1. Перейди в "Settings" (вкладка сверху)
2. Прокрути вниз до "Pages"
3. В "Source" выбери "Deploy from a branch"
4. В "Branch" выбери "main"
5. Нажми "Save"

## Шаг 4: Получи URL
Через 2-3 минуты получишь:
`https://username.github.io/threads-mini-app`

## Шаг 5: Обнови бота
Замени URL в `Threads/main.py`:
```python
web_app_url = "https://username.github.io/threads-mini-app"
```

## ✅ Готово!
Mini App будет работать в Telegram! 