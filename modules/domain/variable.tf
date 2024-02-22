variable "host_list"{
 type=list(string)
 default=["host1","host2","host3","host4","host5"]
}

locals{
my_hosts=toset(var.host_list)
}


variable "volume_name"{
default="host"
}

variable"volume_count"{

default=1

}

variable "volume_id"{
description="id of libvirt"
}

variable "cloud_id"{
description="id of cloudinit"
}
