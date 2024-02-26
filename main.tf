module "volume"{
source="./modules/volume"
}

module"domain"{
source="./modules/domain"
volume_id=module.volume.volume_ids[0]
depends_on = [module.volume]
cloud_id = module.volume.cloudinit_id
host_list = var.host_list
}

