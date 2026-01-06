#!/usr/bin/env bash
set -e

MASTER_IP="192.168.29.140"
POD_CIDR="10.244.0.0/16"

if [ -f /etc/kubernetes/admin.conf ]; then
  echo "[INFO] Kubernetes already initialized"
  exit 0
fi

echo "[INFO] Initializing Kubernetes control plane"

kubeadm init \
  --apiserver-advertise-address=${MASTER_IP} \
  --pod-network-cidr=${POD_CIDR}

# kubeconfig for kubeadmin
mkdir -p /home/kubeadmin/.kube
cp /etc/kubernetes/admin.conf /home/kubeadmin/.kube/config
chown -R kubeadmin:kubeadmin /home/kubeadmin/.kube

# Install Flannel CNI
su - kubeadmin -c "kubectl apply -f https://raw.githubusercontent.com/flannel-io/flannel/master/Documentation/kube-flannel.yml"

# Generate join command
kubeadm token create --print-join-command > /tmp/kubeadm_join.sh
chmod +x /tmp/kubeadm_join.sh

echo "[INFO] Master initialized successfully"
