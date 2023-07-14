################################################################################
#### Output of VPC's needed to attach to Internal Services objects          ####
################################################################################
output "ibm_rosa_sg" {
  description = "ID for ibm_rosa_sg Security Group"
  value       = aws_security_group.ibm_rosa_sg.id
}