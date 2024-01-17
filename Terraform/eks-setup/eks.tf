provider "kubernetes" {
  host                   = module.eks.cluster_endpoint
  cluster_ca_certificate = base64decode(module.eks.cluster_certificate_authority_data)

  exec {
    api_version = "client.authentication.k8s.io/v1beta1"
    command     = "aws"
    # This requires the awscli to be installed locally where Terraform is executed
    args = ["eks", "get-token", "--cluster-name", module.eks.cluster_name]
  }
}

module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "~> 19.0"

  cluster_name                   = "${var.name}-${var.environment}-cluster"
  cluster_version                = var.k8s_version
  cluster_endpoint_public_access = true
  create_cloudwatch_log_group    = false
  cluster_addons = {
    coredns = {
      most_recent = true
    }
    kube-proxy = {
      most_recent = true
    }
    vpc-cni = {
      most_recent    = true
      before_compute = true
      configuration_values = jsonencode({
        env = {
          # Reference docs https://docs.aws.amazon.com/eks/latest/userguide/cni-increase-ip-addresses.html
          ENABLE_PREFIX_DELEGATION = "true"
          WARM_PREFIX_TARGET       = "1"
        }
      })
    }
  }

  vpc_id                   = aws_vpc.eks.id
  subnet_ids               = aws_subnet.private[*].id
  control_plane_subnet_ids = flatten([aws_subnet.public[*].id, aws_subnet.private[*].id])

  #EKS Managed Node Group(s)
  eks_managed_node_group_defaults = {
    instance_types       = ["t2.medium", "t2.large"]
    bootstrap_extra_args = "--container-runtime containerd --kubelet-extra-args '--max-pods=110'"
    disk_size            = var.disk_size
  }

  eks_managed_node_groups = {
    "${var.name}-${var.environment}-ng-1" = {
      min_size       = var.node_gp_one_min_size
      max_size       = var.node_gp_one_max_size
      desired_size   = var.node_gp_one_desire_size
      instance_types = ["${var.node_gp_one_instance_type}"]
      capacity_type  = var.node_gp_capacity_type
      block_device_mappings = {
        xvda = {
          device_name = "/dev/xvda"
          ebs = {
            volume_size           = var.disk_size
            volume_type           = "gp3"
            iops                  = 16000
            throughput            = 1000
            encrypted             = true
            delete_on_termination = true
          }
        }
      }
    },
    "${var.name}-${var.environment}-ng-2" = {
      min_size       = var.node_gp_two_min_size
      max_size       = var.node_gp_two_max_size
      desired_size   = var.node_gp_two_desire_size
      instance_types = ["${var.node_gp_two_instance_type}"]
      capacity_type  = var.node_gp_capacity_type
      block_device_mappings = {
        xvda = {
          device_name = "/dev/xvda"
          ebs = {
            volume_size           = var.disk_size
            volume_type           = "gp3"
            iops                  = 16000
            throughput            = 1000
            encrypted             = true
            delete_on_termination = true
          }
        }
      }
    },
    "${var.name}-${var.environment}-ng-3" = {
      min_size       = var.node_gp_three_min_size
      max_size       = var.node_gp_three_max_size
      desired_size   = var.node_gp_three_desire_size
      instance_types = ["${var.node_gp_three_instance_type}"]
      capacity_type  = var.node_gp_capacity_type
      block_device_mappings = {
        xvda = {
          device_name = "/dev/xvda"
          ebs = {
            volume_size           = var.disk_size
            volume_type           = "gp3"
            iops                  = 16000
            throughput            = 1000
            encrypted             = true
            delete_on_termination = true
          }
        }
      }
    }
  }
  # create_aws_auth_configmap = false
  manage_aws_auth_configmap = true


  aws_auth_users = concat(
    [for users in data.aws_iam_group.admin_group.users : {
      userarn  = "${users.arn}"
      username = "${users.user_name}"
      groups   = ["system:masters"]
      }
    ]
  )



  tags = {
    Environment = "${var.environment}"
    Terraform   = "true"
  }
}

data "aws_iam_group" "admin_group" {
  group_name = var.iam_admin_group
}

data "aws_eks_cluster_auth" "cluster" {
  depends_on = [module.eks]
  name       = module.eks.cluster_name
}

