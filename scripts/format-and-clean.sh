#!/usr/bin/env bash
#format-and-clean.sh
set -euo pipefail

# Updated config path
NIX_CONFIG_PATH="/home/cam/Nix-config"

echo "Running deadnix..."
deadnix -e -q -l -L -_ -h "${NIX_CONFIG_PATH}" || true

echo "Running statix..."
statix fix "${NIX_CONFIG_PATH}" || true

echo "Running alejandra..."
alejandra "${NIX_CONFIG_PATH}"
