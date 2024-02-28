module "volume"{
source="./modules/volume"
for_each = var.vm_main_configs
vm_disk_configs = {
      "${each.key}" = {
          name     = each.value.name
          source   = each.value.source
          user     = each.value.user
          format   = each.value.format
      }
    }
}


module"domain"{
source="./modules/domain"
for_each = var.vm_main_configs
 vm_vms_configs = {
      "${each.key}" = {
          count   = each.value.count
          index   = each.value.index
          name    = each.value.name
          cpu     = each.value.cpu
          ram     = each.value.ram
      }
    }

}
