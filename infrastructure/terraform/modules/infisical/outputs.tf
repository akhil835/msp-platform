output "service_name" {
  description = "Infisical service name"
  value       = var.release_name
}

output "namespace" {
  description = "Infisical namespace"
  value       = var.namespace
}

output "port" {
  description = "Infisical service port"
  value       = 8080
}
