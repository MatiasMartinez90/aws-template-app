#!/bin/bash

# Script para empaquetar la Lambda function en Python
echo "📦 Empaquetando Lambda function en Python..."

# Limpiar archivos anteriores
rm -f postConfirmation.zip
rm -rf package/

# Crear directorio temporal
mkdir -p package

# Instalar dependencias de Python directamente
echo "🐍 Instalando dependencias de Python..."
pip3 install -r requirements.txt -t package/ --platform linux_x86_64 --only-binary=:all:

# Copiar código fuente
echo "📄 Copiando código fuente..."
cp postConfirmation.py package/

# Crear ZIP
echo "🗜️ Creando archivo ZIP..."
cd package
zip -r ../postConfirmation.zip .
cd ..

# Limpiar
rm -rf package/

echo "✅ Lambda function empaquetada en postConfirmation.zip"
echo "🚀 Listo para deployment!"