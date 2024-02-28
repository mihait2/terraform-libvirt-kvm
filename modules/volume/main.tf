terraform {
  required_providers {
    libvirt = {
      source = "dmacvicar/libvirt"
      version = "0.7.6"
    }
}
}



resource "libvirt_pool" "cluster" {
  for_each = var.vm_disk_configs
    name = "${each.value.name}_pool"
    type = "dir"
  path = "/home/milo/images/${each.value.name}"
}

resource "libvirt_volume" "volumes"{
 for_each = var.vm_disk_configs
    name = "${each.value.name}_volume.${each.value.format}"
    pool = libvirt_pool.cluster[each.key].name
    source = each.value.source
    format = each.value.format
}



data "template_file" "user_data" {
   for_each = var.vm_disk_configs
    template = file("${path.module}/cloud_init.cfg")
    vars = {
        VM_USER = each.value.user
    }
}

data "template_file" "network_config" {
  template = file("${path.module}/network_config.cfg")
}



resource "libvirt_cloudinit_disk" "cloudinit" {
  for_each = var.vm_disk_configs
    name = "${each.value.name}_cloudinit.iso"
    user_data = data.template_file.user_data[each.key].rendered
    network_config = data.template_file.network_config.rendered
    pool = libvirt_pool.cluster[each.key].name
}

