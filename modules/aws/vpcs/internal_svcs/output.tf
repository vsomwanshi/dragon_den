################################################################################
#### Output of VPC's needed to attach to Internal Services objects          ####
################################################################################
output "ibm_internal_svc" {
  description = "VPC ID for ibm_internal_svc"
  value       = aws_vpc.ibm_internal_svc.id
}
output "ibm_internal_svc_available" {
  value = data.aws_availability_zones.ibm_internal_svc_available.id
}