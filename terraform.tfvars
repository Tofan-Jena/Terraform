rgname                     = "myapprg"
environement               = "uat"
prefix                     = "myapp"
adminpassword              = "Admin@12345"
location                   = "west europe"
myapp_rg              = "web-rg"
myapp_location        = "West Europe"
resource_prefix            = "web-server"
vnet-CIDR              = ["10.0.0.0/22"]
web-server-name                     = "web-server"
myapp_count                    = 2
password = "Admin@12345"
subscription_id  = "#subscription_id#"
client_id       = "#client_id#"
client_secret   = "#client_secret#"
tenant_id       = "#tenant_id#"
myapp_subnets                  = {
     
          AzureBastionSubnet = "10.0.0.16/28"
          GatewaySubnet      =  "10.0.0.0/28"
          DataSubnet         =  "10.0.0.32/28"
}
tag                                 = {
            Development      = "Production"
            ApplicationOwner = "MyApp"
            IaaC              = "Terraform"
}


prefix = "idf"
env = "prod"
counts = "2"
pswd = "Admin@12345"
# Customer1 - SP Details - NEWRDS
client_id_C1 = "dbd0ece0-200f-419f-89ed-a831df2f59f7"
client_secret_C1 = "-7cBZH0WG0n/V=7LbH@=5=x=Q0[WOMKl"
tenant_id_C1 = "fd02ec63-37d9-49b6-b6da-af2670ad9e1c"
subscription_id_C1 = "4c1885b8-7dc3-4bb3-8cfc-ebcb9fefdf3b"
# Customer2 - SP Details -RDSLAB
client_id_C2 = "886be662-c92b-4d26-b9f5-49c38f52a483"
client_secret_C2 = "x_XLf8TfDP_g=zyPNSFH85NE3k[zsq9X"
tenant_id_C2 = "1c999845-11fd-4223-8086-242e4e8508b8"
subscription_id_C2 = "67006b24-52bb-4f1c-b621-905523fa2156"

# Customer alies
customer = {
    Customer1 = "c1"
    Customer2 = "c2"
}

location = {
    locationC1 = "south india"
    locationC2 = "west india"
}
vnet-c1 = "10.0.1.0/24"
vnet-c2 = "10.0.2.0/24"

subnet-c1 = {
        DB-Subnet = "10.0.1.0/28"
        AzureBastionSubnet = "10.0.1.16/28"
        GatewaySubnet = "10.0.1.32/28"
}

subnet-c2 = {
        DB-Subnet = "10.0.2.0/28"
        AzureBastionSubnet = "10.0.2.16/28"
        GatewaySubnet = "10.0.2.32/28"
}
tag = {
    env = "prod"
    owner = "tofan"
    cost = "CoE"
}
prefix-sa = "sa"
prefix-vm = "vm"
prefix-vnet = "vnet"
vmsize =     "d2_ms"
prefix-nic = "nic"
prefix-pip = "pip"
data_disk_name = "datadisk"
build_env = "kyahai"