variable "environment" {
  description = "Deployment environment"
  type        = string
  default     = "dev"
}

variable "region" {
  description = "AWS region"
  type        = string
  default     = "us-east-1"
}

variable "cluster_name" {
  description = "EKS cluster name"
  type        = string
  default     = "ots-eks-dev"
}

variable "account_id" {
  description = "AWS Account ID"
  type        = string
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
