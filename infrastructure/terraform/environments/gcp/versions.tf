terraform {
  required_version = ">= 1.10"

  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 6.0"
    }
    helm = {
      source  = "hashicorp/helm"
      version = "~> 2.0"
    }
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "~> 2.0"
    }
  }

  backend "gcs" {
    bucket = "ots-terraform-state-gcp"
    prefix = "environments/gcp"
  }
}

provider "google" {
  project = var.project_id
  region  = var.region
}

provider "helm" {
  kubernetes {
    host                   = "https://${module.gke_autopilot.cluster_endpoint}"
    cluster_ca_certificate = base64decode(module.gke_autopilot.cluster_ca_certificate)
    token                  = data.google_client_config.default.access_token
  }
}

provider "kubernetes" {
  host                   = "https://${module.gke_autopilot.cluster_endpoint}"
  cluster_ca_certificate = base64decode(module.gke_autopilot.cluster_ca_certificate)
  token                  = data.google_client_config.default.access_token
}

data "google_client_config" "default" {}
