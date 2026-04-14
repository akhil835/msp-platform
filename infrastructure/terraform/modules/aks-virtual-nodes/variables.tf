variable "cluster_name" {
  description = "Name of the AKS cluster"
  type        = string
}

variable "environment" {
  description = "Deployment environment"
  type        = string
}

variable "resource_group_name" {
  description = "Azure Resource Group name"
  type        = string
}

variable "location" {
  description = "Azure region"
  type        = string
  default     = "eastus"
}

variable "kubernetes_version" {
  description = "Kubernetes version for AKS"
  type        = string
  default     = "1.32"
}

variable "vnet_address_space" {
  description = "Address space for VNet"
  type        = list(string)
  default     = ["10.0.0.0/8"]
}

variable "aks_subnet_prefix" {
  description = "AKS subnet prefix"
  type        = string
  default     = "10.240.0.0/16"
}

variable "aci_subnet_prefix" {
  description = "ACI (Virtual Nodes) subnet prefix"
  type        = string
  default     = "10.241.0.0/16"
}

variable "subscription_id" {
  description = "Azure Subscription ID"
  type        = string
}

variable "dns_prefix" {
  description = "DNS prefix for AKS cluster"
  type        = string
  default     = "ots-aks"
}
