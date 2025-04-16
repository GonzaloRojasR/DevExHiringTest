#!/bin/bash
set -e

source ./utils.sh

create_namespace_if_missing "cert-manager"
kubectl apply -f cluster-issuer.yaml

helm upgrade --install cert-manager jetstack/cert-manager \
  --namespace cert-manager \
  --create-namespace \
  --values cert-manager/values.yaml

create_namespace_if_missing "ingress-nginx"

helm upgrade --install ingress-nginx ingress-nginx/ingress-nginx \
  --namespace ingress-nginx \
  --create-namespace \
  --values ingress-nginx/values.yaml
