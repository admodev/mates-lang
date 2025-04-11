#!/bin/bash

echo "🚀 Iniciando bootstrap del proyecto MATES..."

if ! command -v python3 &>/dev/null; then
    echo "❌ Python3 no está instalado. Abortando."
    exit 1
fi

if [ ! -d ".venv" ]; then
    echo "🧪 Creando entorno virtual..."
    python3 -m venv .venv
else
    echo "🔁 Entorno virtual ya existe"
fi

source .venv/bin/activate || source .venv/Scripts/activate

echo "⬆️  Actualizando pip..."
pip install --upgrade pip

echo "📦 Instalando proyecto en modo editable..."
pip install -e .

if grep -q "import pytest" src/**/*.py 2>/dev/null || test -f "pytest.ini"; then
    echo "🧪 Instalando pytest..."
    pip install pytest
elif grep -q "import unittest" src/**/*.py 2>/dev/null; then
    echo "🧪 unittest detectado (incluido en stdlib)"
fi

echo "✅ Corriendo tests..."
if command -v pytest &>/dev/null; then
    pytest
else
    echo "⚠️  No se detectó pytest, asegurate de correr 'python -m unittest discover -s src'"
fi

echo "🎉 Bootstrap completo. ¡Estás listo para desarrollar!"

