#!/usr/bin/env bash
set -e
cd "$(dirname "$0")"

echo "Evaluating nixpkgs pin..."
nixpkgs_pin=$(nix eval --raw -f ../npins/default.nix nixpkgs)

#echo "Evaluating home-manager pin..."
#home_manager_pin=$(nix eval --raw -f npins/default.nix home-manager)

nix_path="nixpkgs=${nixpkgs_pin}:home-manager=${home_manager_pin}:nixos-config=/home/cam/Nix-config/configuration.nix"

echo "Rebuilding NixOS..."
sudo env NIX_PATH="${nix_path}" nixos-rebuild --no-reexec "${1:-switch}" "$@"

echo "Running format and clean..."
sudo ./format-and-clean.sh

echo "Rebuild completed."



##!/usr/bin/env bash
#cd "$(dirname "$0")"
#cmd="${1:-switch}"
#shift
##Build/switch/test your system using Nilla CLI
#sudo nilla os "$cmd" cam "$@"
## Clean and format, if needed
#sudo ./format-and-clean.sh

