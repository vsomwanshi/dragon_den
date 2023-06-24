################################################################################
#### Data pulls of VPC's needed to attach to Internal Services objects      ####
################################################################################
#data "aws_vpc" "ibm_internal_svc" {
#  tags = {
#    Name = "ibm_internal_svc"
#  }
#}

################################################################################
#### Data pulls to attach availability zones on vpc objects                 ####
################################################################################
data "aws_availability_zones" "ibm_internal_svc_available" {}
