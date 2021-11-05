variable "vnet-CIDR" {
  type = list(string)
}
variable "location" {
  type = string
}
variable "prefix" {
  type = string
}
variable "myapp_subnets" {
  type  = map(string)
}
variable "myapp_count" {
  type = string
}

variable "rgname" {
  type = string
}

variable "environement" {
  type = string
}