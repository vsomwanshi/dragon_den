####Den cluster worker nodes
resource "aws_network_interface" "den_worker_node" {
  count           = var.deploy_den_worker_node ? var.deploy_den_worker_node_count : 0
  subnet_id       = data.aws_subnet.ibm_internal_svc_zone_sorted[count.index].id
  private_ips     = [cidrhost(data.aws_subnet.ibm_internal_svc_zone_sorted[count.index].cidr_block, 223)]
  #security_groups = [data.aws_security_group.helix_domain_members_is.id, data.aws_security_group.helix_elastic_is.id, data.aws_security_group.helix_qualyscanner_is.id]
  tags = {
    Name            = "${var.datacenter_prefix}-worker-${count.index + 1}_network_interface"
    Billable_Object = var.datacenter
  }
}

resource "aws_instance" "den_worker_node" {
#  count = var.instance_count
  count = var.deploy_den_worker_node ? var.deploy_den_worker_node_count : 0
  ami           = var.AMIS["linux_ami"]
  instance_type = var.INSTANCE["t3micro"]
#  availability_zone = var.availability_zone[count.index]
  tags = {
   Name            = "${var.datacenter_prefix}-worker-${count.index + 1}"
    Role            = "worker node"
    Billable_Object = var.datacenter
  }
  
  network_interface {
    network_interface_id = aws_network_interface.den_worker_node[count.index].id
    device_index         = 0
  }
}
