#!/bin/bash
set -e

source ./utils.sh

create_namespace_if_missing "cert-manager"

helm upgrade --install cert-manager jetstack/cert-manager \
  --namespace cert-manager \
  --create-namespace \
  --values cert-manager/values.yaml

echo "Esperando a que cert-manager esté disponible..."
kubectl rollout status deployment/cert-manager -n cert-manager --timeout=120s

create_namespace_if_missing "ingress-nginx"

helm upgrade --install ingress-nginx ingress-nginx/ingress-nginx \
  --namespace ingress-nginx \
  --create-namespace \
  --values ingress-nginx/values.yaml
