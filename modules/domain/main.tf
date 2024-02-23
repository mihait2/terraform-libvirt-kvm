terraform {
  required_providers {
    libvirt = {
      source = "dmacvicar/libvirt"
      version = "0.7.6"
    }
}
}

resource "libvirt_domain" "host" {
        for_each = toset(var.host_list)
        name   = each.key
        memory = "512"
        vcpu   = 1


cloudinit = var.cloud_id


        network_interface {
            network_name = "default"
        }

        disk {
	 volume_id = var.volume_id
       }

        console {
            type = "pty"
            target_type = "serial"
            target_port = "0"
        }

}    




