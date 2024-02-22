output "volume_ids"{
value = [for volume in libvirt_volume.volumes : volume.id]
}

output "cloud_id"{
value = [for cloudinit in libvirt_cloudinit_disk.commoninit : commoninit.id]
}


