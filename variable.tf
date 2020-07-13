## Common-Prefix
  variable "prefix" {}
  ## Enviorment
variable "env" {}
## Count for Multiple resource 
variable "counts" {}
 # Prefix for VM
 variable "prefix-vm" {}
 # Prefix for SA
 variable "prefix-sa" {}
# Prefix for VNet
 variable "prefix-vnet" {}
 # Prefix for NIC
 variable "prefix-nic" {}
# Prefix for PIP
 variable "prefix-pip" {}
# Customer1 - SP Details - NEWRDS
variable "client_id_C1" {}
variable "client_secret_C1" {}
variable "tenant_id_C1" {} 
variable "subscription_id_C1" {}
# Customer2 - SP Details -RDSLAB
variable "client_id_C2" {}
variable "client_secret_C2" {} 
variable "tenant_id_C2" {}
variable "subscription_id_C2" {}
 ## VNet Address Space for C1
 variable "vnet-c1" {}
## VNet Address Space for C2
 variable "vnet-c2" {}
 ## VM Size
variable "vmsize" {}
# DataDiskName
variable "data_disk_name" {}
variable "build_env" {}
variable "pswd" {}

# Fixed Variabled
  ## Location
    variable "location" {
        type = map      
    } 

 ## Subnet IP Address Space for C1
 variable "subnet-c1" {
     type = map
     }
## Subnet IP Address Space for C2
 variable "subnet-c2" {
     type = map
     }
  
  ## CustomerName
  variable "customer"{
      type = map
  }
  
## Tag

variable "tag" {
type = map
}


