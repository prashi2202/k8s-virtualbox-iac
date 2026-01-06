terraform {
  required_version = ">= 1.5.0"

  required_providers {
    virtualbox = {
      source  = "shekeriev/virtualbox"
      version = "0.2.1"
    }
  }
}