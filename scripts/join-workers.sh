#!/usr/bin/env bash
set -e

WORKERS=(
  "192.168.29.150"
  "192.168.29.151"
)

JOIN_CMD=$(cat /tmp/kubeadm_join.sh)

for NODE in "${WORKERS[@]}"; do
  echo "[INFO] Joining worker ${NODE}"
  ssh -o StrictHostKeyChecking=no kubeadmin@${NODE} "sudo ${JOIN_CMD}" || true
done

echo "[INFO] Worker join completed"
