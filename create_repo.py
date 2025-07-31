#!/usr/bin/env python3
import requests
import json
import os
import subprocess
import time

def create_github_repo():
    """Создает репозиторий на GitHub через API"""
    
    print("🚀 Создание репозитория на GitHub...")
    
    # Проверяем наличие токена
    token = os.getenv('GITHUB_TOKEN')
    if not token:
        print("❌ Не найден GITHUB_TOKEN")
        print("Создайте токен на https://github.com/settings/tokens")
        print("И установите переменную: export GITHUB_TOKEN=your_token")
        return None
    
    # Данные репозитория
    repo_data = {
        "name": "threads-mini-app",
        "description": "ThreadsZavod Mini App - Telegram Mini App для автоматизации публикаций",
        "private": False,
        "auto_init": True,
        "gitignore_template": "Node",
        "license_template": "mit"
    }
    
    # Создаем репозиторий
    headers = {
        "Authorization": f"token {token}",
        "Accept": "application/vnd.github.v3+json"
    }
    
    response = requests.post(
        "https://api.github.com/user/repos",
        headers=headers,
        data=json.dumps(repo_data)
    )
    
    if response.status_code == 201:
        repo_info = response.json()
        repo_url = repo_info['html_url']
        print(f"✅ Репозиторий создан: {repo_url}")
        return repo_url
    else:
        print(f"❌ Ошибка создания репозитория: {response.status_code}")
        print(response.text)
        return None

def push_files():
    """Загружает файлы в репозиторий"""
    print("📤 Загрузка файлов...")
    
    # Добавляем удаленный репозиторий
    subprocess.run(["git", "remote", "add", "origin", "https://github.com/maximilianus/threads-mini-app.git"])
    
    # Пушим файлы
    subprocess.run(["git", "push", "-u", "origin", "main"])
    
    print("✅ Файлы загружены")

def enable_pages():
    """Включает GitHub Pages"""
    print("🌐 Включение GitHub Pages...")
    
    # Ждем немного для активации
    time.sleep(5)
    
    pages_data = {
        "source": {
            "branch": "main",
            "path": "/"
        }
    }
    
    token = os.getenv('GITHUB_TOKEN')
    headers = {
        "Authorization": f"token {token}",
        "Accept": "application/vnd.github.v3+json"
    }
    
    response = requests.post(
        "https://api.github.com/repos/maximilianus/threads-mini-app/pages",
        headers=headers,
        data=json.dumps(pages_data)
    )
    
    if response.status_code in [201, 409]:  # 409 если уже включено
        print("✅ GitHub Pages включен")
        return "https://maximilianus.github.io/threads-mini-app"
    else:
        print(f"⚠️ Ошибка включения Pages: {response.status_code}")
        return "https://maximilianus.github.io/threads-mini-app"

def main():
    print("🎯 Развертывание ThreadsZavod Mini App")
    print("=" * 50)
    
    # Создаем репозиторий
    repo_url = create_github_repo()
    if not repo_url:
        return
    
    # Загружаем файлы
    push_files()
    
    # Включаем Pages
    pages_url = enable_pages()
    
    print("\n" + "=" * 50)
    print("✅ РАЗВЕРТЫВАНИЕ ЗАВЕРШЕНО!")
    print(f"🌐 URL Mini App: {pages_url}")
    print("\n📝 Обновите URL в боте:")
    print(f"Замените строку в Threads/main.py:")
    print(f'web_app_url = "{pages_url}"')
    print("\n🎉 Mini App готов к использованию!")

if __name__ == "__main__":
    main() 