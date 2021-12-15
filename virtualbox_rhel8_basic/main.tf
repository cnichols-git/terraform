terraform {
  required_providers {
    virtualbox = {
      source = "terra-farm/virtualbox"
      version = "0.2.2-alpha.1"
    }
  }
}

resource "virtualbox_vm" "node" {
    count = 1
    name = "${format("node-%02d", count.index+1)}"

    image = "/home/chris/Storage/VirtualBox_VMs/Cenots_8/Cenots_8.vdi"
    cpus = 1
    memory = "4024mib"

    network_adapter {
        type = "bridged"
    }

    #network_adapter {
    #    type = "bridged"
    #    host_interface = "en0"
    #}
}

#output "IPAddr" {
#    # Get the IPv4 address of the bridged adapter (the 2nd one) on 'node-02'
#    value = "${element(virtualbox_vm.node.*.network_adapter.1.ipv4_address, 1)}"
#}