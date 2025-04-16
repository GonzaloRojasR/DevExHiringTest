output "ecr_repository_url" {
  description = "URL del repositorio ECR"
  value       = module.ecr.repository_url
}

output "ecr_repository_name" {
  description = "Nombre del repositorio ECR"
  value       = module.ecr.repository_name
}

output "eks_cluster_name" {
  value = module.eks.cluster_name
}

output "eks_cluster_endpoint" {
  value = module.eks.cluster_endpoint
}

output "eks_node_group_role_arn" {
  value = module.eks.eks_managed_node_groups["default"].iam_role_arn
}

output "eks_cluster_security_group_id" {
  value = module.eks.cluster_security_group_id
}

output "eks_node_public_ips" {
  description = "Lista de IPs públicas asignadas a los nodos del grupo administrado"
  value       = module.eks.eks_managed_node_groups["default"].public_ip_addresses
}
