#!/bin/bash
set -e

SCRIPT_DIR=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" &> /dev/null && pwd)
source "$SCRIPT_DIR/../scripts/utils.sh"

helm repo add ingress-nginx https://kubernetes.github.io/ingress-nginx
helm repo update

install_or_upgrade "ingress-nginx" "ingress-nginx/ingress-nginx" "ingress-nginx" "$SCRIPT_DIR/values.yaml"
