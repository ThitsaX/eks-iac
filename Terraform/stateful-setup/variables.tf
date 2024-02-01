variable "name" {
  description = "name of your infra"
  type        = string
}
variable "environment" {
  description = "name for your environment"
  type        = string
}
variable "region" {
  description = "AWS region"
  type        = string
}
variable "docdb_cluster_names" {
  description = "Document DB instance names"
  type        = list(string)
}
variable "docdb_size" {
  type = string
}