################################################################################
#### Data pulls in order to set the Internal Services subnets in order      ####
####     this is needed to ensure servers/volumes/NICs                      ####
####     are set in the correct subnet/AZ                                   ####
################################################################################
data "aws_subnet_ids" "ibm_internal_svc_zone" {
  vpc_id = data.aws_vpc.ibm_internal_svc.id

  tags = {
    Tier = "ibm_internal_svc_zone"
  }
}
data "aws_subnet" "ibm_internal_svc_zone" {
  count = length(data.aws_subnet_ids.ibm_internal_svc_zone.ids)
  id    = tolist(data.aws_subnet_ids.ibm_internal_svc_zone.ids)[count.index]
}
data "aws_subnet" "ibm_internal_svc_zone_sorted" {
  count = length(local.ibm_internal_svc_zone_ids_sorted_by_az)
  id    = tolist(local.ibm_internal_svc_zone_ids_sorted_by_az)[count.index]
}
################################################################################
#### Data pulls of VPC's needed to attach to Internal Services objects      ####
################################################################################
data "aws_vpc" "ibm_internal_svc" {
  tags = {
    Name = "ibm_internal_svc"
  }
}
################################################################################
#### Data pulls to attach availability zones and encryption on servers      ####
################################################################################
data "aws_availability_zones" "ibm_internal_svc_available" {}
data "aws_ebs_default_kms_key" "root_block_encryption" {}

################################################################################
#### Instance related data e.g Instance IDs                                 ####
################################################################################
data "aws_instance" "den_master_node" {
  count       = var.deploy_den_master_node ? var.deploy_den_master_node_count : 0
  instance_id = aws_instance.den_master_node[count.index].id
}
#data "aws_instance" "den_worker_node" {
#  count       = var.deploy_den_worker_node ? var.deploy_den_worker_node_count : 0
#  instance_id = aws_instance.den_worker_node[count.index].id
#}
