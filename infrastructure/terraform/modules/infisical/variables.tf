variable "namespace" {
  description = "Kubernetes namespace for Infisical"
  type        = string
  default     = "akhil-test"
}

variable "environment" {
  description = "Deployment environment"
  type        = string
}

variable "release_name" {
  description = "Helm release name"
  type        = string
  default     = "infisical"
}

variable "chart_version" {
  description = "Infisical Helm chart version"
  type        = string
  default     = "0.4.0"
}

variable "infisical_db_connection_uri" {
  description = "Database connection URI for Infisical"
  type        = string
  sensitive   = true
}

variable "encryption_key" {
  description = "Infisical encryption key"
  type        = string
  sensitive   = true
}

variable "auth_secret" {
  description = "Infisical auth secret"
  type        = string
  sensitive   = true
}

variable "secret_paths" {
  description = "Secret paths managed by Infisical"
  type        = list(string)
  default = [
    "oauth2.client-id",
    "oauth2.client-secret",
    "db.url",
    "db.username",
    "db.password",
    "rabbitmq.host",
    "rabbitmq.username",
    "rabbitmq.password",
    "minio.access-key",
    "minio.secret-key",
    "n8n.encryption-key"
  ]
}
