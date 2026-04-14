variable "cluster_name" {
  description = "Name of the GKE Autopilot cluster"
  type        = string
}

variable "environment" {
  description = "Deployment environment"
  type        = string
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

variable "kubernetes_version" {
  description = "Kubernetes version for GKE"
  type        = string
  default     = "1.32"
}

variable "vpc_cidr" {
  description = "CIDR block for VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "subnet_cidr" {
  description = "CIDR block for subnet"
  type        = string
  default     = "10.0.1.0/24"
}

variable "pods_cidr" {
  description = "Secondary CIDR for pods"
  type        = string
  default     = "10.1.0.0/16"
}

variable "services_cidr" {
  description = "Secondary CIDR for services"
  type        = string
  default     = "10.2.0.0/16"
}

variable "workload_identity_namespace" {
  description = "Namespace for Workload Identity"
  type        = string
  default     = "akhil-test"
}
