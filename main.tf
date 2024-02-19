resource "libvirt_volume" "volumes" {
        name = "volumes"
        pool = "images"
        source = "/home/milo/Desktop/KVM-VMBUILD-TERRAFORM/Ubuntu_server.img"
        format = "qcow2"
}

resource "libvirt_domain" "host" {
        name   = "host"
        memory = "2048"
        vcpu   = 2

        network_interface {
            network_name = "default"
        }

        disk {
            volume_id = "${libvirt_volume.volumes.id}"
       }

        console {
            type = "pty"
            target_type = "serial"
            target_port = "0"
        }

        graphics {
            type = "vnc"
            listen_type = "address"
            listen_address = "0.0.0.0"
            autoport = true
        }
}

