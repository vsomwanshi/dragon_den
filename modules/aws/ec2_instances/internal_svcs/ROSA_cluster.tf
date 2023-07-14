/*
## Deploy ROSA cluster
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
*/

/*
# Provision the ROSA cluster
resource "rosa_cluster" "ibm_rosa_cluster" {
  name            = "ibm_rosa_cluster"
  version         = "4.7.0"
#  subnet_ids      = data.aws_subnet.ibm_internal_svc_zone_sorted[count.index].id
  availability_zone = element(data.aws_availability_zones.ibm_internal_svc_available.names, count.index % length(data.aws_availability_zones.ibm_internal_svc_available.names))
  security_groups = data.aws_security_group.rosa_sg.id

  # Set other configuration options as per your requirements
  master_instances = var.deploy_den_master_node_count
  worker_instances = var.deploy_den_worker_node_count
  tags = {
   Name            = "${var.datacenter_prefix}-rosa-${count.index + 1}"
    Role            = "ROSA cluster"
    Billable_Object = var.datacenter
  }
}
*/

/*
resource "null_resource" "ibm_rosa_cluster" {
  provisioner "local-exec" {
    command = "rosa create cluster --cluster-name=my-cluster-name --aws-region=${var.region} --subnet-ids=${data.aws_subnet.ibm_internal_svc_zone_sorted[count.index].id} --security-group-ids=${data.aws_security_group.ibm_rosa_sg.id}"
  }
}
*/

/*
data "aws_caller_identity" "current" {}
*/