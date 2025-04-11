#!/bin/bash

echo "Instalando MATES para Linux/macOS..."
python3 -m pip install --user -e . || pip install --user -e .
echo "✅ Instalación completada con éxito"

