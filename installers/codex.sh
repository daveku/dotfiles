#!/usr/bin/env bash

set -euo pipefail

echo "========================================"
echo "🤖 Instalando Codex CLI"
echo "========================================"

# Ya instalado
if command -v codex >/dev/null 2>&1; then
    echo "✅ Codex CLI ya está instalado."
    codex --version || true
    exit 0
fi

# Dependencias mínimas
sudo apt-get update
sudo apt-get install -y \
    curl \
    ca-certificates

# Instalar Codex CLI
curl -fsSL https://chatgpt.com/codex/install.sh | sh

# Verificación
if command -v codex >/dev/null 2>&1; then
    echo "✅ Codex CLI instalado correctamente."
    codex --version || true
else
    echo "❌ Codex CLI no quedó disponible en PATH."
    echo "Reinicia la terminal o revisa el PATH."
    exit 1
fi

echo
echo "Autenticación:"
echo "- Recomendado en Codespaces: configura OPENAI_API_KEY como Codespaces Secret."
echo "- Alternativa: ejecuta 'codex' e inicia sesión manualmente."