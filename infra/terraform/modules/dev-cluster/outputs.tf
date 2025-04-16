output "cluster_name" {
  value = module.eks.cluster_name
}

output "cluster_endpoint" {
  value = module.eks.cluster_endpoint
}

output "eks_node_group_role_arn" {
  value = module.eks.eks_managed_node_groups["default"].iam_role_arn
}

output "cluster_security_group_id" {
  value = module.eks.cluster_security_group_id
}
