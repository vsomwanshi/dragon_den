terraform {
  required_version = ">= 0.13"
}

resource "aws_vpc" "ibm_internal_svc" {
  cidr_block           = var.internal_svcs_datacenter_cidr
#  enable_dns_hostnames = true
#  enable_dns_support   = true
  instance_tenancy     = var.instance_tenancy

  tags = {
    Name            = "ibm_internal_svc"
    Billable_Object = var.datacenter
  }
}

#resource "aws_vpc_dhcp_options" "ibm_internal_svc_dhcp_options" {
#  domain_name = ""
#  domain_name_servers = [
#    var.domain_controller_1,
#    var.domain_controller_2
#  ]

#  tags = {
#    Name            = ""
#    Billable_Object = "var.datacenter"
#  }
#}

#resource "aws_vpc_dhcp_options_association" "dhcp_vpc_association" {
#  vpc_id          = aws_vpc.ibm_internal_svc.id
#  dhcp_options_id = aws_vpc_dhcp_options.ibm_internal_svc_dhcp_options.id
#}
