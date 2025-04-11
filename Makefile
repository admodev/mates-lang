.PHONY: all install run test bootstrap clean

all: install run

install:
	@echo "🔧 Instalando MATES en modo editable..."
	pip install -e . || pip3 install -e .
	@echo "✅ Instalación completada."

run:
	@echo "🚀 Ejecutando MATES..."
	mates-lang

test:
	@echo "🧪 Ejecutando tests..."
	@if command -v pytest >/dev/null 2>&1; then \
		pytest; \
	else \
		python -m unittest discover -s tests; \
	fi

bootstrap:
	@echo "🔁 Ejecutando bootstrap..."
	@bash bootstrap.sh

clean:
	@echo "🧹 Limpiando archivos compilados..."
	find . -type f -name '*.pyc' -delete
	find . -type d -name '__pycache__' -exec rm -r {} +
	rm -rf .venv

