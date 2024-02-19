terraform {
  required_providers {
    libvirt = {
      source = "dmacvicar/libvirt"
    }
  }
}
provider "libvirt" {
uri = "qemu+ssh://robin@192.168.1.95/system?sshauth=privkey&no_verify=1"
}