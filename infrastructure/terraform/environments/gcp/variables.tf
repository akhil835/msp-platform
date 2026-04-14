variable "environment" {
  description = "Deployment environment"
  type        = string
  default     = "dev"
}

variable "project_id" {
  description = "GCP Project ID"
  type        = string
}

variable "region" {
  description = "GCP region"
  type        = string
  default     = "us-central1"
}

variable "cluster_name" {
  description = "GKE cluster name"
  type        = string
  default     = "ots-gke-dev"
}

variable "kubernetes_version" {
  description = "Kubernetes version"
  type        = string
  default     = "1.32"
}

variable "db_password" {
  description = "Database master password"
  type        = string
  sensitive   = true
}

variable "rabbitmq_password" {
  description = "RabbitMQ password"
  type        = string
  sensitive   = true
}

variable "minio_password" {
  description = "MinIO root password"
  type        = string
  sensitive   = true
}

variable "infisical_db_uri" {
  description = "Infisical database connection URI"
  type        = string
  sensitive   = true
}

variable "infisical_encryption_key" {
  description = "Infisical encryption key"
  type        = string
  sensitive   = true
}

variable "infisical_auth_secret" {
  description = "Infisical auth secret"
  type        = string
  sensitive   = true
}

variable "gcp_network" {
  description = "GCP VPC network name for Cloud SQL"
  type        = string
  default     = ""
}
