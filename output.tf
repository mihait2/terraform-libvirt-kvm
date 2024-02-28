output "volume_ids" {
  value = { for key, module in module.volume : key => module.volume_ids }
}

output "cloudinit_id" {
  value = { for key, module in module.volume : key => module.cloudinit_id }
}
