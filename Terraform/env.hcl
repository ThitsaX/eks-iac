name="pph"
region="ap-southeast-1"
vpc_cidr = "10.0.0.0/16"
enable_dns_hostname = true
enable_dns_support = true
availability_zones_count = 2
subnet_cidr_bits = 8
k8s_version = 1.26
instance_type = "t2.large"
ng_desired_size = 2
ng_min_size = 1
ng_max_size = 4
disk_size = 20
ingress_ext_name = "nginx"
helm_external_dns_version = "6.7.2"