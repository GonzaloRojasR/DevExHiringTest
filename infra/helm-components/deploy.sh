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

# ClusterIssuer autofirmado
if ! kubectl get clusterissuer selfsigned-cluster-issuer >/dev/null 2>&1; then
  echo "Creando ClusterIssuer autofirmado..."
  kubectl apply -f selfsigned-cluster-issuer.yaml
else
  echo "ClusterIssuer 'selfsigned-cluster-issuer' ya existe."
fi

create_namespace_if_missing "ingress-nginx"

helm upgrade --install ingress-nginx ingress-nginx/ingress-nginx \
  --namespace ingress-nginx \
  --create-namespace \
  --values ingress-nginx/values.yaml

# Certificate para desafio.local
if ! kubectl get certificate desafio-app-cert -n ingress-nginx >/dev/null 2>&1; then
  echo "Creando Certificate desafio-app-cert..."
  kubectl apply -f desafio-app-certificate.yaml
else
  echo "Certificate 'desafio-app-cert' ya existe en namespace ingress-nginx."
fi

create_namespace_if_missing "amazon-cloudwatch"
helm repo add aws-observability https://aws.github.io/eks-charts
helm repo update
helm upgrade --install cloudwatch-agent aws-observability/aws-cloudwatch-metrics \
  --namespace amazon-cloudwatch \
  --create-namespace \
  --values cloudwatch/values.yaml