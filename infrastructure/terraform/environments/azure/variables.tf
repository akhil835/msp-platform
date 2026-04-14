variable "environment" {
  description = "Deployment environment"
  type        = string
  default     = "dev"
}

variable "subscription_id" {
  description = "Azure Subscription ID"
  type        = string
}

variable "location" {
  description = "Azure region"
  type        = string
  default     = "eastus"
}

variable "resource_group_name" {
  description = "Azure Resource Group name"
  type        = string
  default     = "ots-rg-dev"
}

variable "cluster_name" {
  description = "AKS cluster name"
  type        = string
  default     = "ots-aks-dev"
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
