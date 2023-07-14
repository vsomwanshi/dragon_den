###############################################################################
#### Default values that match what is set in the datacenter terraform     ####
####  file.  These should not be changed here!  These should be set in the ####
####  <datacetner>_<datacenter_prefix>.tf file that is located in the      ####
####  datacenters/aws/ directory of the terraform modules.                 ####
###############################################################################
cloud_provider                = "aws"
region                        = "us-east-2"
datacenter_prefix             = "oh"
datacenter_cidr               = "192.31.0.0/16"
internal_svcs_datacenter_cidr = "192.31.0.0/16"
transit_gateway               = ""
instance_tenancy              = "default"
datacenter                    = "ohio"
s3_bucket_encryption          = ""
#domain_controller_1_ip       = "10.188.9.10"
#domain_controller_2_ip       = "10.188.10.10"
aws_access_key                = ""
aws_secret_key                = ""

################################################################################
#### Override values for servers to be built.  Uncomment value below to     ####
####  override a default server build value.                                ####
################################################################################
deploy_ibm_rosa_cluster = true
#deploy_den_master_node = false
#deploy_den_worker_node  = false