output "gke_cluster_name" {
  description = "GKE cluster name"
  value       = module.gke_autopilot.cluster_name
}

output "gke_cluster_endpoint" {
  description = "GKE cluster endpoint"
  value       = module.gke_autopilot.cluster_endpoint
  sensitive   = true
}

output "vpc_name" {
  description = "VPC network name"
  value       = module.gke_autopilot.vpc_name
}

output "workload_identity_pool" {
  description = "Workload Identity pool"
  value       = module.gke_autopilot.workload_identity_pool
}

output "db_endpoint" {
  description = "MySQL endpoint"
  value       = module.managed_mysql.db_endpoint
}
