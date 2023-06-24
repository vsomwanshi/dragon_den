provider "aws" {
  access_key = var.aws_access_key
  secret_key = var.aws_secret_key
  region  = var.region
}

################################################################################
#### Below is the variables and details that pertain to the internal        ####
####  services VPC.                                                         ####
################################################################################
module "vpc_internal_svcs" {
  source = "./modules/aws/vpcs/internal_svcs"

  datacenter_prefix             = var.datacenter_prefix
  internal_svcs_datacenter_cidr = var.internal_svcs_datacenter_cidr
  instance_tenancy              = var.instance_tenancy
  datacenter                    = var.datacenter
  transit_gateway               = var.transit_gateway
  access_zone_cidr              = var.access_zone_cidr
  security_zone_cidr            = var.security_zone_cidr
#  domain_controller_1           = var.domain_controller_1
#  domain_controller_2           = var.domain_controller_2
}


################################################################################
#### Below is the variables and details that pertain to the internal        ####
#### EC2 Instance deployment.                                               ####
################################################################################
module "ec2_instances_internal_svcs" {
  source = "./modules/aws/ec2_instances/internal_svcs"

  ibm_internal_svc              = module.vpc_internal_svcs
  datacenter_prefix             = var.datacenter_prefix
  internal_svcs_datacenter_cidr = var.internal_svcs_datacenter_cidr
  instance_tenancy              = var.instance_tenancy
  datacenter                    = var.datacenter
#  transit_gateway               = var.transit_gateway
#  access_zone_cidr              = var.access_zone_cidr
#  security_zone_cidr            = var.security_zone_cidr
#  domain_controller_1           = var.domain_controller_1
#  domain_controller_2           = var.domain_controller_2
  deploy_den_master_node        = var.deploy_den_master_node
  deploy_den_worker_node        = var.deploy_den_worker_node
  AMIS                          = var.AMIS
  INSTANCE                      = var.INSTANCE
}
