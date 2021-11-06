/* remote-exec” provisioner. It connects the VM with a known and associated field like — hostname, 
public IP address, FQDN etc. We are going to create a VM and associate a public IP address to it, 
so that it can be accessible from outside and using the same Public IP remote-exec provisioner will connect the VM as well



*/

provisioner "remote-exec" {
  inline = [
    "echo ${var.password} | sudo -S yum install epel-release -y",
    "sudo yum install ansible -y"
  ]

  connection {
      type = ssh
      user = var.user
      password = var.password
      host = azurerm_virtual_machine.test.publicip
  }
}