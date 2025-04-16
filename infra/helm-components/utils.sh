#!/bin/bash

create_namespace_if_missing() {
  ns=$1
  if ! kubectl get namespace "$ns" >/dev/null 2>&1; then
    echo "Creating namespace $ns"
    kubectl create namespace "$ns"
  else
    echo "Namespace $ns already exists"
  fi
}
