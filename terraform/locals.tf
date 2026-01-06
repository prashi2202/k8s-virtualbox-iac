locals {
  masters = {
    for i in range(var.master_count) :
    "master-${i}" => {
      name = "k8s-master-${i}"
      ip   = "${var.base_network}.${var.master_ip_start + i}"
      role = "master"
    }
  }

  workers = {
    for i in range(var.worker_count) :
    "worker-${i}" => {
      name = "k8s-worker-${i}"
      ip   = "${var.base_network}.${var.worker_ip_start + i}"
      role = "worker"
    }
  }

  nodes = merge(local.masters, local.workers)
}
