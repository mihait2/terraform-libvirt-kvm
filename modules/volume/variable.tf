variable "host_list"{
 type=list(string)
 default=["host1","host2","host3","host4","host5"]
}

locals{
my_hosts=toset(var.host_list)
}



