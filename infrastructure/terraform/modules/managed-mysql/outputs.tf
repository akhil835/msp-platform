locals {
  db_endpoint = (
    var.cloud_provider == "aws" ? (
      length(aws_db_instance.main) > 0 ? aws_db_instance.main[0].endpoint : ""
    ) : var.cloud_provider == "gcp" ? (
      length(google_sql_database_instance.main) > 0 ? google_sql_database_instance.main[0].private_ip_address : ""
    ) : (
      length(azurerm_mysql_flexible_server.main) > 0 ? azurerm_mysql_flexible_server.main[0].fqdn : ""
    )
  )
}

output "db_endpoint" {
  description = "Database endpoint/host"
  value       = local.db_endpoint
}

output "db_name" {
  description = "Database name"
  value       = var.database_name
}

output "db_username" {
  description = "Database username"
  value       = var.db_username
  sensitive   = true
}
