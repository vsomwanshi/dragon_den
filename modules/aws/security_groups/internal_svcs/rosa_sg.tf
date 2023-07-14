resource "aws_security_group" "ibm_rosa_sg" {
  name        = "ibm-rosa-sec-group"
  description = "Security group for ROSA cluster"
  vpc_id      = data.aws_vpc.ibm_internal_svc.id
  tags = {
    Name = "ibm_rosa_sg"
    Billable_Object = var.datacenter
  }

  # Define inbound and outbound rules as per your requirements
  #Rule1
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
} 