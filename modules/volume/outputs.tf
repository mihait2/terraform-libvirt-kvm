output "volume_ids"{
value = [for volume in libvirt_volume.volumes : volume.id]
}

output "cloudinit_id"{
value = libvirt_cloudinit_disk.cloudinit.id
}


