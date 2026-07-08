#!/usr/bin/env bash

set -euo pipefail

if command -v gcloud >/dev/null 2>&1; then
    echo "Google Cloud CLI ya instalado."
    exit 0
fi

curl -fsSL https://packages.cloud.google.com/apt/doc/apt-key.gpg \
| sudo gpg --dearmor -o /usr/share/keyrings/cloud.google.gpg

echo "deb [signed-by=/usr/share/keyrings/cloud.google.gpg] https://packages.cloud.google.com/apt cloud-sdk main" \
| sudo tee /etc/apt/sources.list.d/google-cloud-sdk.list >/dev/null

sudo apt-get update

sudo apt-get install -y google-cloud-cli