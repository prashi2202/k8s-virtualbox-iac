resource "virtualbox_vm" "node" {
  for_each = local.nodes

  name   = each.value.name
  image  = var.iso_path
  cpus   = var.vm_cpu
  memory = var.vm_memory

  network_adapter {
    type           = "bridged"
    host_interface = var.bridge_interface
  }

  network_adapter {
    type = "nat"
  }

  disk {
    size = var.vm_disk_size
  }

  cloudinit = virtualbox_cloudinit_disk.node[each.key].id
}
