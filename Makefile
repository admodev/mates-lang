.PHONY: all install run

all: install run

install:
	@echo "Instalando MATES..."
	@python3 -m pip install -e . || pip install -e .
	@echo "MATES instalado exitosamente!"

run:
	@echo "Ejecutando MATES..."
	mates-lang

