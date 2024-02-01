### Document DB ( Mongo-DB )

resource "aws_db_subnet_group" "db_subnet_group" {

  // The name and description of the db subnet group
  name        = "${terraform_remote_state.eks.output.cluster_name}-db-subnet-gp"
  description = "DB subnet group"

  subnet_ids = aws_subnet.private[*].id
}

resource "aws_docdb_cluster_instance" "cluster_instances" {
  count              = length(var.docdb_cluster_names)
  identifier         = "${terraform_remote_state.eks.output.cluster_name}-document-db-instance-${var.docdb_cluster_names[count.index]}"
  cluster_identifier = aws_docdb_cluster.default.id
  instance_class     = var.docdb_size
}

resource "aws_docdb_cluster" "default" {
  cluster_identifier   = "${terraform_remote_state.eks.output.cluster_name}-document-db"
  availability_zones   = data.aws_availability_zones.available.names
  master_username      = "mongoadmin"
  master_password      = "mong0PAssw0rd"
  skip_final_snapshot  = true
  db_subnet_group_name = aws_db_subnet_group.db_subnet_group.id
}

### MKS Serverless ( Kafka )


resource "aws_msk_serverless_cluster" "default" {
  cluster_name = "${terraform_remote_state.eks.output.cluster_name}-msk"

  vpc_config {
    subnet_ids         = aws_subnet.private[*].id
  }

  client_authentication {
    sasl {
      iam {
        enabled = true
      }
    }
  }
}

###vault##
