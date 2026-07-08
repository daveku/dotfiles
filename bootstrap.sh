#!/usr/bin/env bash

set -euo pipefail

echo "========================================"
echo "🚀 Bootstrap del sistema"
echo "========================================"

sudo apt-get update

sudo apt-get install -y \
    curl \
    wget \
    git \
    unzip \
    zip \
    jq \
    zsh \
    ca-certificates \
    gnupg \
    software-properties-common \
    apt-transport-https \
    build-essential