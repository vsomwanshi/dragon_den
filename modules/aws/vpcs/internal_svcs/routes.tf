# Route tables attached to subnets
resource "aws_route_table" "ibm_internal_svc_rt" {
  vpc_id = aws_vpc.ibm_internal_svc.id

  tags = {
    Name            = "ibm_internal_svc_rt"
    Billable_Object = var.datacenter
  }
}

# Create IGW
resource "aws_internet_gateway" "ibm-igw" {
  vpc_id = aws_vpc.ibm_internal_svc.id

  tags = {
    Name            = "ibm-igw"
    Billable_Object = var.datacenter
  }
}

# Create route and attach to Internet gateway

resource "aws_route" "my_route" {
  route_table_id         = aws_route_table.ibm_internal_svc_rt.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.ibm-igw.id
}

# Associate route table with VPC
resource "aws_main_route_table_association" "ibm_route_table_assoc" {
  vpc_id = aws_vpc.ibm_internal_svc.id
  route_table_id = aws_route_table.ibm_internal_svc_rt.id
}