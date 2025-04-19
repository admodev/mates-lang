#!/usr/bin/env bash

set -e

echo "🚀 Iniciando bootstrap de entorno virtual para MATES..."

# Crear entorno virtual si no existe
if [ ! -d ".venv" ]; then
  echo "📦 Creando entorno virtual en .venv..."
  python3 -m venv .venv
else
  echo "✅ Entorno virtual ya existe."
fi

# Activar entorno virtual
source .venv/bin/activate
echo "🐍 Entorno virtual activado."

# Actualizar pip
echo "⬆️  Actualizando pip..."
pip install --upgrade pip

# Instalar MATES + herramientas de desarrollo
echo "📦 Instalando dependencias del proyecto en modo editable..."
pip install -e .[dev]

# Verificar herramientas instaladas
echo "🔍 Verificando herramientas de desarrollo..."
command -v black >/dev/null 2>&1 && echo "✔ black" || echo "❌ black no instalado"
command -v mypy >/dev/null 2>&1 && echo "✔ mypy" || echo "❌ mypy no instalado"
command -v pytest >/dev/null 2>&1 && echo "✔ pytest" || echo "❌ pytest no instalado"

echo "✅ Bootstrap finalizado. Usá 'source .venv/bin/activate' para comenzar a trabajar."

