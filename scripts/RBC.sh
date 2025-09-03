#!/usr/bin/env bash
set -e
cd "$(dirname "$0")"

echo "Updating pins with npins..."
# Run npins update and upgrade before rebuild
cd /home/cam/Nix-config/ && npins update && npins upgrade


echo "Evaluating nixpkgs pin..."
nixpkgs_pin=$(nix eval --raw -f ./npins/default.nix nixpkgs)

echo "Evaluating home-manager pin..."
home_manager_pin=$(nix eval --raw -f ./npins/default.nix home-manager)

nix_path="nixpkgs=${nixpkgs_pin}:home-manager=${home_manager_pin}:nixos-config=/home/cam/Nix-config/configuration.nix"

echo "Rebuilding NixOS..."
sudo env NIX_PATH="${nix_path}" nixos-rebuild --no-reexec "${1:-switch}" "$@"

echo "Running nix-health to verify Nix system health..."
# Run nix-health, assuming it is installed or available via nix run
if command -v nix-health &>/dev/null; then
  nix-health
else
  echo "nix-health not found, running via nix run..."
  nix run github:juspay/nix-health
fi

echo "Rebuild complete."