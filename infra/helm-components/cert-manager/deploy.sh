#!/bin/bash
set -e

SCRIPT_DIR=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" &> /dev/null && pwd)
source "$SCRIPT_DIR/../scripts/utils.sh"

helm repo add jetstack https://charts.jetstack.io
helm repo update

install_or_upgrade "cert-manager" "jetstack/cert-manager" "cert-manager" "$SCRIPT_DIR/values.yaml"