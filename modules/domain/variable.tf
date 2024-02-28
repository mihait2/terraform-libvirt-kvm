variable "vm_vms_configs" {
  type = map(object({
    count   = number
    index   = number
    name    = string
    cpu     = number
    ram     = number
  }))
  default = {
    masterNode = {
        count   = 1
        index   = 0
        name    = "host1"
        cpu     = 1
        ram     = 1024
    }
  }
}
