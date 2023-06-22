# Route tables attached to subnets
#resource "aws_route_table" "ibm_internal_svc_rt" {
#  vpc_id = data.aws_vpc.ibm_internal_svc.id

#  route {
#    cidr_block         = "0.0.0.0/0"
#    transit_gateway_id = var.transit_gateway
#  }

#  tags = {
#    Name            = "ibm_internal_svc_rt"
#    Billable_Object = var.datacenter
#  }
#}