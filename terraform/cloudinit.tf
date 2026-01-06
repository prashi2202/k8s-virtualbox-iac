resource "virtualbox_cloudinit_disk" "node" {
  for_each = local.nodes

  name = "${each.value.name}-cloudinit"

  user_data = templatefile(
    "${path.module}/cloud-init/${each.value.role}.yaml",
    {
      hostname       = each.value.name
      static_ip      = each.value.ip
      gateway        = "${var.base_network}.1"
      ssh_public_key = var.ssh_public_key
      password_hash  = var.vm_password_hash
    }
  )
}
