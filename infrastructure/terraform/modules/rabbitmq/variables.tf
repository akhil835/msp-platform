variable "namespace" {
  description = "Kubernetes namespace for RabbitMQ"
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
  default     = "rabbitmq"
}

variable "chart_version" {
  description = "RabbitMQ Helm chart version"
  type        = string
  default     = "12.0.0"
}

variable "rabbitmq_username" {
  description = "RabbitMQ default username"
  type        = string
  default     = "otsuser"
}

variable "rabbitmq_password" {
  description = "RabbitMQ default password"
  type        = string
  sensitive   = true
}

variable "replica_count" {
  description = "Number of RabbitMQ replicas"
  type        = number
  default     = 1
}
