
variable "rgname" {
  type = string
}
variable "tag" {
  type = map(string)
}
variable "prefix" {
  type = string
}
variable "adminpassword" {
  type = string
}

variable "myapp_subnets" {
  type = map(string)
}

variable "myapp_count" {
  type = string
}
variable "vnet-CIDR" {
  type = list(string)
}
variable "environement" {
   type = string
}
variable "password" {
  type = string
}
variable "tenant_id" {
  type = string
}
variable "subscription_id" {
  type = string
}
variable "client_id" {
  type = string
}
variable "client_secret" {
  type = string
}


/* Common-Prefix
 variable "prefix" {}
*/ ## Enviorment
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


