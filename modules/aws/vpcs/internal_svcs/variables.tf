variable "datacenter_prefix" {}
variable "internal_svcs_datacenter_cidr" {}
variable "access_zone_cidr" {}
variable "security_zone_cidr" {}
#variable "domain_controller_1_ip" {}
#variable "domain_controller_2_ip" {}
variable "instance_tenancy" {
  type    = string
  default = "default"
}

variable "transit_gateway" {}
variable "datacenter" {
  type    = string
  default = ""
}