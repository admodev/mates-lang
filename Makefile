.PHONY: all install run

all: install run

install:
	@echo "Instalando MATES..."
	pip install -e . || pip3 install -e .
	@echo "MATES instalado exitosamente!"

run:
	mates-lang

