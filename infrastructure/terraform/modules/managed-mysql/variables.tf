variable "cloud_provider" {
  description = "Cloud provider: aws, gcp, or azure"
  type        = string
  validation {
    condition     = contains(["aws", "gcp", "azure"], var.cloud_provider)
    error_message = "cloud_provider must be one of: aws, gcp, azure"
  }
}

variable "environment" {
  description = "Deployment environment"
  type        = string
}

variable "instance_name" {
  description = "Name of the MySQL instance"
  type        = string
}

variable "database_name" {
  description = "Name of the database"
  type        = string
  default     = "ots_db"
}

variable "mysql_version" {
  description = "MySQL engine version"
  type        = string
  default     = "8.0"
}

variable "instance_class" {
  description = "Instance class (AWS RDS)"
  type        = string
  default     = "db.t3.micro"
}

variable "allocated_storage" {
  description = "Allocated storage in GB (AWS RDS)"
  type        = number
  default     = 20
}

variable "db_username" {
  description = "Database master username"
  type        = string
  default     = "otsadmin"
}

variable "db_password" {
  description = "Database master password"
  type        = string
  sensitive   = true
}

variable "subnet_ids" {
  description = "Subnet IDs for the DB subnet group (AWS)"
  type        = list(string)
  default     = []
}

variable "vpc_id" {
  description = "VPC ID for security group (AWS)"
  type        = string
  default     = ""
}

# GCP-specific
variable "project_id" {
  description = "GCP Project ID"
  type        = string
  default     = ""
}

variable "gcp_region" {
  description = "GCP region"
  type        = string
  default     = "us-central1"
}

variable "gcp_network" {
  description = "GCP network name"
  type        = string
  default     = ""
}

# Azure-specific
variable "resource_group_name" {
  description = "Azure resource group name"
  type        = string
  default     = ""
}

variable "azure_location" {
  description = "Azure location"
  type        = string
  default     = "eastus"
}

variable "sku_name" {
  description = "Azure MySQL Flexible Server SKU"
  type        = string
  default     = "B_Standard_B1ms"
}
