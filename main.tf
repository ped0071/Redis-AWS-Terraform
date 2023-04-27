provider "aws" {
  region     = "us-west-2"
}

variable "node_type" {
  description = "O tamanho do nó que será usado no cluster"
}

variable "cluster_name" {
  description = "O nome do cluster Redis que será criado"
}

variable "description" {
  description = "Descrição do projeto"
}

resource "aws_elasticache_replication_group" "redis" {
  description          = var.description
  replication_group_id = var.cluster_name
  node_type            = var.node_type
  security_group_ids   = ["sg-0144e979ab0cda95c"]
  engine               = "redis"
  engine_version       = "6.0"
  port                 = 6379
  parameter_group_name = "default.redis6.x"
  num_cache_clusters   = 1
}

#terraform apply -var-file=prod.tfvars
#terraform apply -var-file=homolog.tfvars
