## Create Den cluster master nodes
resource "aws_instance" "den_master_node" {
  count         = var.deploy_den_master_node_count
  instance_type = var.INSTANCE["t3micro"]
  ami           = var.AMIS["linux_ami"]
  availability_zone = element(data.aws_availability_zones.ibm_internal_svc_available.names, count.index % length(data.aws_availability_zones.ibm_internal_svc_available.names))
  tags = {
   Name            = "${var.datacenter_prefix}-master-${count.index + 1}"
    Role            = "master node"
    Billable_Object = var.datacenter
  }
}
