output "volume_ids"{
value = [for volume in libvirt_volume.volumes : volume.id]
}

output "cloudinit_id"{
    value = [for idx, cloudinit in libvirt_cloudinit_disk.cloudinit : cloudinit.id]
}


