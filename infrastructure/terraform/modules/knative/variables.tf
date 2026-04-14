variable "namespace" {
  description = "Namespace for Knative"
  type        = string
  default     = "knative-serving"
}

variable "environment" {
  description = "Deployment environment"
  type        = string
}

variable "release_name" {
  description = "Helm release name for Knative"
  type        = string
  default     = "knative-operator"
}

variable "chart_version" {
  description = "Knative operator Helm chart version"
  type        = string
  default     = "1.14.0"
}

variable "kourier_namespace" {
  description = "Namespace for Kourier ingress"
  type        = string
  default     = "kourier-system"
}

variable "kourier_release_name" {
  description = "Helm release name for Kourier"
  type        = string
  default     = "kourier"
}

variable "kourier_chart_version" {
  description = "Kourier Helm chart version"
  type        = string
  default     = "1.14.0"
}

variable "serving_domain" {
  description = "Domain for Knative serving"
  type        = string
  default     = "svc.cluster.local"
}
