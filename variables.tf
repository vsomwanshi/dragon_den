###############################################################################
#### Default values that match what is set in the datacenter terraform     ####
####  file.  These should not be changed here!  Most of these should be    ####
####  set in the <datacetner>_<datacenter_prefix>.tf file that is located  ####
####  in the datacenters/aws/ directory of the terraform modules.          ####
####  Variables that are marked below with a comment should be changed in  ####
####  this file and not in the <datacetner>_<datacenter_prefix>.tf file.   ####
###############################################################################
variable "cloud_provider" {
  type    = string
  default = "aws"
}

variable "aws_access_key" {
  type = string
  default = ""
}

variable "aws_secret_key" {
  type = string
  default = ""
}

variable "region" {
  type    = string
  default = ""
}

variable "datacenter" {
  type    = string
  default = ""
}

variable "datacenter_prefix" {
  type    = string
  default = ""
}

variable "datacenter_cidr" {
  type    = string
  default = ""
}

variable "internal_svcs_datacenter_cidr" {
  type    = string
  default = ""
}

variable "access_zone_cidr" {
  type    = string
  default = ""
}

variable "security_zone_cidr" {
  type    = string
  default = ""
}

variable "transit_gateway" {
  default = ""
}
################################################################################
#### VPC variable is here, modify or update accordingly                     ####
################################################################################
variable "ibm_internal_svc" {
  type    = string
  default = "data.aws_vpc.ibm_internal_svc.id"
}

################################################################################
#### SG variable is here, modify or update accordingly                     ####
################################################################################
#variable "ibm_rosa_sg" {
#  type    = string
#  default = "data.aws_security_group.ibm_rosa_sg.id"
#}

################################################################################
variable "instance_tenancy" {
  type    = string
  default = "default"
}

variable "root_block_encryption" {
  type    = string
  default = ""
}
variable "s3_bucket_encryption" {
  type    = string
  default = ""
}

#variable "domain_controller_1_ip" {
#  type    = string
#  default = ""
#}
#variable "domain_controller_2_ip" {
#  type    = string
#  default = ""
#}

variable "AMIS" {
  type = map(string)
}
variable "INSTANCE" {
  type = map(string)
}


################################################################################
################################################################################
#### Below are the default 'deploy' values for the variables used for these ####
####  AWS terraform modules.                                                ####
################################################################################
variable "deploy_den_master_node" {
  type    = bool
  default = true
}

variable "deploy_den_worker_node" {
  type    = bool
  default = true
}

################################################################################
#### These are the default server deploy counts to be use for the AWS       ####
####  terraform code for these modules.                                     ####
################################################################################
variable "deploy_den_master_node_count" {
  type    = number
  default = 1
}
variable "deploy_den_worker_node_count" {
  type    = number
  default = 1
}
