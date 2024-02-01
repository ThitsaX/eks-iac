name= "pph"
environment = "testing"
region= "ap-southeast-1"
domain= "vnext.wynepayhub-pre.io"
vpc_cidr = "10.0.0.0/16"
enable_dns_hostname = true
enable_dns_support = true
availability_zones_count = 3
subnet_cidr_bits = 8
k8s_version = 1.28

node_gp_one_min_size = 1
node_gp_one_max_size = 2
node_gp_one_desire_size = 1
node_gp_one_instance_type = "t2.large"

node_gp_two_min_size = 1
node_gp_two_max_size = 2
node_gp_two_desire_size = 1
node_gp_two_instance_type = "t2.large"

node_gp_three_min_size = 1
node_gp_three_max_size = 2
node_gp_three_desire_size = 1
node_gp_three_instance_type = "t2.large"

docdb_cluster_names = ["a","c"]
docdb_size = "db.t3.medium"

node_gp_capacity_type = "ON_DEMAND"
disk_size = 100

ingress_ext_name = "nginx_ext"
helm_external_dns_version = "6.7.2"

iam_admin_group = "admin"

helm_certmanager_version = "v1.13.2"
letsencrypt_admin_email = "pyaephyo.hein@thitsaworks.com"
letsencrypt_server = "production"


gitlab_agent_token=ZsWVMeNXNUt42WEyp1LsAXJyKoikFD6MbFsVf1puCohYrjYvWQ
gitlab_kas_address=wss://gitlab.sanbox.wynepayhubsanbox-pre.com//-/kubernetes-agent