#EFS FIle System

module "attach_efs_csi_role" {
  source = "terraform-aws-modules/iam/aws//modules/iam-role-for-service-accounts-eks"

  role_name             = "efs-csi"
  attach_efs_csi_policy = true

  oidc_providers = {
    ex = {
      provider_arn               = module.eks.oidc_provider_arn
      namespace_service_accounts = ["kube-system:efs-csi-controller-sa"]
    }
  }
}

resource "aws_security_group" "allow_nfs" {
  name        = "allow nfs for efs"
  description = "Allow NFS inbound traffic"
  vpc_id      = aws_vpc.eks.id

  ingress {
    description = "NFS from VPC"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

}

resource "kubernetes_storage_class" "efs_sc" {
  metadata {
    name = "efs-sc"
  }
  storage_provisioner = "efs.csi.aws.com"
  reclaim_policy      = "Retain"
  parameters = {
    type = "pd-standard",
    provisioningMode = "efs-ap",
    fileSystemId = aws_efs_file_system.stw_node_efs.id,
    directoryPerms: "700" 

  }
}
resource "aws_efs_file_system" "stw_node_efs" {
  creation_token = "efs-${var.name}-${var.environment}-cluster-token"
  tags = {
    Environment = "${var.environment}"
    Terraform   = "true"
    Name = "efs-${var.name}-${var.environment}-cluster"
  }
  
}

resource "aws_efs_mount_target" "stw_node_efs_mt" {
  count = var.availability_zones_count
  file_system_id  = aws_efs_file_system.stw_node_efs.id
  subnet_id       = aws_subnet.private[count.index].id
  security_groups = [aws_security_group.allow_nfs.id]
}

resource "helm_release" "aws_efs_csi_driver" {
  chart      = "aws-efs-csi-driver"
  name       = "aws-efs-csi-driver"
  namespace  = "kube-system"
  repository = "https://kubernetes-sigs.github.io/aws-efs-csi-driver/"

  set {
    name  = "image.repository"
    value = "602401143452.dkr.ecr.${var.region}.amazonaws.com/eks/aws-efs-csi-driver"
  }

  set {
    name  = "controller.serviceAccount.create"
    value = true
  }

  set {
    name  = "controller.serviceAccount.annotations.eks\\.amazonaws\\.com/role-arn"
    value = module.attach_efs_csi_role.iam_role_arn
  }

  set {
    name  = "controller.serviceAccount.name"
    value = "efs-csi-controller-sa"
  }
}



locals {
  depends_on = [data.aws_eks_cluster_auth.cluster]
  kubeconfig = templatefile("templates/kubeconfig.tpl", {
    cluster_name           = module.eks.cluster_name
    cluster_endpoint       = module.eks.cluster_endpoint
    cluster_ca_certificate = module.eks.cluster_certificate_authority_data
    cluster_token          = data.aws_eks_cluster_auth.cluster.token
  })
}

# resource "local_file" "kubeconfig" {
#   content  = local.kubeconfig
#   filename = "../kubeconfig"
# }


### Document DB ( Mongo-DB )

resource "aws_db_subnet_group" "db_subnet_group" {

  // The name and description of the db subnet group
  name        = "${module.eks.cluster_name}-db-subnet-gp"
  description = "DB subnet group"
  
  // Since the db subnet group requires 2 or more subnets, we are going to
  // loop through our private subnets in "rds_test_private_subnet" and
  // add them to this db subnet group
  subnet_ids  = aws_subnet.public[*].id
}

resource "aws_docdb_cluster_instance" "cluster_instances" {
  count              = length(var.docdb_cluster_names)
  identifier         = "${module.eks.cluster_name}-document-db-instance-${var.docdb_cluster_names[count.index]}"
  cluster_identifier = aws_docdb_cluster.default.id
  instance_class     = var.docdb_size
}

resource "aws_docdb_cluster" "default" {
  cluster_identifier = "${module.eks.cluster_name}-document-db"
  availability_zones = data.aws_availability_zones.available.names
  master_username    = "mongoadmin"
  master_password    = "mong0PAssw0rd"
  db_subnet_group_name = aws_db_subnet_group.db_subnet_group.id
}
