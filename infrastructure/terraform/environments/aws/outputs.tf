output "eks_cluster_name" {
  description = "EKS cluster name"
  value       = module.eks_fargate.cluster_name
}

output "eks_cluster_endpoint" {
  description = "EKS cluster endpoint"
  value       = module.eks_fargate.cluster_endpoint
  sensitive   = true
}

output "oidc_provider_arn" {
  description = "OIDC provider ARN"
  value       = module.eks_fargate.oidc_provider_arn
}

output "vpc_id" {
  description = "VPC ID"
  value       = module.eks_fargate.vpc_id
}

output "db_endpoint" {
  description = "MySQL endpoint"
  value       = module.managed_mysql.db_endpoint
}
