install:  # сборка проекта
	uv sync

dev: 
	uv run flask --debug --app page_analyzer:app run

lint:  # тесты
	uv run ruff check .

PORT ?= 8000
start:  # запуск в продакшене
	uv run gunicorn -w 5 -b 0.0.0.0:$(PORT) page_analyzer:app

build:
	./build.sh

render-start:
	gunicorn -w 5 -b 0.0.0.0:$(PORT) page_analyzer:app