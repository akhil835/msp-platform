variable "cluster_name" {
  description = "Name of the EKS cluster"
  type        = string
}

variable "environment" {
  description = "Deployment environment"
  type        = string
}

variable "region" {
  description = "AWS region"
  type        = string
  default     = "us-east-1"
}

variable "kubernetes_version" {
  description = "Kubernetes version for EKS"
  type        = string
  default     = "1.32"
}

variable "vpc_cidr" {
  description = "CIDR block for VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "private_subnet_cidrs" {
  description = "CIDR blocks for private subnets"
  type        = list(string)
  default     = ["10.0.1.0/24", "10.0.2.0/24"]
}

variable "public_subnet_cidrs" {
  description = "CIDR blocks for public subnets"
  type        = list(string)
  default     = ["10.0.101.0/24", "10.0.102.0/24"]
}

variable "availability_zones" {
  description = "Availability zones"
  type        = list(string)
  default     = ["us-east-1a", "us-east-1b"]
}

variable "fargate_profiles" {
  description = "Fargate profile configurations"
  type = list(object({
    profile_name = string
    namespace    = string
  }))
  default = [
    { profile_name = "default",     namespace = "default" },
    { profile_name = "kube-system", namespace = "kube-system" },
    { profile_name = "akhil-test",  namespace = "akhil-test" }
  ]
}

variable "irsa_namespace" {
  description = "Namespace for IRSA service accounts"
  type        = string
  default     = "akhil-test"
}

variable "account_id" {
  description = "AWS Account ID"
  type        = string
}
