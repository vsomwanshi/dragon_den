################################################################################
#### Output used to set the Internal Services subnets in order.             ####
####     This is needed to ensure servers/volumes/NICs                      ####
####     are set in the correct subnet/AZ                                   ####
################################################################################
output "subnet_cidr_blocks" {
  value = [data.aws_subnet.ibm_internal_svc_zone.*.cidr_block]
}
output "subnet_cidr_blocks_sorted" {
  value = [data.aws_subnet.ibm_internal_svc_zone_sorted.*.cidr_block]
}
locals {
  ibm_internal_svc_zone_ids_sorted_by_az  = values(zipmap(data.aws_subnet.ibm_internal_svc_zone.*.availability_zone, data.aws_subnet.ibm_internal_svc_zone.*.id))
  ibm_internal_svc_zone_cidr_sorted_by_az = values(zipmap(data.aws_subnet.ibm_internal_svc_zone.*.availability_zone, data.aws_subnet.ibm_internal_svc_zone.*.cidr_block))
}
################################################################################
#### Output of VPC's needed to attach to Internal Services objects          ####
################################################################################
output "ibm_internal_svc_available" {
  value = data.aws_availability_zones.ibm_internal_svc_available.id
}

################################################################################
#### Output of instance IDs                                                 ####
################################################################################
output "den_master_node" {
  value = var.deploy_den_master_node ? data.aws_instance.den_master_node[0].id : " "
}

output "den_worker_node" {
  value = var.deploy_den_worker_node ? data.aws_instance.den_worker_node[0].id : " "
}