### Default variables ###
variable "ibm_internal_svc" {}
variable "datacenter_prefix" {}
variable "internal_svcs_datacenter_cidr" {}
variable "instance_tenancy" {}
variable "datacenter" {}
variable "ibm_rosa_sg" {}

#variable "s3_bucket_encryption" {}
#variable "domain_controller_1_ip" {}
#variable "domain_controller_2_ip" {}

variable "INSTANCE" {
  type = map(string)
}
variable "AMIS" {
  type = map(string)
}

### Default values for server builds ###
variable "disable_api_termination" {
  type    = bool
  default = true
}
variable "deploy_domain_controllers" {
  type    = bool
  default = true
}


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


