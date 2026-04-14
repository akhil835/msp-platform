variable "namespace" {
  description = "Kubernetes namespace for MinIO"
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
  default     = "minio"
}

variable "chart_version" {
  description = "MinIO Helm chart version"
  type        = string
  default     = "5.2.0"
}

variable "minio_root_user" {
  description = "MinIO root user"
  type        = string
  default     = "minioadmin"
}

variable "minio_root_password" {
  description = "MinIO root password"
  type        = string
  sensitive   = true
}

variable "replica_count" {
  description = "Number of MinIO replicas"
  type        = number
  default     = 1
}

variable "buckets" {
  description = "List of buckets to create"
  type        = list(string)
  default     = ["ots-bucket"]
}
