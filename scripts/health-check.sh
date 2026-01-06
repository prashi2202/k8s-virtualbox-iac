#!/usr/bin/env bash
set -e

echo "[INFO] Cluster health check"

kubectl get nodes
kubectl get pods -A

NOT_READY=$(kubectl get nodes | grep -v Ready | wc -l)

if [ "$NOT_READY" -gt 1 ]; then
  echo "[ERROR] Some nodes are not ready"
  exit 1
fi

echo "[INFO] Cluster is healthy"
