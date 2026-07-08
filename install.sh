#!/usr/bin/env bash

set -euo pipefail

DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cd "$DOTFILES_DIR"

echo "========================================"
echo "🚀 Configurando entorno de desarrollo"
echo "========================================"

chmod +x "$DOTFILES_DIR/bootstrap.sh"
chmod +x "$DOTFILES_DIR/installers/"*.sh

"$DOTFILES_DIR/bootstrap.sh"

for installer in "$DOTFILES_DIR"/installers/*.sh; do
    echo "▶ Ejecutando $(basename "$installer")..."
    "$installer"
done

ln -sf "$DOTFILES_DIR/git/.gitconfig" "$HOME/.gitconfig"
ln -sf "$DOTFILES_DIR/shell/.zshrc" "$HOME/.zshrc"

echo
echo "========================================"
echo "✅ Entorno configurado correctamente"
echo "========================================"
echo
echo "Reinicia la terminal o ejecuta:"
echo "source ~/.zshrc"