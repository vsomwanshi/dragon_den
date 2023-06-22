# INT-SVC subnets
resource "aws_subnet" "ibm_internal_svc_zone" {
  vpc_id                  = aws_vpc.ibm_internal_svc.id
  cidr_block              = cidrsubnet(var.internal_svcs_datacenter_cidr, 2, count.index)
  map_public_ip_on_launch = false
  availability_zone       = data.aws_availability_zones.ibm_internal_svc_available.names[count.index % length(data.aws_availability_zones.ibm_internal_svc_available.names)]

  count = 3

  tags = {
    Name            = "ibm_internal_svc_zone_${element(["a", "b", "c"], count.index)}"
    Tier            = "ibm_internal_svc_zone"
    Billable_Object = var.datacenter
  }
}