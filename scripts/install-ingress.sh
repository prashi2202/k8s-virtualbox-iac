#!/usr/bin/env bash
set -e

echo "[INFO] Installing NGINX Ingress Controller"

kubectl get ns ingress-nginx >/dev/null 2>&1 || \
kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/controller-v1.10.1/deploy/static/provider/cloud/deploy.yaml

kubectl rollout status deployment ingress-nginx-controller -n ingress-nginx

echo "[INFO] Ingress controller installed successfully"
