#!/usr/bin/env bash

set -euo pipefail

DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cd "$DOTFILES_DIR"

echo "========================================"
echo "🚀 Configurando entorno de desarrollo"
echo "========================================"

chmod +x "$DOTFILES_DIR/bootstrap.sh"
chmod +x "$DOTFILES_DIR/installers/gcloud.sh"
chmod +x "$DOTFILES_DIR/installers/codex.sh"

"$DOTFILES_DIR/bootstrap.sh"
"$DOTFILES_DIR/installers/gcloud.sh"
"$DOTFILES_DIR/installers/codex.sh"

ln -sf "$DOTFILES_DIR/git/gitconfig" "$HOME/.gitconfig"
ln -sf "$DOTFILES_DIR/shell/zshrc" "$HOME/.zshrc"

echo "========================================"
echo "✅ Entorno configurado correctamente"
echo "========================================"
echo "Ejecuta: source ~/.zshrc"