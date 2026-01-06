output "master_ips" {
  value = [for m in local.masters : m.ip]
}

output "worker_ips" {
  value = [for w in local.workers : w.ip]
}
