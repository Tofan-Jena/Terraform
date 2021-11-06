provisioner "file" {
  source      = "./setup.ps1"
  destination = "C:/temp/setup.ps1"

  connection {
    type     = "winrm"
    user     = "Administrator"
    password = "P@ssw0rd"
    host     = "webserver1"
  }
}