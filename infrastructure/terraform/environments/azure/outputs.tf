output "aks_cluster_name" {
  description = "AKS cluster name"
  value       = module.aks_virtual_nodes.cluster_name
}

output "aks_cluster_id" {
  description = "AKS cluster ID"
  value       = module.aks_virtual_nodes.cluster_id
}

output "vnet_id" {
  description = "VNet ID"
  value       = module.aks_virtual_nodes.vnet_id
}

output "managed_identity_client_id" {
  description = "Managed Identity Client ID"
  value       = module.aks_virtual_nodes.managed_identity_client_id
}

output "resource_group_name" {
  description = "Resource group name"
  value       = module.aks_virtual_nodes.resource_group_name
}

output "db_endpoint" {
  description = "MySQL endpoint"
  value       = module.managed_mysql.db_endpoint
}
