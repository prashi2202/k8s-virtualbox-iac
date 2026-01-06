variable "master_count" {
  description = "Number of master nodes"
  type        = number
}

variable "worker_count" {
  description = "Number of worker nodes"
  type        = number
}

variable "base_network" {
  description = "Base network prefix"
  type        = string
  default     = "192.168.29"
}

variable "master_ip_start" {
  default = 140
}

variable "worker_ip_start" {
  default = 150
}

variable "vm_password_hash" {
  description = "Hashed password for kubeadmin"
  type        = string
  sensitive   = true
}

variable "ssh_public_key" {
  type        = string
}

variable "iso_path" {
  description = "Path to Ubuntu ISO"
  type        = string
}

variable "bridge_interface" {
  description = "VirtualBox bridged interface"
  type        = string
}

variable "vm_cpu" {
  default = 2
}

variable "vm_memory" {
  default = 2048
}

variable "vm_disk_size" {
  default = 20480
}
