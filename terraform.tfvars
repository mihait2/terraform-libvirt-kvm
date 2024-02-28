vm_main_configs={
    masterNode = {
        count   = 1
        index   = 0
        name    = "host1"
        cpu     = 1
        ram     = 1024
       source   = "https://cloud-images.ubuntu.com/releases/bionic/release/ubuntu-18.04-server-cloudimg-amd64.img"
        user     = "milo"
  	password = "possible"
        format   = "qcow2"
    }
    workerNode1 = {
        count   = 1
        index   = 0
        name    = "host2"
        cpu     = 1
        ram     = 2048
       source   = "https://cloud-images.ubuntu.com/releases/bionic/release/ubuntu-18.04-server-cloudimg-amd64.img"
        user     = "milo"
        password = "possible"
        format   = "qcow2"
    }
    workerNode2 = {
        count   = 1
        index   = 0
        name    = "host3"
        cpu     = 1
        ram     = 2048
       source   = "https://cloud-images.ubuntu.com/releases/bionic/release/ubuntu-18.04-server-cloudimg-amd64.img"
        user     = "milo"
	password = "possible"
        format   = "qcow2"
    }
}
