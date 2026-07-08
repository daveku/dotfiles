#!/usr/bin/env bash

set -euo pipefail

echo "========================================"
echo "☁️ Instalando Google Cloud CLI"
echo "========================================"

# Ya instalado
if command -v gcloud >/dev/null 2>&1; then
    echo "✅ Google Cloud CLI ya está instalado."
    exit 0
fi

# Dependencias
sudo apt-get update
sudo apt-get install -y \
    ca-certificates \
    curl \
    gnupg

# Crear directorio del keyring
sudo mkdir -p /usr/share/keyrings

# Agregar llave únicamente si no existe
if [ ! -f /usr/share/keyrings/cloud.google.gpg ]; then
    curl -fsSL https://packages.cloud.google.com/apt/doc/apt-key.gpg \
        | sudo gpg --dearmor \
            -o /usr/share/keyrings/cloud.google.gpg
fi

# Agregar repositorio únicamente si no existe
if [ ! -f /etc/apt/sources.list.d/google-cloud-sdk.list ]; then
    echo "deb [signed-by=/usr/share/keyrings/cloud.google.gpg] https://packages.cloud.google.com/apt cloud-sdk main" \
        | sudo tee /etc/apt/sources.list.d/google-cloud-sdk.list >/dev/null
fi

# Instalar
sudo apt-get update
sudo apt-get install -y google-cloud-cli

echo "✅ Google Cloud CLI instalado correctamente."

echo
echo "Para iniciar sesión ejecuta:"
echo "gcloud auth login"