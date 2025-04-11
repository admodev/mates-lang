@echo off
echo Instalando MATES para Windows...
pip install -e .
if %errorlevel% neq 0 (
    echo ❌ Error en la instalación
    exit /b 1
)
echo ✅ Instalación completada con éxito

