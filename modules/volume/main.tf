terraform {
  required_providers {
    libvirt = {
      source = "dmacvicar/libvirt"
      version = "0.7.6"
    }
}
}



resource "libvirt_pool" "cluster" {
  name = "clustermilo"
  type = "dir"
  path = "/home/milo/images"
}


resource "libvirt_volume" "volumes" {
        for_each=local.my_hosts
	name = "${each.key}.qcow2"
        pool = libvirt_pool.cluster.name
        source = "https://cloud-images.ubuntu.com/releases/xenial/release/ubuntu-16.04-server-cloudimg-amd64-disk1.img"
        format = "qcow2"
}



data "template_file" "user_data" {
  template = file("${path.module}/cloud_init.cfg")
}

data "template_file" "network_config" {
  template = file("${path.module}/network_config.cfg")
}




resource "libvirt_cloudinit_disk" "cloudinit" {
  name           = "cloudinit.iso"
  user_data      = data.template_file.user_data.rendered
  network_config = data.template_file.network_config.rendered
  pool           = libvirt_pool.cluster.name
} 


