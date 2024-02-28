terraform {
  required_providers {
    libvirt = {
      source = "dmacvicar/libvirt"
      version = "0.7.6"
    }
}
}
 

data "terraform_remote_state" "disk_details" {
  backend = "local"
  config = {
    path = "terraform.tfstate"
  }
}

resource "libvirt_domain" "host" {
	for_each = var.vm_vms_configs
        name = "${each.value.name}"
	memory = each.value.ram
      	vcpu   = each.value.cpu
         
	cloudinit = data.terraform_remote_state.disk_details.outputs["cloudinit_id"]["${each.key}"][each.value.index]

        network_interface {
            network_name = "default"
        }

         disk {
    volume_id = "${data.terraform_remote_state.disk_details.outputs["volume_ids"]["${each.key}"][each.value.index]}"
}


        console {
            type = "pty"
            target_type = "serial"
            target_port = "0"
        }

}



