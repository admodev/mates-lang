.PHONY: all install run check_venv bootstrap

VENV := .venv
ACTIVATE := source $(VENV)/bin/activate

# Verifica si estamos en un entorno virtual
check_venv:
	@if [ -z "$$VIRTUAL_ENV" ]; then \
		echo "🔍 No estás en un entorno virtual. Ejecutando bootstrap..."; \
		./bootstrap.sh; \
	else \
		echo "✅ Entorno virtual detectado: $$VIRTUAL_ENV"; \
	fi

# Bootstrap manual si se quiere correr aislado
bootstrap:
	@echo "🏗 Ejecutando bootstrap manual..."
	./bootstrap.sh

# Comando principal
all: check_venv install run

# Instalación en modo editable
install:
	@echo "📦 Instalando MATES..."
	$(ACTIVATE) && pip install -e .[dev]
	@echo "✅ Instalación completa."

# Ejecutar el programa
run:
	@echo "🏃 Ejecutando MATES..."
	$(ACTIVATE) && mates-lang

