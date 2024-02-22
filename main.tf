module "volume"{
source="./modules/volume"
volume_count=var.volume_count
volume_name=var.volume_name
}

module"domain"{
source="./modules/domain"
volume_id=module.volume.volume_ids[0]
cloud_id = module.volume.commoninit.id
host_list = var.host_list
}

