output "service_name" {
  description = "MinIO service name"
  value       = var.release_name
}

output "namespace" {
  description = "MinIO namespace"
  value       = var.namespace
}

output "api_port" {
  description = "MinIO API port"
  value       = 9000
}

output "console_port" {
  description = "MinIO console port"
  value       = 9001
}
