#!/bin/bash

function helm_component_exists() {
  helm status "$1" -n "$2" >/dev/null 2>&1
}

function install_or_upgrade() {
  local release="$1"
  local chart="$2"
  local namespace="$3"
  local values_file="$4"

  if helm_component_exists "$release" "$namespace"; then
    echo "[INFO] $release ya está instalado, ejecutando helm upgrade..."
    helm upgrade "$release" "$chart" -n "$namespace" -f "$values_file"
  else
    echo "[INFO] Instalando $release por primera vez..."
    kubectl create namespace "$namespace" --dry-run=client -o yaml | kubectl apply -f -
    helm install "$release" "$chart" -n "$namespace" -f "$values_file"
  fi
}
