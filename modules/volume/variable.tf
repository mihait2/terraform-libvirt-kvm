variable "vm_disk_configs" {
  type = map(object({
    name     = string
    source   = string
    user     = string
    password = string	
    format   = string

  }))
  default = {
    masterNode = {
      name     = "masterNode"
      source   = "https://cloud-images.ubuntu.com/releases/bionic/release/ubuntu-18.04-server-cloudimg-amd64.img"
      user     = "milo"
      password = "possible"
      format   = "qcow2"
    }
  }
}
