variable "region" {
  description = "AWS region"
  type        = string
}

variable "ecr_name" {
  description = "ECR repository name"
  type        = string
}

variable "cluster_name" {
  description = "Nombre del clúster EKS"
  type        = string
}