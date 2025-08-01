#!/usr/bin/env python3
import subprocess
import os
import sys

def run_command(command):
    """Выполняет команду и возвращает результат"""
    try:
        result = subprocess.run(command, shell=True, capture_output=True, text=True)
        if result.returncode == 0:
            print(f"✅ {command}")
            if result.stdout:
                print(result.stdout)
        else:
            print(f"❌ {command}")
            if result.stderr:
                print(result.stderr)
        return result.returncode == 0
    except Exception as e:
        print(f"❌ Ошибка выполнения команды '{command}': {e}")
        return False

def main():
    print("🚀 Начинаем деплой v23.0...")
    
    # Проверяем, что мы в правильной директории
    if not os.path.exists('index.html'):
        print("❌ Файл index.html не найден. Убедитесь, что вы в директории threads-mini-app")
        return
    
    # Добавляем все изменения
    if not run_command("git add ."):
        print("❌ Ошибка при добавлении файлов")
        return
    
    # Коммитим изменения
    if not run_command('git commit -m "v23.0: Переименован раздел в THREADS, добавлена функциональность подключения Threads API"'):
        print("❌ Ошибка при коммите")
        return
    
    # Пушим в ветку gh-pages
    if not run_command("git push origin gh-pages"):
        print("❌ Ошибка при пуше")
        return
    
    print("✅ Деплой завершен!")
    print("🌐 Проверьте: https://maximilianus.github.io/threads-mini-app/")
    print("📱 Обновленная версия v23.0 с разделом THREADS и функциональностью подключения API")

if __name__ == "__main__":
    main() 