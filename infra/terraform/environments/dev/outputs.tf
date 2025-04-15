output "ecr_repository_url" {
  description = "URL del repositorio ECR"
  value       = aws_ecr_repository.this.repository_url
}

output "ecr_repository_name" {
  description = "Nombre del repositorio ECR"
  value       = aws_ecr_repository.this.name
}

output "eks_cluster_name" {
  value = module.eks.cluster_name
}
