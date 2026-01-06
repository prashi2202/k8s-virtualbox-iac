resource "virtualbox_hostonly_network" "hostonly" {
  name       = "k8s-hostonly"
  ip_address = "${var.base_network}.1"
  netmask    = "255.255.255.0"
}
